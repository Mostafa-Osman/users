import 'package:flutter/material.dart';
import 'package:users/core/widgets/custom_cached_network_image.dart';
import 'package:users/features/users/data/model/user_model.dart';
import 'package:users/features/users/presentation/widgets/user_info_item.dart';

class UserDetailsBodyView extends StatelessWidget {
  const UserDetailsBodyView({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomCachedNetworkImage(
              imgUrl: user.avatar,
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            UserInfoItem(
              icon: Icons.person_pin_outlined,
              title: '${user.firstName} ${user.lastName}',
            ),
            const SizedBox(height: 15),
            UserInfoItem(
              icon: Icons.email_rounded,
              title: user.email,
            ),
          ],
        ),
      ),
    );
  }
}
