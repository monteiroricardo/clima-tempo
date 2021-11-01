import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerElementWidget extends StatelessWidget {
  final double h;
  final double w;
  final double paddingBottom;
  const ShimmerElementWidget({
    Key? key,
    required this.h,
    required this.w,
    this.paddingBottom = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: paddingBottom),
      child: Shimmer.fromColors(
        enabled: true,
        child: Container(
          height: h,
          width: w,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
        ),
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
      ),
    );
  }
}
