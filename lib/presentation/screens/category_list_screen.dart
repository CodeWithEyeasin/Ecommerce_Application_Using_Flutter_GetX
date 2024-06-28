import 'package:ecommerce_app/presentation/state_holders/category_list_controller.dart';
import 'package:ecommerce_app/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:ecommerce_app/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_){
        Get.find<MainBottomNavBarController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Category List'),
          leading: IconButton(onPressed: (){
            Get.find<MainBottomNavBarController>().backToHome();
          }, icon: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: GetBuilder<CategoryListController>(
          builder: (categoryListController) {
            if(categoryListController.inProgress){
              return const Center(child: CircularProgressIndicator());
            }

            return RefreshIndicator(
              onRefresh:categoryListController.getCategoryList,
              child: GridView.builder(
                itemCount: categoryListController.categoryList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: CategoryItem(
                      category: categoryListController.categoryList[index],
                    ),
                  );
                },
              ),
            );
          }
        ),
      ),
    );
  }
}
