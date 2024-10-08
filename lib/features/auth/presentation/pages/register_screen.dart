import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/icons_path.dart';
import '../../../../core/constants/navigate_methods.dart';
import '../../../../core/constants/regex.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/button_default.dart';
import '../../../../core/widgets/default_text_form_field.dart';
import '../../../../core/widgets/password_text_field.dart';
import '../../../../core/widgets/text_default.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_states.dart';
import '../widgets/top_circle.dart';
import 'dart:ui' as ui;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool agreeToPrivacyPolicy = false;

  int registerId = 1;
  String selectedRole = 'Owner';

  @override
  Widget build(BuildContext context) {
    AuthCubit.instance.clearErrorMessage();
    return Scaffold(
      body: BlocConsumer<AuthCubit , AuthStates>(
        listener: (context, state) {
          if(state is RegisterSuccessState){
            navigateToAndRemoveNamed(route:Routes.baseScreen);
          }
        },
        builder:  (context, state) {
          return Container(
            color: const Color(0xffF1F0F0),
            height: MediaQuery.of(context).size.height,
            child:
            Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadiusDirectional.only(
                              bottomEnd: Radius.circular(100))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TopCircle(),
                          SizedBox(
                            height: 90.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 36.w),
                                  child: TextWidget(
                                    text: 'Sign Up',
                                    fontColor: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 34.sp,
                                  ),
                                ),
                                SizedBox(height: 8.h,),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 36.w),
                                  child: TextWidget(
                                    text: 'Hello! let\'s join with us',
                                    fontColor: AppColors.greyColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(height: 18.h,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 24.w),
                          child: Column(
                            children: [
                              DefaultTextFormField(
                                hintText: 'User Name',
                                controller: userNameController,
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
                              ),
                              SizedBox(height: 14.h,),
                              DefaultTextFormField(
                                hintText: 'email',
                                controller: emailController,
                                borderRadius: 8,
                                validator: (value) {
                                  if(value!.isEmpty) {
                                    return "required Field";
                                  } else if (!emailRegexNew.hasMatch(value)) {
                                    return 'invalid email';
                                  }
                                },
                                onChanged: (_){
                                  AuthCubit.instance.clearErrorMessage();
                                },
                                filledColor: Colors.white,
                                prefix: Padding(
                                  padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                                  child: SvgPicture.asset(AppIconsPath.emailIcon, height: 14.h, width: 18.w,),
                                ),
                              ),
                              SizedBox(height: 14.h,),
                              PasswordTextFormField(
                                hintText: 'password',
                                controller: passwordController,
                                filledColor: Colors.white,
                                borderRadius: 8,
                                validator: (value) {
                                  if(value!.isEmpty) {
                                    return "required Field";
                                  }else if (!passwordRegex.hasMatch(value)) {
                                    return 'minimum 8 characters,uppercase,lowercase';
                                  }
                                },
                                onChanged: (_){
                                  AuthCubit.instance.clearErrorMessage();
                                },
                                prefix: Padding(
                                  padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                                  child: SvgPicture.asset(AppIconsPath.passwordIcon, height: 18.h, width: 18.w,),
                                ),
                              ),
                              SizedBox(height: 14.h,),
                              PasswordTextFormField(
                                hintText: 'confirm Password',
                                controller: confirmPasswordController,
                                filledColor: Colors.white,
                                borderRadius: 8,
                                validator: (value) {
                                  if(value!.isEmpty) {
                                    return "required Field";
                                  }else if(passwordController.text != confirmPasswordController.text){
                                    return "password Not Identical";
                                  }
                                  return null;
                                },
                                onChanged: (_){
                                  AuthCubit.instance.clearErrorMessage();
                                },
                                prefix: Padding(
                                  padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                                  child: SvgPicture.asset(AppIconsPath.passwordIcon, height: 18.h, width: 18.w,),
                                ),
                              ),
                              SizedBox(height: 12.h,),
                              Theme(
                                data: ThemeData(
                                  canvasColor:  Colors.white,
                                ),
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                                  decoration: BoxDecoration(
                                  color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(8.r))
                                  ),
                                  child: DropdownButton<String>(
                                    value: selectedRole,
                                    items: [
                                      DropdownMenuItem(
                                        child: Text('Owner'),
                                        value: 'Owner',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('Admin'),
                                        value: 'Admin',
                                      ),
                                    ],
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedRole = newValue!;
                                        registerId = (selectedRole == 'Owner') ? 1 : 0;
                                      });
                                        AuthCubit.instance.clearErrorMessage();
                                    },
                                  ),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    value: agreeToPrivacyPolicy,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        agreeToPrivacyPolicy = value ?? false;
                                      });
                                    },
                                  ),
                                  TextWidget(
                                    text: 'I agree with privacy policy',
                                    fontColor: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: TextWidget(
                                    text: AuthCubit.instance.errorMessage ??'',
                                    fontColor:Colors.red,
                                    fontSize: 16.sp
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8.h,),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: Stack(
                        children: [
                          Image.asset('assets/images/signup_circle.PNG',width: double.infinity,fit: BoxFit.fill,),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 24.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 22.h,),
                                ButtonCustomWidget(
                                  text: 'Sign Up',
                                  buttonHeight: 40.h,
                                  color: AppColors.tabTextSelected,
                                  buttonColor: Colors.white,
                                  loadingWidget: state is RegisterLoadingState
                                      ? CircularProgressIndicator(color: AppColors.tabTextSelected,strokeWidth: 2,) : null,
                                  onPressed: (){
                                    if(formKey.currentState!.validate()){
                                      if(agreeToPrivacyPolicy == true){
                                        AuthCubit.instance.register(
                                            role: registerId,
                                            userName: userNameController.text,
                                            email: emailController.text,
                                            password: passwordController.text
                                        );
                                      }else{
                                          AuthCubit.instance.errorPrivacyPolicy();
                                      }
                                    }
                                  },
                                ),
                                SizedBox(height: 28.h,),
                                Row(
                                  children: [
                                    TextWidget(
                                        text: 'You already have an account? ',
                                        fontColor:Colors.white,
                                        fontSize: 16.sp
                                    ),
                                    GestureDetector(
                                      onTap: () => navigateToNamed(route:Routes.login),
                                      child: TextWidget(
                                          text: 'Sign In',
                                          fontColor: AppColors.tabTextSelected,
                                          fontSize: 16.sp
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
