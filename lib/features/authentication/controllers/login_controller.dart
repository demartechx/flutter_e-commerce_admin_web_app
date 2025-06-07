
import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/data/repositories/user/user_repository.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/authentication/controllers/user_controller.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/authentication/models/user_model.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/enums.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/image_strings.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/text_strings.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/helpers/network_manager.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/popups/full_screen_loader.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final localStorage = GetStorage();

  final email = TextEditingController();
  final password = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }



  /// Handles email and password sign-in process
  Future<void> emailAndPasswordSignIn() async {
    try {
          // Start Loading
    TFullScreenLoader.openLoadingDialog('Registering Admin Account', TImages.docerAnimation);

    // check internet connection
    final isConnected = await NetworkManager.instance.isConnected();
    if(!isConnected) {
      TFullScreenLoader.stopLoading();
      return;
    }

    // Form validation
    if(!loginFormKey.currentState!.validate()){
      TFullScreenLoader.stopLoading();
      return;
    }

    // Save data if remember me is selected
    if(rememberMe.value){
      localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
      localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
    }

    // Login user using Email & Password Authentication
    await AuthenticationRepository.instance.loginWithEmailAndPassword(TTexts.adminEmail, TTexts.adminPassword);

    // fetch user details and assign to usercontroller
    final user = await UserController.instance.fetchUserDetails();
    // Remove Loader
    TFullScreenLoader.stopLoading();

    //Redirect
    if(user.role != AppRole.admin){
      await AuthenticationRepository.instance.logout();
      TLoaders.errorSnackBar(title: 'Not authorized', message: 'Access denied');
    } else {
      AuthenticationRepository.instance.screenRedirect();
    }

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// Handles registration of admin user
  Future<void> registerAdmin() async {
    try {
          // Start Loading
    TFullScreenLoader.openLoadingDialog('Registering Admin Account', TImages.docerAnimation);

    // check internet connection
    final isConnected = await NetworkManager.instance.isConnected();
    if(!isConnected) {
      TFullScreenLoader.stopLoading();
      return;
    }

    // Register user using Email & Password Authentication
    await AuthenticationRepository.instance.registerWithEmailAndPassword(TTexts.adminEmail, TTexts.adminPassword);

    // Create admin record in the firestore
    final userRepository = Get.put(UserRepository());
    await userRepository.createUser(UserModel(id: AuthenticationRepository.instance.authUser!.uid, username: 'Demartechx2', email: 'adeagbothompson10@gmail.com', firstName: 'Adeagbo 2', lastName: 'Matthew 2', phoneNumber: '09059689591', profilePicture: '', role: AppRole.admin));

    // Remove Loader
    TFullScreenLoader.stopLoading();

    //Redirect
    AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

}