import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../model/user_model.dart';
import 'local_store/local.dart';

class AuthController extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final ImagePicker _image = ImagePicker();
  UserModel? userModel;
  String verificationId = '';
  String docId = '';
  String phone = "";
  String? errorText = '';
  String imagePath = "";
  bool isLoading = false;
  int currentIndex = 0;
  String gender = '';

  setIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  setgender(String value) {
    gender = value;
    notifyListeners();
  }

  Future<bool> checkPhone(String phone) async {
    try {
      var res = await firestore
          .collection("user")
          .where("phone", isEqualTo: phone)
          .get();
      // ignore: unnecessary_null_comparison
      if (res.docs.first != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  sendSms(String phone, VoidCallback codeSend) async {
    isLoading = true;
    errorText = null;
    notifyListeners();
    if (await checkPhone(phone)) {
      errorText = "For this phone number already exist account";
      isLoading = false;
      notifyListeners();
    } else {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) {
          isLoading = false;
          notifyListeners();
          print(credential.toString());
        },
        verificationFailed: (FirebaseAuthException e) {
          errorText = 'The provided phone number is not valid ';
          print(e.toString());
          notifyListeners();
        },
        codeSent: (String verificationId, int? resendToken) {
          this.phone = phone;
          isLoading = false;
          notifyListeners();
          codeSend();
          this.verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    }
  }

  checkCode(String code, VoidCallback onSuccess) async {
    isLoading = true;
    notifyListeners();
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: code);

      var res = await FirebaseAuth.instance.signInWithCredential(credential);
      isLoading = false;
      notifyListeners();
      onSuccess();
    } catch (e) {
      print(e);
    }
  }

  setStateUser(
      {required String fullname,
      required String username,
      required String password,
      required String gender,
      required String birth,
      required VoidCallback onSuccess}) {
    userModel = UserModel(
      username: username,
      password: password,
      gender: gender,
      phone: phone,
      birth: birth,
    
    );
    onSuccess();
  }

  login(String phone, String password, VoidCallback onSuccess) async {
    isLoading = true;
    errorText = null;
    notifyListeners();
    try {
      var res = await firestore
          .collection("user")
          .where("phone", isEqualTo: phone)
          .get();
      if (res.docs.first["password"] == password) {
        LocalStore.setDocId(res.docs.first.id);
        onSuccess();
        isLoading = false;
        notifyListeners();
      } else {
        errorText =
            "The password may be incorrect or the number may not be registered";
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      errorText =
          "The password may be incorrect or the number may not be registered";
      isLoading = false;
      notifyListeners();
    }
  }

  getImageCamera() {
    _image.pickImage(source: ImageSource.camera).then((value) async {
      if (value != null) {
        CroppedFile? cropperImage =
            await ImageCropper().cropImage(sourcePath: value.path);
        imagePath = cropperImage?.path ?? "";
        notifyListeners();
      }
    });
    notifyListeners();
  }

  getImageGallery() {
    _image.pickImage(source: ImageSource.gallery).then((value) async {
      if (value != null) {
        CroppedFile? cropperImage =
            await ImageCropper().cropImage(sourcePath: value.path);
        imagePath = cropperImage?.path ?? "";
        notifyListeners();
      }
    });
    notifyListeners();
  }

  deleteImage() {
    imagePath = '';
    notifyListeners();
  }

  createUser(VoidCallback onSuccess) async {
    final storageRef = FirebaseStorage.instance
        .ref()
        .child("avatars/${DateTime.now().toString()}");
    await storageRef.putFile(File(imagePath));

    String url = await storageRef.getDownloadURL();

    firestore
        .collection("user")
        .add(UserModel(
                username: userModel?.username ?? "",
                password: userModel?.password ?? "",
                gender: userModel?.gender ?? "",
                phone: userModel?.phone ?? "",
                birth: userModel?.birth ?? "",
                avatar: url,
               )
            .toJson())
        .then((value) async {
      await LocalStore.setDocId(value.id);
      onSuccess();
    });
  }

  updateUser({
  
    required String? username,
    required String? password,
    required String? gender,
    required String? phon,
    required String? birth, 
    required String? avatar,
    
  }) async {

   String? docId = await LocalStore.getDocId();
    var res = await firestore.collection("user").doc(docId)
        .update(UserModel(
          avatar: imagePath,
          username: username,
          password: password,
          gender: gender,
          phone: phon,
          birth: birth,
        ).toJson() as Map<String, dynamic>)
        .then((value) async {
      await LocalStore.getDocId();
        }
        );
      
    }
  }
  

  

