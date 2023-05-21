import 'package:flutter/material.dart';

import 'package:potje_test_assignment/components/custom_list_card_component.dart';
import 'package:potje_test_assignment/model/git_repos_model.dart';
import 'package:potje_test_assignment/presentation/resources/color_manager.dart';
import 'package:potje_test_assignment/presentation/resources/styles_manager.dart';

class ReposList extends StatelessWidget {
  final List<GitRepo> gitReposList;
  final List<GitRepo> favoritesGitReposList;
  final String mode;
  final String notFoundString;
  final ScrollController? scrollController;
  const ReposList(
      {super.key,
      required this.gitReposList,
      required this.notFoundString,
      required this.favoritesGitReposList,
      required this.mode,
      this.scrollController});
  bool getIsFavorite(GitRepo? gitRepo) {
    return favoritesGitReposList.contains(gitRepo);
  }

  @override
  Widget build(BuildContext context) {
    if (gitReposList.isNotEmpty ||
        (mode == 'favorites' && favoritesGitReposList.isNotEmpty)) {
      return ListView.builder(
          controller: scrollController,
          itemCount: mode == 'search'
              ? gitReposList.length
              : favoritesGitReposList.length,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return CustomListCard(
                isInFavorites: mode == 'search'
                    ? favoritesGitReposList.any(
                        (element) => element.id == gitReposList[index].id,
                      )
                    : true,
                listItem: mode == 'search'
                    ? gitReposList[index]
                    : favoritesGitReposList[index]);
          });
    } else {
      return Center(
        child: Text(
          notFoundString,
          style: getBodyStyle(color: ColorManager.placeHolder),
          textAlign: TextAlign.center,
        ),
      );
    }
  }
}
