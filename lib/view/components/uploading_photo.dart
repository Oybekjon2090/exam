import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../controller/auth_controller.dart';
import '../style/style.dart';

class UploadingPhoto extends StatelessWidget {
  const UploadingPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            context.read<AuthController>().getImageCamera();
          },
          child: Container(
            padding: EdgeInsets.all(18),
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Style.primaryDisabledColor),
            child: Row(
              children: [
                const Icon(
                  Icons.photo_camera,
                  color: Style.whiteColor,
                ),
                Text('Take photo', style: Style.textStyleRegular2(textColor: Style.whiteColor)),
              ],
            ),
          ),
        ),
        10.verticalSpace,
        24.verticalSpace,
        InkWell(
          onTap: () {
            context.read<AuthController>().getImageGallery();
          },
          child: Container(
            padding: EdgeInsets.all(18),
            decoration:  BoxDecoration(
               borderRadius: BorderRadius.circular(24),
                color: Style.primaryDisabledColor),
            child:  Row(
              children: [
                Icon(
                  Icons.photo,
                  color: Style.whiteColor,
                ),
                Text('From gallery', style: Style.textStyleRegular2(textColor: Style.whiteColor)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
