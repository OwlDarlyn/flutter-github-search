import 'package:flutter/material.dart';

import 'package:potje_test_assignment/presentation/resources/color_manager.dart';
import 'package:potje_test_assignment/presentation/resources/font_manager.dart';
import 'package:potje_test_assignment/presentation/resources/styles_manager.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({
    super.key,
  });

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  @override
  Widget build(BuildContext context) {
    late final controller = TextEditingController();

    @override
    void initState() {
      super.initState();
      controller.addListener(() {});
    }

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
            onChanged: (value) {},
            textInputAction: TextInputAction.done,
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
              suffixIcon: controller.text.isEmpty
                  ? null
                  : GestureDetector(
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
                    ),
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
