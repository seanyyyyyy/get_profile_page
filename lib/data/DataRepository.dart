import 'dart:convert';
import 'package:http/http.dart';
import 'model/Profile.dart';

class DataRepository {
  Future<Profile> fetchUser(String userName) async {
    return await get(Uri.https('api.github.com','/users/$userName')).then((data) {
      final jsonData = json.decode(data.body);

      if (jsonData['message'] == "Not Found") {
        throw UserNotFoundException();
      } else {
        final profile = Profile(
          name: jsonData['login'],
          bio: jsonData['bio'] ?? "",
          followers: jsonData['followers'],
          following: jsonData['following'],
          image: jsonData['avatar_url'],
          publicRepos: jsonData['public_repos'],
        );
        return profile;
      }
    }).catchError((context) {
      throw UserNotFoundException();
    });
  }
}

class UserNotFoundException implements Exception {}