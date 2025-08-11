import 'package:flutter/material.dart';
import 'package:users/core/utils/app_colors.dart';
import 'package:users/core/widgets/custom_cached_network_image.dart';
import 'package:users/features/users/data/model/user_model.dart';

class UserCardItem extends StatelessWidget {
  final UserModel user;
  final VoidCallback onTap;

  const UserCardItem({
    super.key,
    required this.user,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: AppColors.boxShadow,
          border: Border.all(
            color: AppColors.white,
            width: 1.0,
          ),
        ),
        child: Column(
          children: [
            CustomCachedNetworkImage(
              imgUrl: user.avatar,
              height: 180,
              fit: BoxFit.cover,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "${user.firstName} ${user.lastName}",
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              user.email,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
