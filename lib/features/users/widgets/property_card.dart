import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class PropertyCard extends StatelessWidget {
  final String value;
  final String property;
  const PropertyCard({
    super.key,
    required this.value,
    required this.property,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.size18,
          ),
        ),
        Gaps.h4,
        Text(
          property,
          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: Sizes.size16,
          ),
        ),
      ],
    );
  }
}
