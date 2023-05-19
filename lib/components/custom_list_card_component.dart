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
      margin: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              listItem.name,
              style: getBodyStyle(
                color: ColorManager.textPrimary,
                fontSize: FontSize.s14,
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.star_border,
                ))
          ],
        ),
      ),
    );
  }
}
