import 'package:flutter/material.dart';

import '../../../../core.dart';

class TabletView extends StatelessWidget {
  const TabletView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: CharactersListView(),
        ),
        Expanded(
          child: DetailsView(),
        ),
      ],
    );
  }
}
