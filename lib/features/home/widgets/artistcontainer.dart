import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nava/core/theme/app_pallete.dart';
import 'package:nava/features/home/widgets/artists_page.dart';

class ArtistContainer extends ConsumerStatefulWidget {
  const ArtistContainer({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ArtistContainerState();
}

class _ArtistContainerState extends ConsumerState<ArtistContainer> {
  bool click = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const ArtistsPage()));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: Pallete.transparentColor,
          border: Border.all(color: Pallete.maincolor, width: 2.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/karimiJadid.jpg')),
                  // shape: BoxShape.rectangle,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Column(
                  children: [
                    Divider(
                      color: Pallete.maincolor,
                    ),
                    Text('حاج محمود کریمی',
                        style: TextStyle(
                            fontFamily: 'EstedadB',
                            fontSize: 9,
                            color: Colors.black)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
