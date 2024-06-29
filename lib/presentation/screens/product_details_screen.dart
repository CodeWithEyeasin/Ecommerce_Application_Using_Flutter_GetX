import 'package:ecommerce_app/data/models/product_details_model.dart';
import 'package:ecommerce_app/presentation/screens/review_screen.dart';
import 'package:ecommerce_app/presentation/state_holders/product_details_controller.dart';
import 'package:ecommerce_app/presentation/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerce_app/presentation/widgets/product_image_carousel_slider.dart';
import 'package:ecommerce_app/presentation/widgets/size_picker.dart';
import 'package:ecommerce_app/presentation/widgets/wish_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import '../utility/app_colors.dart';
class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _counterValue = 1;

  @override
  void initState() {
    super.initState();
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: GetBuilder<ProductDetailsController>(
        builder: (productDetailsController) {
          if(productDetailsController.inProgress){
            return const CenterCircularProgressIndicator();
          }

          if(productDetailsController.errorMessage.isNotEmpty ){
            return Center(
              child: Text(productDetailsController.errorMessage) ,
            );
          }

          ProductDetailsModel productDetails = productDetailsController.productDetailsModel;

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                       ProductImageCarouselSlider(
                         images: [
                           productDetails.img1 ?? '',
                           productDetails.img2 ?? '',
                           productDetails.img3 ?? '',
                           productDetails.img4 ?? '',
                         ],
                       ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    productDetails.product?.title ?? '',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black.withOpacity(0.8),
                                    ),
                                  ),
                                ),
                                _buildItemCount(),
                              ],
                            ),
                            _buildReviewSection(productDetails),
                            const Text(
                              'Color',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 16),
                            // ColorPicker(
                            //   colors: const [
                            //     Colors.black,
                            //     Colors.red,
                            //     Colors.amber,
                            //     Colors.blue,
                            //     Colors.purple,
                            //   ],
                            //   onChange: (Color selectedColor) {},
                            // ),
                            SizePicker(
                              sizes: productDetails.color?.split(',') ?? [],
                              onChange: (String s) {},
                              isRounded: false,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Size',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizePicker(
                              sizes: productDetails.size?.split(',') ?? [],
                              onChange: (String s) {},
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Description',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(productDetails.product?.shortDes ?? ''),
                            const SizedBox(height: 8),
                            Text(productDetails.des ?? ''),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              _buildAddToCartSection(productDetails),

            ],
          );
        }
      ),
    );
  }

  Widget _buildItemCount() {
    return ItemCount(
      initialValue: _counterValue,
      minValue: 1,
      maxValue: 20,
      decimalPlaces: 0,
      color: AppColors.primaryColor,
      onChanged: (value) {
        // print(value);
        _counterValue = value as int;
        setState(() {});
      },
    );
  }

  Widget _buildAddToCartSection(ProductDetailsModel productDetails) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildPriceWidget(productDetails),
          SizedBox(
            width: 120,
            child: ElevatedButton(onPressed: () {}, child: const Text('Add to Cart')),
          )
        ],
      ),
    );
  }

  Widget _buildPriceWidget(ProductDetailsModel productDetails) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Price',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        Text(
          '\$${productDetails.product?.price ?? 0}',
          style: const TextStyle(
              fontSize: 24,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }


  Widget _buildReviewSection(ProductDetailsModel productDetails) {
    return Wrap(
      spacing: 5,
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
         Wrap(
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 20,
            ),
            Text('${productDetails.product?.star ?? 0}'),
          ],
        ),
        TextButton(onPressed: () {
          Get.to(()=>const ReviewScreen());
        }, child: const Text('Reviews')),
        const WishButton(),
      ],
    );
  }
}
