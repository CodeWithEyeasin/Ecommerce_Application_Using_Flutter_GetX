import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import '../utility/app_colors.dart';
import '../utility/assets_path.dart';

class CartProductItem extends StatefulWidget {
  const CartProductItem({super.key});

  @override
  State<CartProductItem> createState() => _CartProductItemState();
}

class _CartProductItemState extends State<CartProductItem> {
  int _counterValue = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      surfaceTintColor: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          _buildProductImage(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildProductDetails(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductDetails() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProductName(),
                _buildColorAndSize()
              ],
            )),
            IconButton(onPressed: () {}, icon: const Icon(Icons.delete_forever))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '\$100',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            _buildItemCount(),
          ],
        ),
      ],
    );
  }

  Widget _buildColorAndSize() {
    return const Wrap(
                spacing: 16,
                children: [
                  Text(
                    'Color: Red',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    'Size: XL',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ],
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

  Widget _buildProductName() {
    return const Text(
                'Nike shoe 213234kG34',
                maxLines: 1,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                ),
              );
  }

  Widget _buildProductImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        AssetsPath.productDummyImageSvg,
        width: 100,
      ),
    );
  }
}
