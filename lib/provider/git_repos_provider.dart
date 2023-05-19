import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potje_test_assignment/model/git_api_response_model.dart';
import 'package:potje_test_assignment/model/git_repos_model.dart';

import 'package:potje_test_assignment/model/git_repos_model.dart';
import 'package:http/http.dart' as http;
import 'package:potje_test_assignment/data/network/git_repos_api.dart';
import 'package:potje_test_assignment/service/git_repos_service.dart';

final gitReposProvider =
    StateNotifierProvider<GitReposNotifier, GitApiResponse>((ref) {
  return GitReposNotifier(GitReposService());
});

class GitReposNotifier extends StateNotifier<GitApiResponse> {
  final GitReposService _gitReposService;

  GitReposNotifier(this._gitReposService)
      : super(GitApiResponse(resultCount: 0, reposList: [], fetched: false));

  void searchRepos(String repoName) async {
    state = await _gitReposService.searchRepos(repoName);
  }
}
