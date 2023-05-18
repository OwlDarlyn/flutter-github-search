import 'package:flutter/material.dart';

import 'package:potje_test_assignment/components/app_bar_component.dart';
import 'package:potje_test_assignment/components/search_form_component.dart';

import 'package:potje_test_assignment/presentation/resources/color_manager.dart';
import 'package:potje_test_assignment/presentation/resources/font_manager.dart';
import 'package:potje_test_assignment/presentation/resources/routes_manager.dart';
import 'package:potje_test_assignment/presentation/resources/strings_manager.dart';
import 'package:potje_test_assignment/presentation/resources/styles_manager.dart';
import 'package:potje_test_assignment/presentation/resources/values_manager.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.searchTitle),
      body: Center(
        child: Column(
          children: [
            const SearchForm(),
            Container(
              margin: const EdgeInsets.only(left: 16, top: 16),
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.searchSubTitle1,
                style: getHeaderStyle(
                    color: ColorManager.accentPrimary, fontSize: FontSize.s16),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 184),
              child: Text(
                textAlign: TextAlign.center,
                AppStrings.empty,
                style: getBodyStyle(
                  color: ColorManager.placeHolder,
                  fontSize: FontSize.s14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
