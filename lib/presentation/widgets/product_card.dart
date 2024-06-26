import 'package:flutter/material.dart';

import '../utility/app_colors.dart';
import '../utility/assets_path.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, this.showAddToWishlist = true,
  });

  final bool showAddToWishlist;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      surfaceTintColor: Colors.white,
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
                  const Text('Nike Sports Shoe 320k Special Edition',maxLines: 2,style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),),
                  Wrap(
                    spacing: 5,
                    // alignment: WrapAlignment.start,
                    crossAxisAlignment:WrapCrossAlignment.center ,
                    children: [
                      const Text('\$30', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColors.primaryColor,
                      ),),
                      const Wrap(
                        children: [
                          Icon(Icons.star,color: Colors.amber,size: 20,),
                          Text('4.8'),
                        ],
                      ),
                      _buildAddToWishButton()
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

  Widget _buildAddToWishButton() {
    return Visibility(
                      visible: showAddToWishlist,
                      replacement: _getIconButton(Icons.delete_forever),
                      child: _getIconButton(Icons.favorite_border_outlined)
                    );
  }
}


Widget _getIconButton(IconData icon){
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    color: AppColors.primaryColor,
    child: Padding(
      padding: const EdgeInsets.all(2),
      child: Icon(icon,size: 16,color: Colors.white,),
    ),
  );
}