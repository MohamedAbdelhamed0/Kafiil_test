import 'package:flutter/material.dart';
import 'package:kafill_test/core/colors.dart';

class CircularAvatarWithAddButton extends StatelessWidget {
  final double size;
  final String imageUrl;
  final VoidCallback onAdd;

  const CircularAvatarWithAddButton({super.key, 
    required this.size,
    required this.imageUrl,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 83,
          height: 83,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.primaryColor, // Border color
              width: 4.0, // Border width
            ),
          ),
          child: ClipOval(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: 83,
              height: 83,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: onAdd,
            child: CircleAvatar(
              radius: size * 0.15,
              backgroundColor: AppColors.primaryColor,
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: size * 0.15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
