import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:potje_test_assignment/data/local/database_helper.dart';
import 'package:potje_test_assignment/model/git_api_response_model.dart';

class GitReposService {
  Future<GitApiResponse> searchRepos(String repoName, int pageNumber) async {
    final response = await http.get(Uri.parse(
        'https://api.github.com/search/repositories?q=$repoName&per_page=15&page=$pageNumber'));
    if (response.statusCode == 200) {
      final parsedResponse = json.decode(utf8.decode(response.bodyBytes));
      final favoriteRepos = await DatabaseHelper.instance.getFavorites();
      parsedResponse['repoName'] = repoName;
      parsedResponse['pageNumber'] = pageNumber;
      parsedResponse['favorite_repos'] = favoriteRepos;
      return GitApiResponse.fromJson(parsedResponse);
    } else {
      throw Exception('Failed to fetch repos');
    }
  }
}
