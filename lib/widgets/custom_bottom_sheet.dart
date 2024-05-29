import 'package:flutter/material.dart';
import 'package:flutter_hiring_task/widgets/custom_tile.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0).copyWith(top: 10),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Divider(
              height: 5,
              thickness: 5,
              color: Colors.grey,
              indent: 130,
              endIndent: 140,
              // indent: 2,
            ),
          ),
          SizedBox(height:10),
          CustomTile(text: 'Invite', iconData: Icons.link_outlined),
          CustomTile(text: 'Add member', iconData: Icons.person_add_alt_1_outlined),
          CustomTile(text: 'Add Group', iconData: Icons.group_add_outlined),
        ],
      ),
    );
  }
}
