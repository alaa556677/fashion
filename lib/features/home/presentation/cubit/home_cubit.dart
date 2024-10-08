import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/images_path.dart';
import '../../../../main.dart';
import '../../../company/data/model/message_model.dart';
import '../../../products/data/model/products_data_model.dart';
import '../../data/models/category_model.dart';
import '../../data/models/product_model.dart';
import 'home_states.dart';

class HomeCubit extends Cubit <HomeStates>{
  HomeCubit() : super(InitialHomeState());
  static final HomeCubit _homeCubit = BlocProvider.of<HomeCubit>(navigatorKey.currentState!.context);
  static HomeCubit get instance => _homeCubit;
////////////////////////////////////////////////////////////////////////////////
  int currentTabIndex = 0;
  changeTabBarIndex(int newIndex) {
    currentTabIndex = newIndex;
    emit(TabBarIndexChanged(currentTabIndex));
  }

  int currentTabIndexSupplier = 0;
  changeTabBarIndexSupplier (int newIndex) {
    currentTabIndexSupplier = newIndex;
    emit(TabBarIndexChangedSupplier(currentTabIndexSupplier));
  }
////////////////////////////////////////////////////////////////////////////////
  List <CategoryModel> categoryList = [];
  List <ProductDataModel> topRankList = [];
  List <ProductDataModel> vehiclePartsList = [];
  List <ProductDataModel> modernList = [];
  List <ProductDataModel> recentlyArriveList = [];
  List <ProductDataModel> companyProducts = [];
  List <MessagesModel> messagesList = [];
  initDummy(){
    categoryList = [
      CategoryModel(name: 'Vehicle Parts'),
      CategoryModel(name: 'Electronics'),
      CategoryModel(name: 'Sports'),
      CategoryModel(name: 'Home Appliances'),
    ];
    modernList = [
      ProductDataModel (
        productModel: ProductModel(
            imagePath: AppImagesPath.mobileImage,
            productName: 'iPhone 14pro',
            description: 'New,Modern Ios System',
            price: '999.0'
        ),
        productColors: [
          ProductColors (productColor: '#274268'),
          ProductColors (productColor: '#001127'),
          ProductColors (productColor: '#0075F4'),
        ],
        fullDescription: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took' ,
        attributes: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took',
        suppliersData: SuppliersData(
          supplierName: 'Frist Star Company For Sportive Aquipments',
          createFrom: '7 years',
          review: '3.7/6',
          description: 'Sports Equipment, Sporting Equipment, Also Called As Sporting Goods, Are The Tools, Materials, Apparel, And Gear Used To Compete In A Sport And Varies Depending On The Sport. The Equipment Ranges From Balls, Nets',
          supplierAddress: SupplierAddress(
              countryName: 'Chinia',
              cityName: 'Guangzhou'
          )
        )
      ),
      ProductDataModel (
          productModel: ProductModel (
              imagePath: AppImagesPath.seaContainer,
              productName: 'Sea and air freight forwarders',
              description: 'High quality and easy to use',
              price: '30,00'
          ),
          productColors: [
            ProductColors (productColor: '#274268'),
            ProductColors (productColor: '#001127'),
            ProductColors (productColor: '#0075F4'),
          ],
          fullDescription: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took' ,
          attributes: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took',
          suppliersData: SuppliersData(
              supplierName: 'Frist Star Company For Sportive Aquipments',
              createFrom: '7 years',
              review: '3.7/6',
              description: 'Sports Equipment, Sporting Equipment, Also Called As Sporting Goods, Are The Tools, Materials, Apparel, And Gear Used To Compete In A Sport And Varies Depending On The Sport. The Equipment Ranges From Balls, Nets',
              supplierAddress: SupplierAddress(
                  countryName: 'Chinia',
                  cityName: 'Guangzhou'
              )
          )
      ),
    ];
    vehiclePartsList = [
      ProductDataModel (
          productModel: ProductModel (
              imagePath: AppImagesPath.energyCell,
              productName: 'Renewable energy cell ',
              description: 'description',
              price: '500.0'
          ),
          productColors: [
            ProductColors (productColor: '#274268'),
            ProductColors (productColor: '#001127'),
            ProductColors (productColor: '#0075F4'),
          ],
          fullDescription: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took' ,
          attributes: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took',
          suppliersData: SuppliersData(
              supplierName: 'Frist Star Company For Sportive Aquipments',
              createFrom: '7 years',
              review: '3.7/6',
              description: 'Sports Equipment, Sporting Equipment, Also Called As Sporting Goods, Are The Tools, Materials, Apparel, And Gear Used To Compete In A Sport And Varies Depending On The Sport. The Equipment Ranges From Balls, Nets',
              supplierAddress: SupplierAddress(
                  countryName: 'Chinia',
                  cityName: 'Guangzhou'
              )
          )
      ),
      ProductDataModel (
          productModel: ProductModel (
              imagePath: AppImagesPath.childrenToy,
              productName: 'Children\'s toy bag',
              description: 'description',
              price: '3.5'
          ),
          productColors: [
            ProductColors (productColor: '#274268'),
            ProductColors (productColor: '#001127'),
            ProductColors (productColor: '#0075F4'),
          ],
          fullDescription: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took' ,
          attributes: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took',
          suppliersData: SuppliersData(
              supplierName: 'Frist Star Company For Sportive Aquipments',
              createFrom: '7 years',
              review: '3.7/6',
              description: 'Sports Equipment, Sporting Equipment, Also Called As Sporting Goods, Are The Tools, Materials, Apparel, And Gear Used To Compete In A Sport And Varies Depending On The Sport. The Equipment Ranges From Balls, Nets',
              supplierAddress: SupplierAddress(
                  countryName: 'Chinia',
                  cityName: 'Guangzhou'
              )
          )
      ),
    ];
    topRankList = [
      ProductDataModel (
          productModel: ProductModel (
              imagePath: AppImagesPath.chocolateImage,
              productName: 'Chocolate production line',
              description: 'description',
              price: '1500'
          ),
          productColors: [
            ProductColors (productColor: '#274268'),
            ProductColors (productColor: '#001127'),
            ProductColors (productColor: '#0075F4'),
          ],
          fullDescription: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took' ,
          attributes: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took',
          suppliersData: SuppliersData(
              supplierName: 'Frist Star Company For Sportive Aquipments',
              createFrom: '7 years',
              review: '3.7/6',
              description: 'Sports Equipment, Sporting Equipment, Also Called As Sporting Goods, Are The Tools, Materials, Apparel, And Gear Used To Compete In A Sport And Varies Depending On The Sport. The Equipment Ranges From Balls, Nets',
              supplierAddress: SupplierAddress(
                  countryName: 'Chinia',
                  cityName: 'Guangzhou'
              )
          )
      ),
      ProductDataModel (
          productModel: ProductModel (
              imagePath: AppImagesPath.gymWheel,
              productName: 'Gym wheel',
              description: 'description',
              price: '900'
          ),
          productColors: [
            ProductColors (productColor: '#274268'),
            ProductColors (productColor: '#001127'),
            ProductColors (productColor: '#0075F4'),
          ],
          fullDescription: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took' ,
          attributes: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took',
          suppliersData: SuppliersData(
              supplierName: 'Frist Star Company For Sportive Aquipments',
              createFrom: '7 years',
              review: '3.7/6',
              description: 'Sports Equipment, Sporting Equipment, Also Called As Sporting Goods, Are The Tools, Materials, Apparel, And Gear Used To Compete In A Sport And Varies Depending On The Sport. The Equipment Ranges From Balls, Nets',
              supplierAddress: SupplierAddress(
                  countryName: 'Chinia',
                  cityName: 'Guangzhou'
              )
          )
      ),
    ];
    recentlyArriveList = [
      ProductDataModel (
          productModel: ProductModel (
              imagePath: AppImagesPath.messageDevice,
              productName: 'Massage Device',
              description: 'Multifunctional',
              price: '5.00-10.00'
          ),
          productColors: [
            ProductColors (productColor: '#274268'),
            ProductColors (productColor: '#001127'),
            ProductColors (productColor: '#0075F4'),
          ],
          fullDescription: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took' ,
          attributes: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took',
          suppliersData: SuppliersData(
              supplierName: 'Frist Star Company For Sportive Aquipments',
              createFrom: '7 years',
              review: '3.7/6',
              description: 'Sports Equipment, Sporting Equipment, Also Called As Sporting Goods, Are The Tools, Materials, Apparel, And Gear Used To Compete In A Sport And Varies Depending On The Sport. The Equipment Ranges From Balls, Nets',
              supplierAddress: SupplierAddress(
                  countryName: 'Chinia',
                  cityName: 'Guangzhou'
              )
          )
      ),
      ProductDataModel (
          productModel: ProductModel (
              imagePath: AppImagesPath.athleticsMachine,
              productName: 'Athletics Machine',
              description: 'Multifunctional',
              price: '20.00-25.00'
          ),
          productColors: [
            ProductColors (productColor: '#274268'),
            ProductColors (productColor: '#001127'),
            ProductColors (productColor: '#0075F4'),
          ],
          fullDescription: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took' ,
          attributes: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took',
          suppliersData: SuppliersData(
              supplierName: 'Frist Star Company For Sportive Aquipments',
              createFrom: '7 years',
              review: '3.7/6',
              description: 'Sports Equipment, Sporting Equipment, Also Called As Sporting Goods, Are The Tools, Materials, Apparel, And Gear Used To Compete In A Sport And Varies Depending On The Sport. The Equipment Ranges From Balls, Nets',
              supplierAddress: SupplierAddress(
                  countryName: 'Chinia',
                  cityName: 'Guangzhou'
              )
          )
      ),
      ProductDataModel (
          productModel: ProductModel (
              imagePath: AppImagesPath.footballImage,
              productName: 'Football',
              description: 'Sports championship ball',
              price: '1.00-3.00'
          ),
          productColors: [
            ProductColors (productColor: '#274268'),
            ProductColors (productColor: '#001127'),
            ProductColors (productColor: '#0075F4'),
          ],
          fullDescription: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took' ,
          attributes: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took',
          suppliersData: SuppliersData(
              supplierName: 'Frist Star Company For Sportive Aquipments',
              createFrom: '7 years',
              review: '3.7/6',
              description: 'Sports Equipment, Sporting Equipment, Also Called As Sporting Goods, Are The Tools, Materials, Apparel, And Gear Used To Compete In A Sport And Varies Depending On The Sport. The Equipment Ranges From Balls, Nets',
              supplierAddress: SupplierAddress(
                  countryName: 'Chinia',
                  cityName: 'Guangzhou'
              )
          )
      ),
      ProductDataModel (
          productModel: ProductModel (
              imagePath: AppImagesPath.boxingGloves,
              productName: 'boxing gloves',
              description: 'available in several color',
              price: '2.00-4.00'
          ),
          productColors: [
            ProductColors (productColor: '#274268'),
            ProductColors (productColor: '#001127'),
            ProductColors (productColor: '#0075F4'),
          ],
          fullDescription: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took' ,
          attributes: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took',
          suppliersData: SuppliersData(
              supplierName: 'Frist Star Company For Sportive Aquipments',
              createFrom: '7 years',
              review: '3.7/6',
              description: 'Sports Equipment, Sporting Equipment, Also Called As Sporting Goods, Are The Tools, Materials, Apparel, And Gear Used To Compete In A Sport And Varies Depending On The Sport. The Equipment Ranges From Balls, Nets',
              supplierAddress: SupplierAddress(
                  countryName: 'Chinia',
                  cityName: 'Guangzhou'
              )
          )
      ),
    ];
    companyProducts = [
      ProductDataModel (
          productModel: ProductModel (
              imagePath: AppImagesPath.messageDevice,
              productName: 'Massage Device',
              description: 'Multifunctional',
              price: '5.00-10.00'
          ),
          productColors: [
            ProductColors (productColor: '#274268'),
            ProductColors (productColor: '#001127'),
            ProductColors (productColor: '#0075F4'),
          ],
          fullDescription: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took' ,
          attributes: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took',
          suppliersData: SuppliersData(
              supplierName: 'Frist Star Company For Sportive Aquipments',
              createFrom: '7 years',
              review: '3.7/6',
              description: 'Sports Equipment, Sporting Equipment, Also Called As Sporting Goods, Are The Tools, Materials, Apparel, And Gear Used To Compete In A Sport And Varies Depending On The Sport. The Equipment Ranges From Balls, Nets',
              supplierAddress: SupplierAddress(
                  countryName: 'Chinia',
                  cityName: 'Guangzhou'
              )
          )
      ),
      ProductDataModel (
          productModel: ProductModel (
              imagePath: AppImagesPath.athleticsMachine,
              productName: 'Athletics Machine',
              description: 'Multifunctional',
              price: '20.00-25.00'
          ),
          productColors: [
            ProductColors (productColor: '#274268'),
            ProductColors (productColor: '#001127'),
            ProductColors (productColor: '#0075F4'),
          ],
          fullDescription: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took' ,
          attributes: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took',
          suppliersData: SuppliersData(
              supplierName: 'Frist Star Company For Sportive Aquipments',
              createFrom: '7 years',
              review: '3.7/6',
              description: 'Sports Equipment, Sporting Equipment, Also Called As Sporting Goods, Are The Tools, Materials, Apparel, And Gear Used To Compete In A Sport And Varies Depending On The Sport. The Equipment Ranges From Balls, Nets',
              supplierAddress: SupplierAddress(
                  countryName: 'Chinia',
                  cityName: 'Guangzhou'
              )
          )
      ),
      ProductDataModel (
          productModel: ProductModel (
              imagePath: AppImagesPath.footballImage,
              productName: 'Football',
              description: 'Sports championship ball',
              price: '1.00-3.00'
          ),
          productColors: [
            ProductColors (productColor: '#274268'),
            ProductColors (productColor: '#001127'),
            ProductColors (productColor: '#0075F4'),
          ],
          fullDescription: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took' ,
          attributes: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took',
          suppliersData: SuppliersData(
              supplierName: 'Frist Star Company For Sportive Aquipments',
              createFrom: '7 years',
              review: '3.7/6',
              description: 'Sports Equipment, Sporting Equipment, Also Called As Sporting Goods, Are The Tools, Materials, Apparel, And Gear Used To Compete In A Sport And Varies Depending On The Sport. The Equipment Ranges From Balls, Nets',
              supplierAddress: SupplierAddress(
                  countryName: 'Chinia',
                  cityName: 'Guangzhou'
              )
          )
      ),
      ProductDataModel (
          productModel: ProductModel (
              imagePath: AppImagesPath.boxingGloves,
              productName: 'boxing gloves',
              description: 'available in several color',
              price: '2.00-4.00'
          ),
          productColors: [
            ProductColors (productColor: '#274268'),
            ProductColors (productColor: '#001127'),
            ProductColors (productColor: '#0075F4'),
          ],
          fullDescription: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took' ,
          attributes: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took',
          suppliersData: SuppliersData(
              supplierName: 'Frist Star Company For Sportive Aquipments',
              createFrom: '7 years',
              review: '3.7/6',
              description: 'Sports Equipment, Sporting Equipment, Also Called As Sporting Goods, Are The Tools, Materials, Apparel, And Gear Used To Compete In A Sport And Varies Depending On The Sport. The Equipment Ranges From Balls, Nets',
              supplierAddress: SupplierAddress(
                  countryName: 'Chinia',
                  cityName: 'Guangzhou'
              )
          )
      ),
      ProductDataModel (
          productModel: ProductModel (
              imagePath: AppImagesPath.fatImage,
              productName: 'Fat Disintegration',
              description: 'special prices',
              price: '100-500'
          ),
          productColors: [
            ProductColors (productColor: '#274268'),
            ProductColors (productColor: '#001127'),
            ProductColors (productColor: '#0075F4'),
          ],
          fullDescription: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took' ,
          attributes: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took',
          suppliersData: SuppliersData(
              supplierName: 'Frist Star Company For Sportive Aquipments',
              createFrom: '7 years',
              review: '3.7/6',
              description: 'Sports Equipment, Sporting Equipment, Also Called As Sporting Goods, Are The Tools, Materials, Apparel, And Gear Used To Compete In A Sport And Varies Depending On The Sport. The Equipment Ranges From Balls, Nets',
              supplierAddress: SupplierAddress(
                  countryName: 'Chinia',
                  cityName: 'Guangzhou'
              )
          )
      ),
      ProductDataModel (
          productModel: ProductModel (
              imagePath: AppImagesPath.footballClothes,
              productName: 'Football Clothes',
              description: 'modern',
              price: '4.00-7.00'
          ),
          productColors: [
            ProductColors (productColor: '#274268'),
            ProductColors (productColor: '#001127'),
            ProductColors (productColor: '#0075F4'),
          ],
          fullDescription: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took' ,
          attributes: 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took',
          suppliersData: SuppliersData(
              supplierName: 'Frist Star Company For Sportive Aquipments',
              createFrom: '7 years',
              review: '3.7/6',
              description: 'Sports Equipment, Sporting Equipment, Also Called As Sporting Goods, Are The Tools, Materials, Apparel, And Gear Used To Compete In A Sport And Varies Depending On The Sport. The Equipment Ranges From Balls, Nets',
              supplierAddress: SupplierAddress(
                  countryName: 'Chinia',
                  cityName: 'Guangzhou'
              )
          )
      ),
    ];
    messagesList = [
      MessagesModel(
        message: 'How can help you',
        sendByMe: false,
        time: '6:17 Pm',
      ),
      MessagesModel(
        message: 'Yes have i am lina',
        sendByMe: false,
        time: '6:12Pm',
      ),
      MessagesModel(
        message: 'Do you have contact number export manager',
        sendByMe: true,
        time: '6:10 Pm',
      ), MessagesModel(
        message: 'Here we are, the first star company for sports equipment. How can I help you?',
        sendByMe: false,
        time: '6:10 Pm',
      ),
      MessagesModel(
          message: 'hi',
          sendByMe: true,
          time: '6:08 Pm',
      ),
    ];
  }
}