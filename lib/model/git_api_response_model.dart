import 'dart:developer';

import 'package:potje_test_assignment/model/git_repos_model.dart';

class GitApiResponse {
  final int resultCount;
  final bool fetched;
  final String repoName;
  final int pageNumber;
  final List<GitRepo> reposList;
  final List<GitRepo> favoriteReposList;
  final List<GitRepo> searchHistoryList;

  GitApiResponse(
      {required this.resultCount,
      required this.reposList,
      required this.fetched,
      required this.repoName,
      required this.pageNumber,
      required this.favoriteReposList,
      required this.searchHistoryList});

  factory GitApiResponse.fromJson(Map<String, dynamic> json) {
    return GitApiResponse(
      resultCount: json['total_count'],
      fetched: true,
      repoName: json['repoName'],
      favoriteReposList: json['favorite_repos'],
      pageNumber: json['pageNumber'],
      reposList:
          json['items'].map<GitRepo>((json) => GitRepo.fromJson(json)).toList(),
      searchHistoryList: json['search_history'],
    );
  }
}
