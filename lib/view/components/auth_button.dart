import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';


import '../../controller/auth_controller.dart';
import '../style/style.dart';

class AuthButton extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController? passw;
  final String text;
  const AuthButton({super.key, required this.controller, this.passw, required this.text});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: double.infinity,
      height: 55.h,
      duration: const Duration(milliseconds: 400),
     
      decoration: BoxDecoration(
        color: controller.text.isEmpty
            ? Style.primaryColor
            :  Style.primaryDisabledColor,
        borderRadius: const BorderRadius.all(Radius.circular(32)),
      ),
      child: Center(
        child: context.watch<AuthController>().isLoading
            ? Padding(
                padding: const EdgeInsets.all(2.0),
                child: LoadingAnimationWidget.inkDrop(
                    color: Style.whiteColor, size: 35),
              )
            : Text(text,
                style: Style.textStyleRegular(textColor: Style.whiteColor)),
      ),
    );
  }
}
