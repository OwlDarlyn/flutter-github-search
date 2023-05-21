import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potje_test_assignment/data/local/database_helper.dart';
import 'package:potje_test_assignment/model/git_api_response_model.dart';

import 'package:potje_test_assignment/service/git_repos_service.dart';

final gitReposProvider =
    StateNotifierProvider<GitReposNotifier, AsyncValue<GitApiResponse>>((ref) {
  return GitReposNotifier(GitReposService());
});

class GitReposNotifier extends StateNotifier<AsyncValue<GitApiResponse>> {
  final GitReposService _gitReposService;
  bool canFetchMore = true;

  GitReposNotifier(this._gitReposService) : super(const AsyncLoading()) {
    state = AsyncValue.data(GitApiResponse(
        resultCount: 0,
        reposList: [],
        favoriteReposList: [],
        fetched: false,
        pageNumber: 0,
        repoName: ""));
  }

  void searchRepos(String repoName, int pageNumber) async {
    state = const AsyncLoading();
    state = AsyncValue.data(
        await _gitReposService.searchRepos(repoName, pageNumber));
  }

  void getMoreRepos() async {
    if (canFetchMore) {
      canFetchMore = false;
      final currentState = [...state.value!.reposList];
      final newData = await _gitReposService.searchRepos(
          state.value!.repoName, state.value!.pageNumber + 1);
      final favorites = await DatabaseHelper.instance.getFavorites();
      state = AsyncValue.data(GitApiResponse(
          fetched: true,
          pageNumber: state.value!.pageNumber + 1,
          repoName: state.value!.repoName,
          favoriteReposList: favorites,
          reposList: [...currentState, ...newData.reposList],
          resultCount: state.value!.resultCount));
      canFetchMore = true;
    }
  }
}
