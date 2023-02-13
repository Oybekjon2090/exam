import 'dart:io';

import 'package:exam/controller/auth_controller.dart';
import 'package:exam/view/components/uploading_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../controller/user_controller.dart';
import 'cached_network_image.dart';
import 'photo_editing.dart';

class EditImage extends StatelessWidget {
  const EditImage({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        
          context.watch<AuthController>().imagePath.isEmpty
              ? const SizedBox.shrink()
              : Stack(
                  children: [
                    Container(
                      width: 150.w,
                      height: 150.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: FileImage(
                              File(context.watch<AuthController>().imagePath),
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const PhotoEditing()
                  ],
                ),
        
     
      ],
    );
  }
}
