
  import 'package:flutter/material.dart';

AppBar CustomAppBar(BuildContext context) {
    return AppBar(
        actionsIconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(
                Icons.search,
              ),
              onPressed: () {},
            ),
          ),
        ],
      );
  }
