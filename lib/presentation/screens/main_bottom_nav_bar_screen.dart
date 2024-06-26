import 'package:ecommerce_app/presentation/screens/cart_list_screen.dart';
import 'package:ecommerce_app/presentation/screens/category_list_screen.dart';
import 'package:ecommerce_app/presentation/screens/home_screen.dart';
import 'package:ecommerce_app/presentation/screens/wish_list_screen.dart';
import 'package:ecommerce_app/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:ecommerce_app/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  final MainBottomNavBarController _navBarController =
      Get.find<MainBottomNavBarController>();

  final List<Widget> _screen = const [
    HomeScreen(),
    CategoryListScreen(),
    CartListScreen(),
    WishListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainBottomNavBarController>(
        builder: (_) {
          return _screen[_navBarController.selectedIndex];
        },
      ),
      bottomNavigationBar: GetBuilder<MainBottomNavBarController>(builder: (_) {
        return BottomNavigationBar(
          currentIndex: _navBarController.selectedIndex,
          onTap: _navBarController.changeIndex,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: 'Category'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_rounded), label: 'Wishlist'),
          ],
        );
      }),
    );
  }
}