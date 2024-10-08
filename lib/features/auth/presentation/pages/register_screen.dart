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
import '../../../../core/widgets/screen_default.dart';
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
    return DefaultScreen(
      sizeAppbar: Size.zero,
      horizontalPadding: 24.w,
      isAuth: true,
      backgroundColor: Colors.transparent,
      body: BlocConsumer<AuthCubit , AuthStates>(
        listener: (context, state) {
          if(state is RegisterSuccessState){
            navigateToAndRemoveNamed(route:Routes.baseScreen);
          }
        },
        builder:  (context, state) {
          return Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextWidget(
                      text: 'Sign Up',
                      fontColor: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 34.sp,
                    ),
                    SizedBox(height: 8.h,),
                    TextWidget(
                      text: 'Hello! let\'s join with us',
                      fontColor: AppColors.greyColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 18.h,),
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
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedRole,

                            items: const [
                              DropdownMenuItem(
                                value: 'Owner',
                                child: Text('Owner'),
                              ),
                              DropdownMenuItem(
                                value: 'Admin',
                                child: Text('Admin'),
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
                        const TextWidget(
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
                    ButtonCustomWidget(
                      text: 'Sign Up',
                      buttonHeight: 52.h,
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
                    SizedBox(height: 16.h,),
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
