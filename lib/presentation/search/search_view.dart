import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:potje_test_assignment/components/search_form_component.dart';
import 'package:potje_test_assignment/data/local/database_helper.dart';

import 'package:potje_test_assignment/presentation/resources/color_manager.dart';
import 'package:potje_test_assignment/presentation/resources/font_manager.dart';
import 'package:potje_test_assignment/presentation/resources/routes_manager.dart';
import 'package:potje_test_assignment/presentation/resources/strings_manager.dart';
import 'package:potje_test_assignment/presentation/resources/styles_manager.dart';
import 'package:potje_test_assignment/provider/git_repos_provider.dart';
import 'package:potje_test_assignment/widgets/repos_list_widget.dart';

import '../../model/git_repos_model.dart';

class SearchView extends ConsumerWidget {
  SearchView({super.key});

  final ScrollController scrollController = ScrollController();

  void goToFavorite(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.favoriteRoute);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providerData = ref.watch(gitReposProvider);

    void onSearchSubmit(String repoName) {
      ref.read(gitReposProvider.notifier).searchRepos(repoName, 1);
    }

    String getSubtitleString() {
      if (providerData.asData != null) {
        if (providerData.asData?.value.fetched != null &&
            providerData.asData?.value.fetched == true) {
          return AppStrings.searchSubTitle2;
        } else {
          return AppStrings.searchSubTitle1;
        }
      }
      return AppStrings.searchSubTitle1;
    }

    scrollController.addListener(() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.width * 0.10;
      if (maxScroll - currentScroll <= delta) {
        ref.read(gitReposProvider.notifier).getMoreRepos();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.searchTitle,
          style: getHeaderStyle(
            color: ColorManager.textPrimary,
            fontSize: FontSize.s16,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16, top: 10),
            height: 44,
            width: 44,
            decoration: BoxDecoration(
                color: ColorManager.accentPrimary,
                borderRadius: const BorderRadius.all(Radius.circular(12))),
            child: IconButton(
              onPressed: () => goToFavorite(context),
              icon: Icon(
                Icons.star,
                size: 28,
                color: ColorManager.main,
              ),
              color: ColorManager.main,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SearchForm(
              onSubmit: (value) => onSearchSubmit(value),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16, top: 16, bottom: 12),
              alignment: Alignment.centerLeft,
              child: Text(
                getSubtitleString(),
                style: getHeaderStyle(
                    color: ColorManager.accentPrimary, fontSize: FontSize.s16),
              ),
            ),
            Expanded(
              child: providerData.when(
                  data: (data) {
                    return SafeArea(
                      child: ReposList(
                        scrollController: scrollController,
                        favoritesGitReposList: data.favoriteReposList,
                        mode: "search",
                        gitReposList: data.reposList,
                        notFoundString: data.fetched
                            ? AppStrings.nothingSearch
                            : AppStrings.empty,
                      ),
                    );
                  },
                  error: (error, s) => const Text("Error fetching"),
                  loading: () =>
                      const Center(child: CircularProgressIndicator())),
            ),
          ],
        ),
      ),
    );
  }
}
