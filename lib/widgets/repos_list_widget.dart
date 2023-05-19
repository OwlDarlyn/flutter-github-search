import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:potje_test_assignment/components/custom_list_card_component.dart';
import 'package:potje_test_assignment/model/git_repos_model.dart';
import 'package:potje_test_assignment/presentation/resources/color_manager.dart';
import 'package:potje_test_assignment/presentation/resources/font_manager.dart';
import 'package:potje_test_assignment/presentation/resources/strings_manager.dart';
import 'package:potje_test_assignment/presentation/resources/styles_manager.dart';
import 'package:potje_test_assignment/provider/git_repos_provider.dart';

class ReposList extends StatelessWidget {
  final List<GitRepo> gitReposList;
  const ReposList({super.key, required this.gitReposList});

  @override
  Widget build(BuildContext context) {
    if (gitReposList.isNotEmpty) {
      return ListView.builder(
          itemCount: gitReposList.length,
          itemBuilder: (context, index) {
            return CustomListCard(listItem: gitReposList[index]);
          });
    } else {
      return Text(AppStrings.nothingSearch);
    }
  }
}
