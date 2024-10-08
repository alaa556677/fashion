import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultScreen extends StatelessWidget{
  final Color? backgroundColor;
  final Size sizeAppbar;
  final Widget? titleWidget;
  final Widget? bottomNavigationBar;
  final Widget? body;
  final Widget? floatingActionButton;
  final List<Widget>? actions;
  final double horizontalPadding;
  final double topPadding;
  final bool centerTitle;
  final bool isAuth;


  const DefaultScreen({super.key,
    this.backgroundColor,
    required this.sizeAppbar,
    this.titleWidget,
    this.actions,
    this.bottomNavigationBar,
    this.body,
    this.horizontalPadding = 20,
    this.topPadding = 0,
    this.centerTitle = false,
    this.floatingActionButton,
    this.isAuth = false
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if(isAuth)...[
          Image.asset(
            "assets/images/background.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          )
        ],
        Scaffold(
          backgroundColor: backgroundColor,
          appBar: PreferredSize(
            preferredSize: sizeAppbar,
            child: AppBar(
              surfaceTintColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark,
              ),
              title: titleWidget,
              actions: actions,
              centerTitle:centerTitle ,
            ),
          ),
          bottomNavigationBar: bottomNavigationBar,
          body: Padding(
            padding: EdgeInsetsDirectional.only(
              start: horizontalPadding,
              end: horizontalPadding,
              top : topPadding
            ),
            child: body
          ),
          floatingActionButton: floatingActionButton,
          // floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
        ),
      ],
    );
  }
}