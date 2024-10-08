import 'package:fashion/core/widgets/screen_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/constants/icons_path.dart';
import '../../../../core/constants/navigate_methods.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/button_default.dart';
import '../../../../core/widgets/default_text_form_field.dart';
import '../../../../core/widgets/password_text_field.dart';
import '../../../../core/widgets/text_default.dart';
import '../cubit/auth_cubit.dart';

import '../cubit/auth_states.dart';
import '../widgets/top_circle.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AuthCubit.instance.clearErrorMessage();
    return DefaultScreen(
      sizeAppbar: Size.zero,
      horizontalPadding: 24.w,
      isAuth: true,
      backgroundColor: Colors.transparent,
      body: BlocConsumer<AuthCubit , AuthStates>(
        listener: (context, state) {
          if(state is LoginSuccessState ){
            navigateToAndRemoveNamed(route:Routes.baseScreen);
          }else if (state is LoginFailureState || state is LoginErrorState){
            Fluttertoast.showToast(msg: AuthCubit.instance.errorMessage??'Invalid login',backgroundColor: Colors.red);
          }
        },
        builder:  (context, state) {
          return Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: 'Sign In',
                      fontColor: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 34.sp,
                    ),
                    SizedBox(height: 8.h),
                    TextWidget(
                      text: 'Hey! Good to see you again',
                      fontColor: AppColors.greyColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 40.h),
                    DefaultTextFormField(
                      hintText: 'email',
                      controller: emailController,
                      borderRadius: 8,
                      validator: (value) {
                        if(value!.isEmpty) {
                          return "required Field";
                        }
                      },
                      filledColor: Colors.white,
                      prefix: Padding(
                        padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                        child: SvgPicture.asset(AppIconsPath.emailIcon, height: 14.h, width: 18.w,),
                      ),
                      onChanged: (_){
                        AuthCubit.instance.clearErrorMessage();
                      },
                    ),
                    SizedBox(height: 14.h),
                    PasswordTextFormField(
                      hintText: 'Password',
                      controller: passwordController,
                      filledColor: Colors.white,
                      borderRadius: 8,
                      validator: (value) {
                        if(value!.isEmpty) {
                          return "required Field";
                        }
                      },
                      prefix: Padding(
                        padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                        child: SvgPicture.asset(AppIconsPath.passwordIcon, height: 18.h, width: 18.w,),
                      ),
                      onChanged: (_){
                        AuthCubit.instance.clearErrorMessage();
                      },
                    ),
                    SizedBox(height: 10.h),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: TextWidget(
                        text: 'Forget Password?',
                        fontColor: AppColors.blackColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    ButtonCustomWidget(
                      text: 'Sign In',
                      buttonHeight: 52.h,
                      color: AppColors.blackColor,
                      buttonColor: Colors.white,
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          AuthCubit.instance.clearErrorMessage();
                          AuthCubit.instance.login(email: emailController.text, password: passwordController.text);
                        }
                      },
                      loadingWidget: state is LoginLoadingState
                          ? CircularProgressIndicator(color: AppColors.tabTextSelected,strokeWidth: 2,) : null,
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                            text: 'Don\'t have an account? ',
                            fontColor: AppColors.blackColor,
                            fontSize: 16.sp
                        ),
                        GestureDetector(
                          onTap: () => navigateToNamed(route:Routes.register),
                          child: TextWidget(
                              text: 'Sign Up',
                              fontColor: AppColors.tabTextSelected,
                              fontSize: 16.sp
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

