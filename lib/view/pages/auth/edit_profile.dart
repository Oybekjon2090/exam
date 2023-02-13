import 'dart:convert';
import 'package:exam/view/pages/auth/set_photo.dart';
import 'package:exam/view/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../controller/auth_controller.dart';
import '../../../controller/user_controller.dart';
import '../../components/custom_text_form_fild.dart';
import '../../components/edit_profile_image.dart';
import '../../components/gender_choose.dart';
import '../../components/label_textformfield.dart';
import '../../components/warning_container.dart';
import '../../style/style.dart';

class EditeProfile extends StatefulWidget {
  const EditeProfile({super.key});

  @override
  State<EditeProfile> createState() => _EditeProfileState();
}

class _EditeProfileState extends State<EditeProfile> {
  TextEditingController fullname = TextEditingController();
  TextEditingController nickname = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController passwor = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController genderController = TextEditingController();
  bool value = false;
  bool visibilityOfpasswor = false;
  bool isFullNameEmpty = false;
  bool isNickNameEmpty = false;
  bool isPhoneNumberEmpty = false;
  bool isGenderEmpty = false;
  bool isDateOfBirthEmpty = false;
  bool isAddressEmpty = false;
  bool isPasswEmty = false;
  String? imagePath;

  var items = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Style.primaryDisabledColor,
                    ),
                  ),
                ],
              ),
            ),
            EditImage(),
            35.verticalSpace,
            35.verticalSpace,
            Padding(
                padding: const EdgeInsets.only(left: 48),
                child: Label(
                  text: 'Nick Name',
                )),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
              child: CustomTextFrom(
                onchange: (value) {
                  isNickNameEmpty = false;
                  setState(() {});
                },
                controller: nickname,
                label: '',
                keyboardType: TextInputType.name,
                hintext: '${context.read<UserController>().user?.username}',
              ),
            ),
            isNickNameEmpty
                ? Padding(
                    padding: const EdgeInsets.only(left: 24, top: 8, right: 24),
                    child: Warning(text: 'Please fill the Nick Name'))
                : const SizedBox.shrink(),
            35.verticalSpace,
            Padding(
                padding: const EdgeInsets.only(left: 48),
                child: Label(
                  text: 'Phone Number',
                )),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
              child: CustomTextFrom(
                onchange: (value) {
                  isPhoneNumberEmpty = false;
                  setState(() {});
                },
                controller: phonenumber,
                label: '',
                keyboardType: TextInputType.phone,
                hintext: '${context.read<UserController>().user?.phone}',
              ),
            ),
            isPhoneNumberEmpty
                ? Padding(
                    padding: const EdgeInsets.only(left: 24, top: 8, right: 24),
                    child: Warning(text: 'Please fill the Phone Number'))
                : const SizedBox.shrink(),
            35.verticalSpace,
            Padding(
                padding: const EdgeInsets.only(left: 48),
                child: Label(
                  text: 'Gender',
                )),
            GenderChoosing(),
            35.verticalSpace,
            Padding(
                padding: const EdgeInsets.only(left: 48),
                child: Label(
                  text: 'Date of Birth',
                )),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
              child: TextFormField(
                onChanged: (value) {
                  bool isDateOfBirthEmpty = false;
                  setState(() {});
                },
                controller: dateOfBirth,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: (() {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1970),
                                lastDate: DateTime.now())
                            .then((value) {
                          dateOfBirth.text = DateFormat('MMMM dd, yyyy')
                              .format(value ?? DateTime.now());
                          setState(() {});
                        });
                      }),
                      icon: Icon(Icons.calendar_month)),
                  contentPadding: const EdgeInsets.only(
                      left: 24, right: 24, top: 12, bottom: 12),
                  hintText: '${context.read<UserController>().user?.birth}',
                  hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffDADEE3)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 221, 206, 206)),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 221, 206, 206)),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                ),
              ),
            ),
            35.verticalSpace,
            Padding(
                padding: const EdgeInsets.only(left: 48),
                child: Label(
                  text: 'Password',
                )),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
              child: CustomTextFrom(
                onchange: (value) {
                  isPasswEmty = false;
                  setState(() {});
                },
                label: '',
                isObscure: true,
                controller: passwor,
                keyboardType: TextInputType.emailAddress,
                hintext: '${context.read<UserController>().user?.password}',
              ),
            ),
            isPasswEmty
                ? Padding(
                    padding: const EdgeInsets.only(left: 24, top: 8, right: 24),
                    child: Warning(text: 'Please fill the Password'))
                : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: InkWell(
                onTap: () async {
                  if (nickname.text.isEmpty) {
                    isNickNameEmpty = true;
                    setState(() {});
                  } else if (phonenumber.text.isEmpty) {
                    isPhoneNumberEmpty = true;
                    setState(() {});
                  } else if (passwor.text.isEmpty) {
                    isPasswEmty = true;
                    setState(() {});
                  }  else if (dateOfBirth.text.isEmpty) {
                    isPasswEmty = true;
                    setState(() {});
                  }
                  if (nickname.text.isNotEmpty &&
                      dateOfBirth.text.isNotEmpty &&
                      
                      phonenumber.text.isNotEmpty &&
                      passwor.text.isNotEmpty ) {
                    context.read<AuthController>().updateUser(
                          avatar: imagePath,
                          username: nickname.text,
                          password: passwor.text,
                          phon: phonenumber.text,
                          gender: genderController.text,
                          birth: dateOfBirth.text,
                          
                          
                        );
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => HomePage()));
                  }
                },
                child: AnimatedContainer(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  duration: const Duration(milliseconds: 400),
                  decoration: BoxDecoration(
                    color: nickname.text.isEmpty ||
                            phonenumber.text.isEmpty ||
                            passwor.text.isEmpty ||
                            dateOfBirth.text.isEmpty 
                             
                            
                        ? Style.primaryColor
                        : Style.primaryDisabledColor,
                    borderRadius: const BorderRadius.all(Radius.circular(32)),
                  ),
                  child: Center(
                    child: Text(
                      'Next',
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
