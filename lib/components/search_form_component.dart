import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:potje_test_assignment/presentation/resources/color_manager.dart';
import 'package:potje_test_assignment/presentation/resources/font_manager.dart';
import 'package:potje_test_assignment/presentation/resources/styles_manager.dart';
import 'package:potje_test_assignment/data/network/git_repos_api.dart';
import 'package:potje_test_assignment/provider/git_repos_provider.dart';

class SearchForm extends StatelessWidget {
  final Function(String value) onSubmit;
  SearchForm({super.key, required this.onSubmit});
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 24, left: 16, right: 16),
      height: 56,
      decoration: BoxDecoration(
        color: ColorManager.layer1,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Focus(
        child: Builder(builder: (BuildContext context) {
          final FocusNode focusNode = Focus.of(context);
          final bool hasFocus = focusNode.hasFocus;
          return TextFormField(
            controller: controller,
            onFieldSubmitted: (value) => onSubmit(value),
            // onChanged: (value) =>
            //     context.read<GitReposProvider>().searchGitRepos(value),
            textInputAction: TextInputAction.search,
            maxLines: 1,
            cursorColor: ColorManager.accentPrimary,
            decoration: InputDecoration(
              filled: hasFocus ? true : false,
              fillColor:
                  hasFocus ? ColorManager.accentSecondary : ColorManager.layer1,
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: ColorManager.accentPrimary, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
              prefixIcon: const Icon(
                Icons.search_outlined,
                size: 30,
              ),
              prefixIconColor: ColorManager.accentPrimary,
              suffixIcon: ValueListenableBuilder<TextEditingValue>(
                  valueListenable: controller,
                  builder: (context, value, child) {
                    if (value.text.isNotEmpty) {
                      return GestureDetector(
                        onTap: controller.clear,
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: ColorManager.accentPrimary),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                          child: const Icon(
                            Icons.clear,
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  }),
              suffixIconColor: ColorManager.accentPrimary,
              hintText: 'Search',
              hintStyle: getBodyStyle(
                color: ColorManager.placeHolder,
                fontSize: FontSize.s14,
              ),
              border: InputBorder.none,
            ),
          );
        }),
      ),
    );
  }
}
