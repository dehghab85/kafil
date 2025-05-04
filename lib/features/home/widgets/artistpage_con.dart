import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nava/core/theme/app_pallete.dart';

class ArtistpageCon extends ConsumerWidget {
  final double width_con;
  final double height_con;
  final double height_im;
  final double width_im;
  final String title;
  final String asset;

  const ArtistpageCon({
    required this.width_con,
    required this.height_con,
    required this.width_im,
    required this.height_im,
    required this.title,
    required this.asset,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: width_con,
      height: height_con,
      decoration: BoxDecoration(
        color: Pallete.maincolor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(
              asset,
              width: width_im,
              height: height_im,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              title,
              style: const TextStyle(
                  fontFamily: 'EstedadB', fontSize: 15, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
