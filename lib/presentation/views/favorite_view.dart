import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:potje_test_assignment/widgets/repos_list_widget.dart';

import 'package:potje_test_assignment/presentation/resources/color_manager.dart';
import 'package:potje_test_assignment/presentation/resources/font_manager.dart';
import 'package:potje_test_assignment/presentation/resources/routes_manager.dart';
import 'package:potje_test_assignment/presentation/resources/strings_manager.dart';
import 'package:potje_test_assignment/presentation/resources/styles_manager.dart';

import '../../data/local/database_helper.dart';
import '../../model/git_repos_model.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  void goToSearch(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.searchRoute);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.favoriteTitle,
          style: getHeaderStyle(
            color: ColorManager.textPrimary,
            fontSize: FontSize.s16,
          ),
        ),
        leading: Container(
          margin: const EdgeInsets.only(left: 16, top: 10),
          height: 44,
          padding: const EdgeInsets.only(left: 6),
          decoration: BoxDecoration(
              color: ColorManager.accentPrimary,
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: IconButton(
              onPressed: () => goToSearch(context),
              icon: Icon(
                Icons.arrow_back_ios,
                color: ColorManager.main,
                size: 28,
              )),
        ),
        leadingWidth: 62,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        child: FutureBuilder<List<GitRepo>>(
            future: DatabaseHelper.instance.getFavorites(),
            builder: (context, AsyncSnapshot<List<GitRepo>> snapshot) {
              return ReposList(
                  favoritesGitReposList: snapshot.data ?? [],
                  gitReposList: [],
                  mode: "favorites",
                  notFoundString: AppStrings.nothingFavorite);
            }),
      ),
    );
  }
}
