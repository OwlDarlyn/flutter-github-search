import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potje_test_assignment/model/git_api_response_model.dart';

import '../model/git_repos_model.dart';

class GitReposService {
  Future<GitApiResponse> searchRepos(String repoName) async {
    final response = await http.get(Uri.parse(
        'https://api.github.com/search/repositories?q=${repoName}&per_page=15&page=1'));
    if (response.statusCode == 200) {
      final parsedResponse = json.decode(utf8.decode(response.bodyBytes));
      return GitApiResponse.fromJson(parsedResponse);
    } else {
      throw Exception('Failed to fetch repos');
    }
  }
}
