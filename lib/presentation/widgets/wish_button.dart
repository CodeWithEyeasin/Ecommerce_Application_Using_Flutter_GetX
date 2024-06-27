import 'package:flutter/material.dart';

import '../utility/app_colors.dart';

class WishButton extends StatelessWidget {
  const WishButton({super.key,  this.showAddToWishlist = true});

  final bool showAddToWishlist;

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: showAddToWishlist,
        replacement: _getIconButton(Icons.delete_forever),
        child: _getIconButton(Icons.favorite_border_outlined)
    );
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
}
