import 'package:flutter/material.dart';
import 'package:nava/core/theme/app_pallete.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<String> _sabks = ['Shor'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.maincolor,
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                width: 350,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Pallete.maincolor, width: 4),
                  color: Pallete.transparentColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('انتخاب سبک',
                            style: TextStyle(
                                fontFamily: 'EstedadB',
                                fontSize: 30,
                                color: Colors.grey[600])),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
