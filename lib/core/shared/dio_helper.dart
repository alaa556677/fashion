import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:synchronized/synchronized.dart';
import '../../main.dart';
import '../constants/enum_constants.dart';
import '../constants/navigate_methods.dart';
import '../constants/routes.dart';
import '../constants/url_endPoints.dart';
import 'cache_helper.dart';

class DioHelper {
  static Dio? dio;
  static Dio? dioWorkSpace;
  static bool isRefreshing = false;
  static Dio? dioTicket;
  static final Lock lock = Lock();

  static Future<void> dioClient() async {
  dio?.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      enabled: kDebugMode,
      filter: (options, args){
        // don't print requests with uris containing '/posts'
        if(options.path.contains('/posts')){
          return false;
        }
        // don't print responses with unit8 list data
        return !args.isResponse || !args.hasUint8ListData;
      }
  )
  );
    dio!.interceptors.add(
      InterceptorsWrapper(
        /// This callback runs before a request is sent
        onRequest: (options, handler) async {
          final accessToken = CacheHelper.getData(key: Constants.token.toString());
          if (accessToken != null) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }
          return handler.next(options);
        },
        /// This callback is used to process the response from the server
        onResponse: (response, handler) {
          return handler.next(response);
        },
        /// This callback is triggered when an error occurs during a request
        onError: (DioException error, ErrorInterceptorHandler handler) async {
          if (error.response != null && error.response!.statusCode == 401) {
            RequestOptions origin = error.response!.requestOptions;

            if (!isRefreshing) {
              isRefreshing = true;
              try {
                final Response refreshTokenResponse = await dio!.post('/api/Auth/RefreshToken', data: {
                  // 'token': CacheHelper.getData(key: Constants.token.toString()),
                  'refreshToken': CacheHelper.getData(key: Constants.refreshToken.toString()),
                });

                if (refreshTokenResponse.statusCode == 401) {
                  CacheHelper.clearAllData();
                  navigateToNamed(route: Routes.login);

                  return handler.reject(error);
                }

                String token = refreshTokenResponse.data['data']['token'];
                String refreshToken = refreshTokenResponse.data['data']['refreshToken'];
                CacheHelper.saveData(key: Constants.token.toString(), value: token);
                CacheHelper.saveData(key: Constants.refreshToken.toString(), value: refreshToken);

                dio!.options.headers["Authorization"] = "Bearer $token";
                origin.headers["Authorization"] = "Bearer $token";

                if (origin.data is FormData) {
                  origin.data = await recreateFormData(origin.data);
                }

                // Retry the original request
                final Response response = await dio!.fetch(origin);
                return handler.resolve(response);
              } catch (err) {
                debugPrint(err.toString());
                CacheHelper.clearAllData();
                navigateToNamed(route: Routes.login);
                return handler.reject(error);
              } finally {
                isRefreshing = false;
              }
            } else {
              // Wait for the refresh token process to complete if already in progress
              await lock.synchronized(() {});
            }
          }
          return handler.next(error);
        },
      ),
    );
  }

  /// This method is used to create a new FormData instance from an existing one
  static Future<FormData> recreateFormData(FormData originalFormData) async {
    final FormData newFormData = FormData();

    // Copy fields
    originalFormData.fields.forEach((field) {
      newFormData.fields.add(MapEntry(field.key, field.value));
    });

    // Copy files with the clone method
    for (final MapEntry<String, MultipartFile> file in originalFormData.files) {
      final MultipartFile newFile = file.value.clone();
      newFormData.files.add(MapEntry(file.key, newFile));
    }

    return newFormData;
  }


  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: UrlConstants.baseurl,
        receiveDataWhenStatusError: true,
        headers: {
          'Authorization':
          "Bearer ${CacheHelper.getData(key: Constants.token.toString())}",
        },
      ),
    );

    dioClient();
  }

  static CancelToken cancelToken = CancelToken();

  static Future<Response> getData({
    @required String? url,
    @required Map<String, dynamic>? query,
    CancelToken? cancelToken,
  }) async {
    return await dio!.get(
      url!,
      queryParameters: query,
      cancelToken: cancelToken,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        "Accept-Language":Localizations.localeOf(currentContext).languageCode
      }),
    );
  }

  static Future<Response> postMultiPartData({
    @required String? url,
    @required dynamic data,
    String? token,
    Map<String, dynamic>? query,
    CancelToken? cancelToken,
  }) async {
    return await dio!.post(
      url!,
      queryParameters: query,
      data: data,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "multipart/form-data",
        // "Accept-Language":Localizations.localeOf(currentContext).languageCode
      }),
      cancelToken: cancelToken,
    );
  }

  static Future<Response> postData({
    @required String? url,
    @required dynamic data,
    String? token,
    Map<String, dynamic>? query,
    CancelToken? cancelToken,
  }) async {
    return await dio!.post(
      url!,
      queryParameters: query,
      data: data,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        // "Accept-Language":Localizations.localeOf(currentContext).languageCode
      }),
      cancelToken: cancelToken,
    );
  }


  static Future<Response> updateData({
    @required String? url,
    @required dynamic data,
    String? token,
    Map<String, dynamic>? query,
    CancelToken? cancelToken,
  }) async {
    return await dio!.put(
      url!,
      queryParameters: query,
      data: data,
      cancelToken: cancelToken,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
    );
  }

  // delete
  static Future<Response> deleteData({
    @required String? url,
    Map<String, dynamic>? query,
    CancelToken? cancelToken,
  }) async {
    return await dio!.delete(
      url!,
      queryParameters: query,
      cancelToken: cancelToken,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
    );
  }
}


// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'dart:io';
//
// import '../constants/enum_constants.dart';
// import '../constants/url_endPoints.dart';
// import 'cache_helper.dart';
//
// class DioHelper {
//   // static Dio? _dio;
//   // static DioHelper? _instance;
//   static Dio? dio;
// ////////////////////////////////////////////////////////////////////////////////
//   static init() {
//     dio = Dio(_getOptions());
//     return null;
//   }
//   // static init() {
//   //   dio = Dio(
//   //     BaseOptions(
//   //         baseUrl: UrlConstants.baseurl,
//   //         receiveDataWhenStatusError: true,
//   //         headers: {
//   //           'Authorization': "Bearer ${CacheHelper.getData(key: Constants.token.toString())}",
//   //         }),
//   //   );
//   // }
// ////////////////////////////////////////////////////////////////////////////////
// //   static Dio? get dio => _dio;
// ////////////////////////////////////////////////////////////////////////////////
// //   static void setDioAgain() {
// //     _dio = Dio(_getOptions());
// //   }
// ////////////////////////////////////////////////////////////////////////////////
//   static BaseOptions _getOptions() {
//     BaseOptions options = BaseOptions(
//       followRedirects: false,
//       validateStatus: (status) => status! <= 500,
//     );
//     options.connectTimeout = const Duration(seconds: 10); //10 sec
//     options.receiveTimeout = const Duration(seconds: 20 ); //20 sec
//     options.baseUrl = UrlConstants.baseurl;
//     options.headers = {
//       'Authorization': "Bearer ${CacheHelper.getData(key: Constants.token.toString())}",
//     };
//     options.queryParameters = {};
//     return options;
//   }
// ////////////////////////////////////////////////////////////////////////////////
//   static Future<Response> getData({
//     @required String? url,
//     @required Map<String, dynamic>? query,
//   }) async {
//     return await dio!.get(
//       url!,
//       queryParameters: query,
//     );
//   }
// ////////////////////////////////////////////////////////////////////////////////
//   static Future<Response> postData({
//     @required String? url,
//     @required dynamic data,
//     String? token,
//     Map<String, dynamic>? query,
//   }) async {
//     return await dio!.post(
//       url!,
//       queryParameters: query,
//       data: data,
//     );
//   }
// ////////////////////////////////////////////////////////////////////////////////
//   static Future<Response> putData({
//     @required String? url,
//     @required dynamic data,
//     String? token,
//     Map<String, dynamic>? query,
//   }) async {
//     return await dio!.put(
//       url!,
//       queryParameters: query,
//       data: data,
//     );
//   }
// ////////////////////////////////////////////////////////////////////////////////
//   static Future<Response> deleteData({
//     @required String? url,
//     Map<String, dynamic>? query,
//   }) async {
//     return await dio!.delete(
//       url!,
//       queryParameters: query,
//     );
//   }
// ////////////////////////////////////////////////////////////////////////////////
// }