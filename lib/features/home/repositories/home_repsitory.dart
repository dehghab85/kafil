import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:nava/core/failure/failure.dart';
import 'package:nava/features/home/models/song_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_repsitory.g.dart';

@riverpod
HomeRepository homeRepository(HomeRepositoryRef ref) {
  return HomeRepository();
}

class HomeRepository {
  Future<Either<AppFailure, String>> uploadSong({
    required File selectedAudio,
    required File selectedImage,
    required String songName,
    required String artist,
    required String hexCode,
    // required String token,
  }) async {
    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse(
          'http://10.0.2.2:8000/upload',
        ),
      );
      request
        ..files.addAll(
          [
            await http.MultipartFile.fromPath('song', selectedAudio.path),
            await http.MultipartFile.fromPath('thumbnail', selectedImage.path),
          ],
        )
        ..fields.addAll(
            {'artist': artist, 'song_name': songName, 'hex_code': hexCode});
      // ..headers.addAll({
      //   'x-auth-token': token,
      // });
      final res = await request.send();

      if (res.statusCode != 201) {
        return Left(AppFailure(await res.stream.bytesToString()));
      }

      return Right(await res.stream.bytesToString());
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, List<SongModel>>> getAllSongs(
      // required String token,
      ) async {
    try {
      final res = await http.get(
        Uri.parse('http://10.0.2.2:8000/list'),
        headers: {
          'Content-Type': 'application/json',
          // 'x-auth-token': token,
        },
      );
      var resBodyMap = jsonDecode(res.body);

      if (res.statusCode != 200) {
        resBodyMap = resBodyMap as Map;
        print('1');
        return Left(AppFailure(resBodyMap['detail']));
      }
      resBodyMap = resBodyMap as List;

      List<SongModel> songs = [];

      for (final map in resBodyMap) {
        songs.add(SongModel.fromMap(map));
      }
      return Right(songs);
    } catch (e) {
      print('2');
      return Left(AppFailure(e.toString()));
    }
  }
}
