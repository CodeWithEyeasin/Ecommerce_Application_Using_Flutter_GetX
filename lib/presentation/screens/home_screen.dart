import 'package:ecommerce_app/presentation/utility/app_colors.dart';
import 'package:ecommerce_app/presentation/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/app_bar_icon_button.dart';
import '../widgets/category_item.dart';
import '../widgets/home_carousel_slider.dart';
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
              const HomeCarouselSlider(),
              const SizedBox(
                height: 16,
              ),
              SectionHeader(
                title: 'All Category',
                onTapSeeAll: () {},
              ),
              const SizedBox(height: 10,),
              _buildCategoryListView(),
              // const SizedBox(
              //   height: 8,
              // ),
              SectionHeader(
                title: 'Popular Products',
                onTapSeeAll: () {},
              ),
              const SizedBox(height: 10,),
              const ProductCard()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryListView() {
    return SizedBox(
              height: 120,
              child: ListView.separated(
                itemCount: 8,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const CategoryItem();
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

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child:SizedBox(
        width: 150,
        child: Column(
          children: [
            Container(
              width: 150,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(AssetsPath.productDummyImageSvg,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nike Sports Shoe 320k Special Edition',maxLines: 2,style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),),
                  Wrap(
                    spacing: 5,
                    // alignment: WrapAlignment.start,
                    crossAxisAlignment:WrapCrossAlignment.center ,
                    children: [
                      Text('\$30', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColors.primaryColor,
                      ),),
                      Wrap(
                        children: [
                          Icon(Icons.star,color: Colors.amber,size: 20,),
                          Text('4.8'),
                        ],
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        color: AppColors.primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Icon(Icons.favorite_border_outlined,size: 16,color: Colors.white,),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
