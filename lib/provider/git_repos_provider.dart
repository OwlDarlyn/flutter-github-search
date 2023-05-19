import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potje_test_assignment/model/git_api_response_model.dart';

import 'package:potje_test_assignment/service/git_repos_service.dart';

final gitReposProvider =
    StateNotifierProvider<GitReposNotifier, AsyncValue<GitApiResponse>>((ref) {
  return GitReposNotifier(GitReposService());
});

class GitReposNotifier extends StateNotifier<AsyncValue<GitApiResponse>> {
  final GitReposService _gitReposService;

  GitReposNotifier(this._gitReposService) : super(AsyncLoading()) {
    state = AsyncValue.data(
        GitApiResponse(resultCount: 0, reposList: [], fetched: false));
  }

  void searchRepos(String repoName) async {
    state = const AsyncLoading();
    state = AsyncValue.data(await _gitReposService.searchRepos(repoName));
  }
}
