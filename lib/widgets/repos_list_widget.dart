import 'package:flutter/material.dart';

import 'package:potje_test_assignment/components/custom_list_card_component.dart';
import 'package:potje_test_assignment/data/local/database_helper.dart';
import 'package:potje_test_assignment/model/git_repos_model.dart';
import 'package:potje_test_assignment/presentation/resources/color_manager.dart';
import 'package:potje_test_assignment/presentation/resources/strings_manager.dart';
import 'package:potje_test_assignment/presentation/resources/styles_manager.dart';

class ReposList extends StatelessWidget {
  final List<GitRepo> gitReposList;
  final List<GitRepo> favoritesGitReposList;
  final String mode;
  final String notFoundString;
  final ScrollController? scrollController;

  const ReposList({
    super.key,
    required this.gitReposList,
    required this.notFoundString,
    required this.favoritesGitReposList,
    required this.mode,
    this.scrollController,
  });

  bool getIsFavorite(GitRepo? gitRepo) {
    return favoritesGitReposList.contains(gitRepo);
  }

  @override
  Widget build(BuildContext context) {
    if ((mode == 'search' && gitReposList.isNotEmpty) ||
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
                  : favoritesGitReposList[index],
              showAddToFavorite: true,
            );
          });
    } else if (mode == 'history') {
      return FutureBuilder(
          future: DatabaseHelper.instance.getHistory(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              if (snapshot.data!.isNotEmpty) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return CustomListCard(
                      listItem: snapshot.data![index],
                      isInFavorites: false,
                      showAddToFavorite: false,
                    );
                  },
                );
              }
              return Center(
                child: Text(
                  AppStrings.empty,
                  style: getBodyStyle(color: ColorManager.placeHolder),
                  textAlign: TextAlign.center,
                ),
              );
            }
            return const CircularProgressIndicator();
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
