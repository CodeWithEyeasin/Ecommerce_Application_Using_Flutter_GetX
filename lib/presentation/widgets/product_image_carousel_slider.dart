import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../utility/app_colors.dart';

class ProductImageCarouselSlider extends StatefulWidget {
  const ProductImageCarouselSlider({
    super.key,
  });

  @override
  State<ProductImageCarouselSlider> createState() => _ProductImageCarouselSliderState();
}

class _ProductImageCarouselSliderState extends State<ProductImageCarouselSlider> {
  final ValueNotifier<int> _selectedPageIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
            children:[
          _buildCarouselSlider(),
          Positioned(
            bottom: 8,
              left: 0,
              right: 0,
              child: _buildDotIndicator()),
        ]),


      ],
    );
  }

Widget _buildCarouselSlider() {
    return CarouselSlider(
        options: CarouselOptions(
            height: 220,
            viewportFraction: 1,
            onPageChanged: (index, _) {
              _selectedPageIndex.value = index;
            }),
        items: [1, 2, 3, 4, 5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey.shade300,
                  alignment: Alignment.center,
                  child: Text(
                    'text $i',
                    style: const TextStyle(fontSize: 16.0),
                  ));
            },
          );
        }).toList(),
      );
  }

Widget _buildDotIndicator() {
    return ValueListenableBuilder(
        valueListenable: _selectedPageIndex,
        builder: (BuildContext context, int value, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 5; i++)
                Container(
                  height: 12,
                  width: 12,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: i == value ? AppColors.primaryColor : Colors.white,
                    border: Border.all(
                        color:
                        i == value ? AppColors.primaryColor : Colors.white,
                        width: 1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                )
            ],
          );
        },
      );
  }
}
