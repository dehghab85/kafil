import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PackCon extends ConsumerWidget {
  final String topText;

  const PackCon({super.key, required this.topText});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _post = [
      'post1',
      'post2',
      'post3',
      'post4',
      'post5',
    ];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 30, left: 30),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.grey,
                        size: 20,
                      ),
                      Text(
                        'همه',
                        style: TextStyle(
                            fontFamily: 'EstedadB',
                            fontSize: 15,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Text(topText,
                    style: const TextStyle(
                        fontFamily: 'EstedadB',
                        fontSize: 18,
                        color: Colors.black)),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 135,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _post.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/karimiJadid.jpg',
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
