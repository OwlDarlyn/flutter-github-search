import 'package:flutter/material.dart';
import 'package:potje_test_assignment/components/search_form_component.dart';

import 'package:potje_test_assignment/presentation/resources/color_manager.dart';
import 'package:potje_test_assignment/presentation/resources/font_manager.dart';
import 'package:potje_test_assignment/presentation/resources/strings_manager.dart';
import 'package:potje_test_assignment/presentation/resources/styles_manager.dart';
import 'package:potje_test_assignment/presentation/resources/values_manager.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

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
      ),
      body: Center(
        child: Column(
          children: [
            SearchForm(),
            Text(AppStrings.searchSubTitle1),
            Text(AppStrings.empty),
          ],
        ),
      ),
    );
  }
}
