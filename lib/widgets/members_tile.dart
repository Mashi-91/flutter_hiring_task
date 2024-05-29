import 'package:flutter/material.dart';
import 'package:flutter_hiring_task/utils/app_colors.dart';
import 'package:flutter_hiring_task/widgets/custom_text.dart';

class MembersTile extends StatefulWidget {
  const MembersTile({Key? key}) : super(key: key);

  @override
  _MembersTileState createState() => _MembersTileState();
}

class _MembersTileState extends State<MembersTile> {
  bool _isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(41),
        child: Image.asset('assets/images/bg-image-2.png', fit: BoxFit.cover),
      ),
      title: CustomText(text: 'Yashika'),
      subtitle: CustomText(text: '29, India'),
      trailing: InkWell(
        onTap: () {
          setState(() {
            _isFollowing = !_isFollowing;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: _isFollowing ? Colors.grey : Colors.red,
          ),
          child: Text(
            _isFollowing ? 'Following' : 'Add',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
