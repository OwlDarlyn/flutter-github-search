import 'package:flutter/material.dart';

import 'package:potje_test_assignment/presentation/resources/color_manager.dart';
import 'package:potje_test_assignment/presentation/resources/font_manager.dart';
import 'package:potje_test_assignment/presentation/resources/styles_manager.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 16),
      padding: const EdgeInsets.all(18),
      height: 56,
      decoration: BoxDecoration(
        color: ColorManager.layer1,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        onChanged: (value) {},
        textInputAction: TextInputAction.done,
        maxLines: 1,
        cursorColor: ColorManager.accentPrimary,
        decoration: InputDecoration(
          icon: Icon(
            Icons.search_sharp,
            color: ColorManager.accentPrimary,
          ),
          hintText: 'Search',
          hintStyle: getBodyStyle(
            color: ColorManager.placeHolder,
            fontSize: FontSize.s14,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
