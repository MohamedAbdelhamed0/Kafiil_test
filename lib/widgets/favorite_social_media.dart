import 'package:flutter/material.dart';
import 'package:flutter_any_logo/flutter_logo.dart';
import 'package:kafill_test/core/colors.dart';
import 'custom_form_field.dart';

class FavoriteSocialMedia extends StatefulWidget {
  const FavoriteSocialMedia({super.key});

  @override
  FavoriteSocialMediaState createState() => FavoriteSocialMediaState();
}

class FavoriteSocialMediaState extends State<FavoriteSocialMedia> {
  final List<SocialMedia> socialMediaList = [
    SocialMedia(name: 'Facebook', logoKey: AnyLogo.media.facebook.path),
    SocialMedia(name: 'Twitter', logoKey: AnyLogo.media.twitter.path),
    SocialMedia(name: 'LinkedIn', logoKey: AnyLogo.media.linkedin.path),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextAboveFormField(label: 'Favorite Social Media'),
        const SizedBox(
          height: 8,
        ),
        ...socialMediaList.map((socialMedia) {
          return CheckboxListTile(
            checkColor: Colors.white,
            activeColor: AppColors.primaryColor,
            controlAffinity:
                ListTileControlAffinity.leading, // Checkbox on the left
            title: Row(
              children: [
                Image(
                  image: AssetImage(socialMedia.logoKey),
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: 8),
                Text(socialMedia.name),
              ],
            ),
            value: socialMedia.isSelected,
            onChanged: (bool? value) {
              setState(() {
                socialMedia.isSelected = value ?? false;
              });
            },
          );
        }),
      ],
    );
  }
}

class SocialMedia {
  final String name;
  final String logoKey;
  bool isSelected;

  SocialMedia(
      {required this.name, required this.logoKey, this.isSelected = false});
}
