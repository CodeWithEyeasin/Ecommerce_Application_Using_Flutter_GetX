import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/presentation/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';
import '../../data/models/slider_data.dart';
import '../utility/app_colors.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({
    super.key,
    required this.sliderList,
  });

  final List<SliderData> sliderList;

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
      items: widget.sliderList.map((slider) {
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
                child: Stack(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: NetworkImageWidget(
                          url: slider.image ?? '',
                          height: double.maxFinite,
                          weight: double.maxFinite,
                          boxFit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(flex: 2, child: _buildProductDescription(slider)),
                  ],
                ));
          },
        );
      }).toList(),
    );
  }

  Widget _buildProductDescription(SliderData slider) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            slider.title ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            slider.shortDes ?? '',
            maxLines: 2,
            style: const TextStyle(
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 12)),
              onPressed: () {},
              child: const Text('Buy now'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDotIndicator() {
    return ValueListenableBuilder(
      valueListenable: _selectedPageIndex,
      builder: (BuildContext context, int value, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < widget.sliderList.length; i++)
              Container(
                height: 15,
                width: 15,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: i == value ? AppColors.primaryColor : null,
                  border: Border.all(
                      color: i == value ? AppColors.primaryColor : Colors.grey,
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
