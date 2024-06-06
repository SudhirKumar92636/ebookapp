
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../Pages/HomePage/Widgets/HomePage.dart';
import '../Pages/WelcomePage/WelcomPage.dart';

class SplaceController extends GetxController {
  final auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    splaceController();
  }

  void splaceController() {
    Future.delayed(const Duration(seconds: 5), () {
      if (auth.currentUser != null) {
        Get.offAll(const HomePage());
      } else {
        Get.offAll(const WelcomePage());
      }
    });
  }
}
