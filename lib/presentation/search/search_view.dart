import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:potje_test_assignment/components/search_form_component.dart';

import 'package:potje_test_assignment/presentation/resources/color_manager.dart';
import 'package:potje_test_assignment/presentation/resources/font_manager.dart';
import 'package:potje_test_assignment/presentation/resources/routes_manager.dart';
import 'package:potje_test_assignment/presentation/resources/strings_manager.dart';
import 'package:potje_test_assignment/presentation/resources/styles_manager.dart';
import 'package:potje_test_assignment/presentation/resources/values_manager.dart';
import 'package:potje_test_assignment/provider/repos/git_repos.dart';
import 'package:potje_test_assignment/widgets/repos_list_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  void goToFavorite(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.favoriteRoute);
  }

  @override
  Widget build(BuildContext context) {
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
      // appBar: CustomAppBar(
      //   title: AppStrings.searchTitle,
      // ),
      body: Center(
        child: Column(
          children: [
            SearchForm(),
            Container(
              margin: const EdgeInsets.only(left: 16, top: 16),
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.searchSubTitle1,
                style: getHeaderStyle(
                    color: ColorManager.accentPrimary, fontSize: FontSize.s16),
              ),
            ),
            const Expanded(
              child: ReposList(),
            ),
          ],
        ),
      ),
    );
  }
}
