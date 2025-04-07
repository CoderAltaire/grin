import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/size_config.dart';
class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: he(10)),
        child: Container(
          height: he(130),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );;
  }
}
