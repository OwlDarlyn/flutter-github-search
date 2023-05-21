import 'package:flutter/material.dart';
import 'package:potje_test_assignment/data/local/database_helper.dart';

import 'package:potje_test_assignment/model/git_repos_model.dart';
import 'package:potje_test_assignment/presentation/resources/color_manager.dart';
import 'package:potje_test_assignment/presentation/resources/font_manager.dart';
import 'package:potje_test_assignment/presentation/resources/styles_manager.dart';

class CustomListCard extends StatefulWidget {
  final GitRepo listItem;
  bool isInFavorites;

  CustomListCard(
      {super.key, required this.listItem, this.isInFavorites = false});

  @override
  State<CustomListCard> createState() => _CustomListCardState();
}

class _CustomListCardState extends State<CustomListCard> {
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
                widget.listItem.name,
                style: getBodyStyle(
                  color: ColorManager.textPrimary,
                  fontSize: FontSize.s14,
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  if (widget.isInFavorites) {
                    DatabaseHelper.instance.delete(widget.listItem);
                    widget.isInFavorites = false;
                    setState(() {});
                  } else {
                    DatabaseHelper.instance.add(widget.listItem);
                    widget.isInFavorites = true;
                    setState(() {});
                  }
                },
                icon: Icon(
                  Icons.star,
                  color: widget.isInFavorites
                      ? ColorManager.accentPrimary
                      : ColorManager.placeHolder,
                  size: 28,
                ))
          ],
        ),
      ),
    );
  }
}
