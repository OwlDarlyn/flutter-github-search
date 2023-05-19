import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:potje_test_assignment/model/git_repos_model.dart';

Future<List<GitRepo>> fetchGitRepos(String repoName) async {
  final response = await http.get(Uri.parse(
      'https://api.github.com/search/repositories?q=${repoName}&per_page=15&page=1'));
  if (response.statusCode == 200) {
    final parsedGitRepos = json.decode(utf8.decode(response.bodyBytes));
    return parsedGitRepos
        .map<GitRepo>((json) => GitRepo.fromJson(json))
        .toList();
  } else {
    throw Exception('Failed to fetch repos');
  }
}
// final reposSerivceProvider =
//     Provider<GitReposService>((ref) => GitReposService());

// class GitReposService {
//   Future<AsyncValue<List<GitRepo>>> getRepos(String repoName) async {
//     final response = await http.get(Uri.parse(
//         'https://api.github.com/search/repositories?q=${repoName}&per_page=15&page=1'));
//     if (response.statusCode == 200) {
//       final parsedResponse = json.decode(utf8.decode(response.bodyBytes));
//       log(parsedResponse.toString());
//       final repos = parsedResponse['items']
//           .map<GitRepo>((json) => GitRepo.fromJson(json))
//           .toList();
//       return AsyncData(repos);
//     } else {
//       throw Exception('Failed to fetch repos');
//     }
//   }
// }