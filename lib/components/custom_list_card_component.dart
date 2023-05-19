import 'package:flutter/material.dart';

import 'package:potje_test_assignment/model/git_repos_model.dart';
import 'package:potje_test_assignment/presentation/resources/color_manager.dart';
import 'package:potje_test_assignment/presentation/resources/font_manager.dart';
import 'package:potje_test_assignment/presentation/resources/styles_manager.dart';

class CustomListCard extends StatelessWidget {
  final GitRepo listItem;

  const CustomListCard({super.key, required this.listItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      elevation: 0,
      color: ColorManager.layer1,
      margin: const EdgeInsets.only(left: 16, right: 16, top: 8),
      child: Container(
        height: 55,
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                listItem.name,
                style: getBodyStyle(
                  color: ColorManager.textPrimary,
                  fontSize: FontSize.s14,
                ),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.star,
                  color: ColorManager.placeHolder,
                  size: 28,
                ))
          ],
        ),
      ),
    );
  }
}
