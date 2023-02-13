import 'dart:io';

import 'package:exam/view/components/profile_edit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../controller/auth_controller.dart';
import '../../../controller/user_controller.dart';
import '../../components/cached_network_image.dart';
import '../../style/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserController>().getUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: [Icon(Icons.more_vert)],
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              10.verticalSpace,
              Row(
                children: [
                  24.horizontalSpace,
                  Container(
                      width: 100.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: FileImage(
                              File(context.watch<AuthController>().imagePath),
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                  24.horizontalSpace,
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              overflow: TextOverflow.visible,
                              maxLines: 1,
                              softWrap: false,
                              context
                                      .watch<UserController>()
                                      .user
                                      ?.username ??
                                  '',
                              style: Style.textStyleRegular(size: 19)),
                          Text(
                              overflow: TextOverflow.visible,
                              maxLines: 1,
                              softWrap: false,
                              context.watch<UserController>().user?.phone ??
                                  '',
                              style: Style.textStyleRegular(size: 19)),
                        ],
                      ),
                    ),
                  ),
                 
                ],
              ),
              SizedBox(
                  child: Divider(
                thickness: 1,
                height: 50,
              )),
              Expanded(
                child: ListView(
                  children: [ProfilePage()],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
