import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'styles/colors.dart';


class CustomDropDownSearch extends StatefulWidget {
  CustomDropDownSearch(
      {this.prefix,
      this.suffix,
      this.items,
      this.onChange,
      this.hintText,
      this.title,
      this.subTitle,
      this.selectedItem,
      this.validator,
      this.focusNode,
      this.width = 538,
      this.height = 48,
      this.itemAsString,
      this.enabled = true,
      this.showSearchBox = false,
      });

  Widget? prefix;
  Widget? suffix;
  List? items;
  var onChange;
  String? hintText;
  String? title;
  String? subTitle;
  var selectedItem;
  var validator;
  FocusNode? focusNode;
  bool? isHover = false;
  double width;
  double height;
  String? itemAsString;
  bool enabled;
  bool showSearchBox;

  @override
  State<CustomDropDownSearch> createState() => _CustomDropDownSearchState();
}

class _CustomDropDownSearchState extends State<CustomDropDownSearch> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: Theme(
        data: ThemeData(
          highlightColor: Colors.white,
          hoverColor: Colors.white,
          focusColor: Colors.white,
          cardColor: Colors.white,
        ),
        child: SizedBox(
          // height: widget.height,
          width: widget.width,
          child: DropdownSearch(
            enabled: widget.enabled,

            dropdownButtonProps: DropdownButtonProps(
              color: Colors.grey,
              icon: const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.grey,),
              focusNode: widget.focusNode,
              hoverColor: Colors.white,
              focusColor: Colors.white,
              // highlightColor: Colors.white,
              // disabledColor: Colors.white,
              // splashColor: Colors.white,
            ),
            selectedItem: widget.selectedItem,
            popupProps: PopupProps.menu(
              showSearchBox: widget.showSearchBox,
              fit: FlexFit.loose,
              searchFieldProps: const TextFieldProps(
                autofocus: kIsWeb ? true : false,
              ),
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
              // baseStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
              //   color: blackColor,
              // ),
              dropdownSearchDecoration: InputDecoration(
                  helperStyle: TextStyle(height: .2.h),
                  helperText: "",
                  prefix: widget.prefix ?? null,
                  suffixIcon: widget.suffix,
                  suffix: widget.suffix,
                  errorStyle: TextStyle(height: .5.h),
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                      color: AppColors.brush,
                      fontFamily: "Dexef",
                      fontSize: 14
                  ),
                  contentPadding: const EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 10),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide:
                          BorderSide(color: Colors.grey, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide:
                          BorderSide(color: Colors.grey, width: 1)),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide:
                          BorderSide(color: Colors.grey, width: .5)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.red, width: .5))),
            ),
            items: widget.items!,
            onChanged: widget.onChange,
            validator: widget.validator,
            // itemAsString: (dynamic u) =>  userAsString(),
          ),
        ),
      ),
    );
  }

  // String userAsString() {
  //   return widget.itemAsString ?? '';
  // }

  onEntered(bool isHovered) {
    setState(() {
      widget.isHover = isHovered;
    });
  }
}
