import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hiring_task/utils/app_colors.dart';
import 'package:flutter_hiring_task/utils/const.dart';
import 'package:flutter_hiring_task/widgets/TransitionAppBar.dart';
import 'package:flutter_hiring_task/widgets/custom_text.dart';
import 'package:flutter_hiring_task/widgets/custom_tile.dart';
import 'package:flutter_hiring_task/widgets/members_tile.dart';
import 'package:flutter_hiring_task/widgets/round_suggestion_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            TransitionAppBar(
              extent: 300,
              avatar: Image.asset(
                "assets/images/bg-image-1.png",
                fit: BoxFit.cover,
              ),
              title: "The weekend",
              subtitle: 'Community . +11K Members',
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0)
                            .copyWith(top: 10),
                        child: Column(
                          children: [
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: AppConst.kConst,
                                    style: TextStyle(
                                        fontSize: 16,
                                        height: 1.7,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: 'Read more',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.redColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: 20,
                              child: Row(
                                children: [
                                  ListView.separated(
                                    shrinkWrap: true,
                                    separatorBuilder: (context, i) =>
                                        SizedBox(width: 8),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 4,
                                    itemBuilder: (context, i) {
                                      return const RoundSuggestionWidget(
                                          text: 'Outdoor');
                                    },
                                  ),
                                  const SizedBox(width: 8),
                                  // Adjust the width as needed
                                  const RoundSuggestionWidget(text: '+1'),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: 'Media, docs and links',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                                const Icon(Icons.arrow_forward_ios_rounded),
                              ],
                            ),
                            const SizedBox(height: 6),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(left: 14),
                          itemBuilder: (context, i) {
                            return Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/bg-image-1.png'),
                                    fit: BoxFit.cover,
                                  )),
                            );
                          },
                          separatorBuilder: (context, i) =>
                              const SizedBox(width: 6),
                          itemCount: 4,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Column(
                          children: [
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: 'Mute notification',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                                Switch(
                                  value: false,
                                  onChanged: (val) {},
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            CustomTile(
                              text: 'Clear chat',
                              iconData: Icons.delete,
                            ),
                            CustomTile(
                              text: 'Encryption',
                              iconData: Icons.lock,
                            ),
                            CustomTile(
                              text: 'Exit community',
                              iconData: Icons.logout_rounded,
                              iconDataColor: Colors.red,
                              textColor: Colors.red,
                            ),
                            CustomTile(
                              text: 'Report',
                              iconData: Icons.thumb_down_off_alt_rounded,
                              iconDataColor: Colors.red,
                              textColor: Colors.red,
                            ),
                            Row(
                              children: [
                                if (!_isSearching)
                                  Expanded(
                                    child: CustomText(
                                      text: 'Members',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  alignment:Alignment.centerLeft,
                                  curve: Curves.easeInOut,
                                  width: _isSearching ? 280 : 0,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey.withOpacity(0.3),
                                  ),
                                  child: Visibility(
                                    visible: _isSearching,
                                    child: const Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 4, left: 14),
                                      child: TextField(
                                        autofocus: true,
                                        decoration: InputDecoration(
                                          hintText: 'Search member',
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                if (_isSearching)
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _isSearching = false;
                                      });
                                    },
                                    child: CustomText(text: 'Cancel'),
                                  ),
                                if (!_isSearching)
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _isSearching = true;
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          right: 16, bottom: 4),
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: Colors.black26,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Icon(
                                        Icons.search,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, i) {
                                return const MembersTile();
                              },
                              separatorBuilder: (context, i) =>
                                  const SizedBox(height: 8),
                              itemCount: 12,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
