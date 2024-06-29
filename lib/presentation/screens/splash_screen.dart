import 'package:ecommerce_app/presentation/screens/home_screen.dart';
import 'package:ecommerce_app/presentation/screens/main_bottom_nav_bar_screen.dart';
import 'package:ecommerce_app/presentation/state_holders/user_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> _moveToNextScreen() async {
   await Future.delayed(const Duration(seconds: 1),);
   await UserAuthController.getUserToken();

   Get.off(()=>const MainBottomNavBarScreen());
  }

  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            AppLogo(),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(height: 16,),
            Text('Version 1.0'),
            SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
}


