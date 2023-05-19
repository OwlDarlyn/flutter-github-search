import 'dart:developer';

import 'package:potje_test_assignment/model/git_repos_model.dart';

class GitApiResponse {
  final int resultCount;
  final bool fetched;
  final List<GitRepo> reposList;

  GitApiResponse(
      {required this.resultCount,
      required this.reposList,
      required this.fetched});

  factory GitApiResponse.fromJson(Map<String, dynamic> json) {
    return GitApiResponse(
      resultCount: json['total_count'],
      fetched: true,
      reposList:
          json['items'].map<GitRepo>((json) => GitRepo.fromJson(json)).toList(),
    );
  }
}
