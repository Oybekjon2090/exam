// import 'package:bottom_navy_bar/bottom_navy_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:provider/provider.dart';

// import '../../../controller/auth_controller.dart';
// import '../../style/style.dart';

// import 'home_page.dart';

// class GeneralPage extends StatefulWidget {
//   const GeneralPage({super.key});

//   @override
//   State<GeneralPage> createState() => _GeneralPageState();
// }

// class _GeneralPageState extends State<GeneralPage> {
//   List<Widget> mainPages = [
//     const HomePage(),
//     const Placeholder(),
 
//     const Placeholder(),
//   ];

//   int currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(
//         index: context.watch<AuthController>().currentIndex,
//         children: mainPages,
//       ),
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.transparent,
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: ClipRRect(
//         borderRadius: BorderRadius.all(Radius.circular(12.r)),
//         child: BottomNavyBar(
//           selectedIndex: context.watch<AuthController>().currentIndex,
//           // showElevation: true,
//           backgroundColor: Colors.white,
//           containerHeight: 91,
//           itemCornerRadius: 12,
//           curve: Curves.easeIn,
//           items: [
//             BottomNavyBarItem(
//                 icon: const Icon(Icons.home),
//                 title: const Text('Home'),
//                 activeColor: Style.primaryColor),
//             BottomNavyBarItem(
//                 icon: const Icon(Icons.shopping_basket),
//                 title: const Text('Order'),
//                 activeColor: Style.primaryColor),
//             BottomNavyBarItem(
//                 icon: const Icon(
//                   Icons.add_circle_outline_sharp,
//                 ),
//                 title: const Text('Add Product'),
//                 activeColor: Style.primaryColor),
//             BottomNavyBarItem(
//                 icon: const Icon(Icons.message),
//                 title: const Text('Chat'),
//                 activeColor: Style.primaryColor),
//             BottomNavyBarItem(
//               icon: const Icon(Icons.person),
//               title: const Text('Profile'),
//               activeColor: Style.primaryColor,
//             )
//           ],
//           onItemSelected: (value) {
//             context.read<AuthController>().setIndex(value);
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:exam/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:provider/provider.dart';

import '../../style/style.dart';
import 'home_page.dart';


class GeneralPage extends StatefulWidget {
  const GeneralPage({super.key});

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  List<Widget> mainPages = [
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
    const HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: context.watch<AuthController>().currentIndex,
        children: mainPages,
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: context.watch<AuthController>().currentIndex,
          onTap: (value) {
            context.read<AuthController>().setIndex(value);
          },
          selectedIconTheme: IconThemeData(color: Style.primaryColor),
          type: BottomNavigationBarType.fixed,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: ''),
            const BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
            
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: ''),
                const BottomNavigationBarItem(
                icon: Icon(Icons.add_box_outlined), label: ''),
            BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.person)),
          ]),
    );
  }
}

