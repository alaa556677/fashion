import 'package:fashion/features/company/presentation/pages/widgets/chat_bubble_mine_widget.dart';
import 'package:fashion/features/company/presentation/pages/widgets/chat_other_bubble_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/constants_methods.dart';
import '../../../../core/constants/icons_path.dart';
import '../../../../core/constants/images_path.dart';
import '../../../../core/constants/navigate_methods.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/screen_default.dart';
import '../../../../core/widgets/search_text_form_field.dart';
import '../../../../core/widgets/text_default.dart';
import '../../../../core/widgets/text_form_field_default.dart';
import '../../../base_screen/presentation/pages/base_screen.dart';
import '../../../home/presentation/cubit/home_cubit.dart';
import '../../../home/presentation/cubit/home_states.dart';
import '../../../products/data/model/products_data_model.dart';
import '../../data/model/message_model.dart';

class ChatScreen extends StatefulWidget{
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController chatController = TextEditingController();
  final scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    HomeCubit.instance.initDummy();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    chatController.clear();
    super.initState();
  }

  @override
  void dispose() {
    chatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return DefaultScreen(
          sizeAppbar: Size.zero,
          backgroundColor: AppColors.whiteColor,
          horizontalPadding: 0,
          body: Column(
            children: [
              SizedBox(height: 30.h,),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          InkWell(
                              onTap: (){
                                navigateToNamed(route: Routes.baseScreen);
                              },
                              child: SvgPicture.asset(AppImagesPath.mineChatImage)),
                          SizedBox(width: 20.w,),
                          Expanded(
                            child: TextWidget(
                              text: arguments["suppliersData"].supplierName,
                              fontSize: 16.sp,
                              fontWeight: AppFontWeight.semiBold,
                              fontColor: AppColors.textColorCategory,
                              maxLines: 1,
                              textOverflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      )
                    ),
                    SizedBox(width: 10.w,),
                    Icon(Icons.more_vert, color: AppColors.textColorCategory,),
                    // SvgPicture.asset(AppIconsPath.moreIcon,),
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              Container(
                width: AppScreenSize.screenWidth(context), height: 1,
                decoration: BoxDecoration(
                  color: AppColors.buttonColorCategory,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset (0,0),
                      blurRadius: 5,
                      color: AppColors.blackColor.withOpacity(.16),
                    )
                  ]
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 12.h,),
                    Expanded(
                      child: ListView.separated(
                        reverse: true,
                        itemBuilder: (context, index) => arguments["messagesList"][index].sendByMe
                            ? ChatBubbleMineWidget(messagesEntity: arguments["messagesList"][index],)
                            : ChatBubbleOtherWidget(messagesEntity: arguments["messagesList"][index],),
                        itemCount: arguments["messagesList"].length,
                        separatorBuilder: (context, index) => SizedBox(height: 20.h,),
                        controller: scrollController,
                      ),
                    ),
                    SizedBox(height: 12.h,),
                    Container(width: double.infinity, height: 1.h, color: AppColors.buttonColorCategory,),
                    SizedBox(height: 16.h,),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 48,
                        child: ChatTextFormField(
                          controller: chatController,
                          radius: 16.r,
                          endPadding: 8.w,
                          hintText: 'Write Message …',
                          icon: SvgPicture.asset(AppIconsPath.attachIcon),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(AppIconsPath.emojiIcon),
                              SizedBox(width: 12.w,),
                              SvgPicture.asset(AppIconsPath.micIcon),
                              SizedBox(width: 8.w,),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.blackColor.withOpacity(.16),
                              blurRadius: 5,
                              offset: const Offset(0,2),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    InkWell(
                      onTap: (){
                        setState(() {
                          arguments["messagesList"].insert (0 , MessagesModel(
                              message: chatController.text,
                              sendByMe: true,
                              time: '6:33 Pm'
                          ));
                          chatController.clear();
                        });
                      },
                      child: SvgPicture.asset(AppIconsPath.sendIcon)),
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
            ],
          ),
        );
      },
    );
  }
}