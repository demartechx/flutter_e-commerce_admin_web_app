

import 'package:flutter_firebase_e_commerce_admin_panel/data/repositories/user/user_repository.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/authentication/models/user_model.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/popups/loaders.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  RxBool loading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  @override
  void onInit() {
    fetchUserDetails();
    super.onInit();
  }

  final userRepository = Get.put(UserRepository());
  /// Fetches user details from the repository
  Future<UserModel> fetchUserDetails() async {
    try {
      loading.value = true;
      final user = await userRepository.fetchAdminDetails();
      this.user.value = user;
      loading.value = false;
      return user;
    } catch (e) {
      loading.value = false;
      TLoaders.errorSnackBar(title: 'Something went wrong.', message: e.toString());
      return UserModel.empty();
    }
    
  }
}
