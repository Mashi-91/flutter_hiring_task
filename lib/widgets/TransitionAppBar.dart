import 'package:flutter/material.dart';
import 'package:flutter_hiring_task/utils/app_colors.dart';
import 'package:flutter_hiring_task/widgets/custom_bottom_sheet.dart';

class TransitionAppBar extends StatelessWidget {
  TransitionAppBar({
    required this.avatar,
    required this.title,
    required this.subtitle,
    this.extent = 250,
    Key? key,
  }) : super(key: key);

  final Widget avatar;
  final double extent;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _TransitionAppBarDelegate(
        avatar: avatar,
        title: title,
        subtitle: subtitle,
        extent: extent > 200 ? extent : 200,
      ),
    );
  }
}

class _TransitionAppBarDelegate extends SliverPersistentHeaderDelegate {
  _TransitionAppBarDelegate(
      {required this.avatar,
      required this.title,
      required this.subtitle,
      this.extent = 250})
      : assert(extent >= 200, '');

  final Widget avatar;
  final double extent;
  final String title;
  final String subtitle;

  final _avatarAlignTween =
      AlignmentTween(begin: Alignment.bottomLeft, end: Alignment.topLeft);
  final _avatarMarginTween = EdgeInsetsTween(
    end: const EdgeInsets.only(left: 14, top: 16),
  );

  final _iconAlignTween =
      AlignmentTween(begin: Alignment.bottomRight, end: Alignment.centerRight);
  final _titleMarginTween = EdgeInsetsTween(
    begin: const EdgeInsets.only(bottom: 14, left: 10),
    end: const EdgeInsets.only(left: 64, top: 16),
  );

  @override
  double get maxExtent => extent;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(_TransitionAppBarDelegate oldDelegate) {
    return avatar != oldDelegate.avatar ||
        title != oldDelegate.title ||
        subtitle != oldDelegate.subtitle;
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final tempVal = maxExtent * 72 / 100;
    final progress = shrinkOffset > tempVal ? 1.0 : shrinkOffset / tempVal;
    final avatarMargin = _avatarMarginTween.lerp(progress);
    final titleMargin = _titleMarginTween.lerp(progress);

    final avatarAlign = _avatarAlignTween.lerp(progress);
    final iconAlign = _iconAlignTween.lerp(progress);

    final avatarSize = (1 - progress) * 360 + 42;
    final borderRadius = BorderRadius.circular(avatarSize * progress);

    return Stack(
      children: <Widget>[
        AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: 80,
          constraints: BoxConstraints(maxHeight: minExtent),
          color: progress > 0.8 ? AppColors.redColor : Colors.white,
        ),
        Padding(
          padding: avatarMargin,
          child: Align(
            alignment: avatarAlign,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              height: avatarSize,
              width: avatarSize,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
              ),
              child: ClipRRect(
                borderRadius: borderRadius,
                child: avatar,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            height: progress < 0.4 ? 40 * (1 - progress) * 1.8 : 0,
            decoration: const BoxDecoration(
              color: AppColors.redColor,
            ),
          ),
        ),
        Container(
          margin: titleMargin,
          alignment: avatarAlign,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: titleMargin,
          child: Align(
            alignment: iconAlign,
            child: InkWell(
              onTap: () async {
                if (progress > 0.8) {
                  await showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    constraints: const BoxConstraints(maxHeight: 190),
                    builder: (_) => const CustomBottomSheet(),
                  );
                }
              },
              child: Container(
                margin: const EdgeInsets.only(right: 16, bottom: 4),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: progress < 0.8 ? Colors.transparent : Colors.black26,
                    borderRadius:
                        BorderRadius.circular(progress < 0.8 ? 10 : 20),
                    border: progress < 0.8
                        ? Border.all(color: Colors.white)
                        : const Border()),
                child: Icon(
                  progress < 0.8 ? Icons.share : Icons.more_vert_rounded,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
