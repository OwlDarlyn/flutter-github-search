import 'package:flutter/material.dart';

import 'package:potje_test_assignment/components/custom_list_card_component.dart';
import 'package:potje_test_assignment/model/git_repos_model.dart';
import 'package:potje_test_assignment/presentation/resources/color_manager.dart';
import 'package:potje_test_assignment/presentation/resources/styles_manager.dart';

class ReposList extends StatelessWidget {
  final List<GitRepo> gitReposList;
  final String notFoundString;
  const ReposList({
    super.key,
    required this.gitReposList,
    required this.notFoundString,
  });

  @override
  Widget build(BuildContext context) {
    if (gitReposList.isNotEmpty) {
      return ListView.builder(
          itemCount: gitReposList.length,
          itemBuilder: (context, index) {
            return CustomListCard(listItem: gitReposList[index]);
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
