import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style/style.dart';
import '../home/navigation_bar.dart';

class CongratsPage extends StatelessWidget {
  const CongratsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    
                      image: AssetImage('assets/image/Group.png'),
                      )),
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const GeneralPage())));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  width: double.infinity,
                  height: 55.h,
                  decoration: const BoxDecoration(
                    gradient: Style.linearGradient,
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                  ),
                  child: Center(
                    child: Text('Go homepage',
                        style: Style.textStyleRegular(
                            textColor: Style.whiteColor)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
