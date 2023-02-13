import 'package:exam/view/pages/auth/edit_profile.dart';
import 'package:exam/view/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../controller/user_controller.dart';
import '../pages/auth/sign_in.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          InkWell(
            onTap: (){
               Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => EditeProfile()));
            },
            child: Row(
              children: [
                Container(
                  width: 52.w,
                  height: 52.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Style.primaryColor.withOpacity(0.1)),
                  child: Center(
                      child: Icon(
                    Icons.person,
                    color: Style.primaryColor,
                  )),
                ),
                16.horizontalSpace,
                Text(
                  "Edit Profile",
                  style: TextStyle(fontSize: 16),
                ),
               
                Spacer(),
                 Icon(
                      Icons.chevron_right,
                      color: Style.primaryColor,
                    ),
              ],
            ),
          ),
          SizedBox(
              child: Divider(
            thickness: 1,
            height: 50,
          )),
          Row(
            children: [
              Container(
                width: 52.w,
                height: 52.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Style.primaryColor.withOpacity(0.1)),
                child: Center(
                    child:
                        Icon(Icons.notifications, color: Style.primaryColor)),
              ),
              16.horizontalSpace,
              Text("Notification", style: TextStyle(fontSize: 16)),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.chevron_right, color: Style.primaryColor))
            ],
          ),
          SizedBox(
              child: Divider(
            thickness: 1,
            height: 50,
          )),
          Row(
            children: [
              Container(
                width: 52.w,
                height: 52.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Style.primaryColor.withOpacity(0.1)),
                child: Center(
                    child: Icon(Icons.security, color: Style.primaryColor)),
              ),
              16.horizontalSpace,
              Text("Security", style: TextStyle(fontSize: 16)),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.chevron_right, color: Style.primaryColor))
            ],
          ),
          SizedBox(
              child: Divider(
            thickness: 1,
            height: 50,
          )),
          Row(
            children: [
              Container(
                width: 52.w,
                height: 52.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Style.primaryColor.withOpacity(0.1)),
                child: Center(
                    child: Icon(Icons.visibility, color: Style.primaryColor)),
              ),
              16.horizontalSpace,
              Text("Appearance", style: TextStyle(fontSize: 16)),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.chevron_right, color: Style.primaryColor))
            ],
          ),
          SizedBox(
              child: Divider(
            thickness: 1,
            height: 50,
          )),
          Row(
            children: [
              Container(
                width: 52.w,
                height: 52.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Style.primaryColor.withOpacity(0.1)),
                child:
                    Center(child: Icon(Icons.help, color: Style.primaryColor)),
              ),
              16.horizontalSpace,
              Text("Help"),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.chevron_right, color: Style.primaryColor))
            ],
          ),
          SizedBox(
              child: Divider(
            thickness: 1,
            height: 50,
          )),
          Row(
            children: [
              Container(
                width: 52.w,
                height: 52.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Style.primaryColor.withOpacity(0.1)),
                child: Center(
                    child: Icon(Icons.person_add, color: Style.primaryColor)),
              ),
              16.horizontalSpace,
              Text("Invite Friends", style: TextStyle(fontSize: 16)),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.chevron_right, color: Style.primaryColor))
            ],
          ),
          SizedBox(
              child: Divider(
            thickness: 1,
            height: 50,
          )),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  context.read<UserController>().logOut(() {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const SignInPage()),
                        (route) => false);
                  });
                },
                child: Container(
                  width: 52.w,
                  height: 52.h,
                  decoration: BoxDecoration(
                      color: Style.primaryColor.withOpacity(0.1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100))),
                  child: const Icon(Icons.logout_outlined,
                      color: Style.primaryColor),
                ),
              ),
              16.horizontalSpace,
              Text("Logout", style: TextStyle(fontSize: 16)),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.chevron_right, color: Style.primaryColor))
            ],
          )
        ],
      ),
    );
  }
}
