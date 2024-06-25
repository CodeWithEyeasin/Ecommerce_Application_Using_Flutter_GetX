import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../utility/app_colors.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({
    super.key,
  });

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  final ValueNotifier<int> _selectedPageIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCarouselSlider(),
        const SizedBox(
          height: 8,
        ),
        _buildDotIndicator(),
      ],
    );
  }

Widget _buildCarouselSlider() {
    return CarouselSlider(
        options: CarouselOptions(
            height: 180.0,
            viewportFraction: 1,
            onPageChanged: (index, _) {
              _selectedPageIndex.value = index;
            }),
        items: [1, 2, 3, 4, 5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
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
                  height: 15,
                  width: 15,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: i == value ? AppColors.primaryColor : null,
                    border: Border.all(
                        color:
                        i == value ? AppColors.primaryColor : Colors.grey,
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
