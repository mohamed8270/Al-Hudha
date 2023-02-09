import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salamapp/theme/colors.dart';

// ignore: use_key_in_widget_constructors
class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widget = (Platform.isAndroid)
        ? const CircularProgressIndicator(
            color: Zred,
          )
        : const CupertinoActivityIndicator(
            color: Zred,
          );
    return Container(
      alignment: Alignment.center,
      child: widget,
    );
  }
}
