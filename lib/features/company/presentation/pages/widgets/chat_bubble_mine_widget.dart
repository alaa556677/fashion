import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/images_path.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/widgets/richText_default.dart';
import '../../../../../core/widgets/text_default.dart';
import '../../../data/model/message_model.dart';

class ChatBubbleMineWidget extends StatelessWidget{
  final MessagesModel messagesEntity;
  const ChatBubbleMineWidget({super.key, required this.messagesEntity});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 4.h,),
                    Container(
                        padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.blackColor.withOpacity(.16),
                                blurRadius: 5,
                                offset: const Offset (0,0)
                            )
                          ],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(2),
                            bottomRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                        ),
                        child: RichTextWidget(
                          text: messagesEntity.message,
                          fontColor: AppColors.labelColor,
                          fontSize: 14.sp,
                          fontWeight: AppFontWeight.normal,
                        )
                    ),
                  ],
                ),
                SizedBox(height: 6.h,),
                TextWidget(
                  text: messagesEntity.time,
                  fontSize: 10.sp,
                  fontWeight: AppFontWeight.normal,
                  fontColor: AppColors.textColorOnBoarding,
                ),
              ],
            ),
          ),
          SizedBox(width: 6.w,),
          SvgPicture.asset(AppImagesPath.mineChatImage),
        ],
      ),
    );
  }
}
