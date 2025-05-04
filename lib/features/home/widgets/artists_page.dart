import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nava/core/theme/app_pallete.dart';
import 'package:nava/features/home/widgets/artistpage_con.dart';
import 'package:nava/features/home/widgets/pack_con.dart';

class ArtistsPage extends ConsumerStatefulWidget {
  const ArtistsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ArtistsPageState();
}

class _ArtistsPageState extends ConsumerState<ArtistsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/cbv.jpg',
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: 350,
                      ),
                      Positioned(
                        top: 100,
                        left: 40,
                        right: 40,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                          child: Container(
                            width: 285,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              border: Border.all(width: 4, color: Colors.black),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/cbv.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 40,
                        left: 20,
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'کربلایی حسین ستوده',
                                style: TextStyle(
                                    fontFamily: 'EstedadB',
                                    fontSize: 23,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: SizedBox(
                      width: 220,
                      height: 55,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ArtistpageCon(
                                width_con: 75,
                                height_con: 75,
                                width_im: 20,
                                height_im: 20,
                                title: 'فیلتر',
                                asset: 'assets/images/filter.png'),
                            ArtistpageCon(
                                width_con: 120,
                                height_con: 75,
                                width_im: 15,
                                height_im: 15,
                                title: 'پخش تصادفی',
                                asset: 'assets/images/plAY.png'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Divider(
                  color: Pallete.maincolor,
                  height: 3,
                  thickness: 2,
                  indent: 40,
                  endIndent: 40,
                ),
                const SizedBox(
                  height: 10,
                ),
                const PackCon(
                  topText: 'آخرین های لهفان',
                ),
                const PackCon(
                  topText: 'بیشترین بازدید لهفان',
                ),
                const PackCon(
                  topText: 'محبوب ترین لهفان',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
