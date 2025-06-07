
import 'package:flutter_firebase_e_commerce_admin_panel/features/authentication/controllers/user_controller.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {

  @override
  void dependencies(){
    /// -- Core
    Get.lazyPut(()=> NetworkManager(), fenix: true);
    Get.lazyPut(()=> UserController(), fenix: true);
  }

}