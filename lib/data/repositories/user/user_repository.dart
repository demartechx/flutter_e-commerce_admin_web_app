
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/authentication/models/user_model.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/exceptions/firebase_exceptions.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/exceptions/format_exceptions.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/exceptions/platform_exceptions.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;


  Future<void> createUser(UserModel user) async {
    try {
     await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<UserModel> fetchAdminDetails() async {
    try {
     final docSnapshot = await _db.collection('Users').doc(AuthenticationRepository.instance.authUser!.uid).get();
     if(docSnapshot.exists){
      return UserModel.fromSnapshot(docSnapshot);
     }else{
      return UserModel.empty();
     }
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

}