import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final getUserProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final response =
      await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
  final jsonResponse = jsonDecode(response.body);
  return jsonResponse;
});

final searchUserProvider = StateProvider<String>((ref) => '');

final searchControllerProvider =
    StateNotifierProvider<SearchUserController, List>((ref) {
  return SearchUserController();
});

class SearchUserController extends StateNotifier<List> {
  SearchUserController() : super([]);

  void onSearchUser(String query, List<dynamic> data) {
    state = [];
    if (query.isNotEmpty) {
      final result = data
          .where((element) => element['email']
              .toString()
              .toLowerCase()
              .contains(query.toString().toLowerCase()))
          .toSet()
          .toList();
      state.addAll(result);
    }
  }
}


// @riverpod
// class SearchFilter extends _$SearchFilter {
//   final List<Map<String?, dynamic>> allPlayers = [
//     {'name': 'sotoode', 'lyrics': 'dele man'},
//     {'name': 'sotoode', 'lyrics': 'serad'},
//     {'name': 'karimi', 'lyrics': 'asire dame hossein'},
//     {'name': 'kermanshahi', 'lyrics': 'khatol maut'},
//   ];
//   @override
//   build() {
//     return allPlayers;
//   }

//   void filterplayer(String playersName) {
//     List<Map<String?, dynamic>> results = [];
//     if (playersName.isEmpty) {
//       results = allPlayers;
//     } else {
//       results = state!.where((element) => element['name']
//           .toString()
//           .toLowerCase()
//           .contains(playersName.toLowerCase()));
//     }
//     state = results;
//   }
// }
