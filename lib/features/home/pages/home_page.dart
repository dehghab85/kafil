import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nava/core/theme/app_pallete.dart';
import 'package:nava/features/home/pages/filter_page.dart';
import 'package:nava/features/home/pages/search_page.dart';
import 'package:nava/features/home/widgets/music_slab.dart';
import 'package:nava/features/home/pages/library_page.dart';
import 'package:nava/features/home/pages/songs_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<HomePage> {
  int selectedIndex = 0;

  final pages = [
    const SongsPage(),
    const SearchPage(),
    const LibraryPage(),
    const FilterPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pages[selectedIndex],
          const Positioned(
            bottom: 0,
            child: MusicSlab(),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              selectedIndex == 0
                  ? 'assets/images/home_filled.png'
                  : 'assets/images/home_unfilled.png',
              color: selectedIndex == 0
                  ? Colors.black
                  : Pallete.inactiveBottomBarItemColor,
            ),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: Pallete.borderColor),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/library.png',
              color: selectedIndex == 2
                  ? Pallete.whiteColor
                  : Pallete.inactiveBottomBarItemColor,
            ),
            label: 'Library',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.filter_alt_rounded),
            label: 'filter',
          ),
        ],
      ),
    );
  }
}
