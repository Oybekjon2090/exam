import 'package:exam/view/pages/auth/sign_in.dart';
import 'package:exam/view/pages/home/home_page.dart';
import 'package:exam/view/style/style.dart';
import 'package:flutter/material.dart';


import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../controller/local_store/local.dart';
import '../home/general_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Future.delayed(Duration(seconds: 3), () async {
        String? docId = await LocalStore.getDocId();
        if (docId == null) {
          // ignore: use_build_context_synchronously
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const SignInPage()),
              (route) => false);
        } else {
          // ignore: use_build_context_synchronously
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const HomePage()),
              (route) => false);
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/image/Group.png',
                height: 334, width: 346.52),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: LoadingAnimationWidget.inkDrop(
                  color: Style.primaryDisabledColor, size: 35),
            )
          ],
        ),
      ),
    );
  }
}
