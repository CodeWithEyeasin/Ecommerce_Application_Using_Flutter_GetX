import 'package:ecommerce_app/presentation/state_holders/category_list_controller.dart';
import 'package:ecommerce_app/presentation/state_holders/home_slider_controller.dart';
import 'package:ecommerce_app/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:ecommerce_app/presentation/utility/assets_path.dart';
import 'package:ecommerce_app/presentation/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../data/models/category.dart';
import '../widgets/app_bar_icon_button.dart';
import '../widgets/category_item.dart';
import '../widgets/home_carousel_slider.dart';
import '../widgets/product_card.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildSearchTextField(),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<HomeSliderController>(builder: (sliderController) {
                if(sliderController.inProgress){
                  return const SizedBox(
                    height: 200,
                    child: CenterCircularProgressIndicator(),
                  );
                }
                return HomeCarouselSlider(
                    sliderList: sliderController.sliderList);
              }),
              const SizedBox(
                height: 16,
              ),
              SectionHeader(
                title: 'All Category',
                onTapSeeAll: () {
                  Get.find<MainBottomNavBarController>().selectCategory();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<CategoryListController>(
                builder: (categoryListController) {
                  if(categoryListController.inProgress){
                    return const SizedBox(
                      height: 120,
                      child: CenterCircularProgressIndicator(),
                    );
                  }
                  return _buildCategoryListView(categoryListController.categoryList);
                }
              ),
              // const SizedBox(
              //   height: 8,
              // ),
              SectionHeader(
                title: 'Popular',
                onTapSeeAll: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              _buildProductListView(),
              SectionHeader(
                title: 'Special',
                onTapSeeAll: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              _buildProductListView(),
              SectionHeader(
                title: 'New',
                onTapSeeAll: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              _buildProductListView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryListView(List<Category> categoryList) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        itemCount: categoryList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryItem(
            category: categoryList[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 16,
          );
        },
      ),
    );
  }

  Widget _buildProductListView() {
    return SizedBox(
      height: 210,
      child: ListView.separated(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const ProductCard();
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 16,
          );
        },
      ),
    );
  }

  Widget _buildSearchTextField() {
    return TextField(
      controller: _searchTEController,
      decoration: InputDecoration(
          hintText: 'Search',
          fillColor: Colors.grey.shade200,
          filled: true,
          prefixIcon: const Icon(Icons.search),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          )),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.appNavLogoSvg),
      actions: [
        AppBarIconButton(
          icon: Icons.person,
          onTap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        AppBarIconButton(
          icon: Icons.call,
          onTap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        AppBarIconButton(
          icon: Icons.notification_important_outlined,
          onTap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _searchTEController.dispose();
    super.dispose();
  }
}
