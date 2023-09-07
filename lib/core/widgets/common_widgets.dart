import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonWidgets {
  static AppBar getAppBar({Widget? leading, List<Widget>? actions}) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      leading: leading ??
          Container(
            width: 10,
          ),
      centerTitle: false,
      leadingWidth: leading == null ? 5 : 20,
      title: Image.asset(
        'assets/images/logo.png',
      ),
      elevation: 0,
      actions: actions,
    );
  }
}
