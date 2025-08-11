import 'package:flutter/material.dart';
import 'package:users/core/utils/app_colors.dart';

class UserInfoItem extends StatelessWidget {
  const UserInfoItem({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: isDarkTheme ? null : AppColors.secondary,
        border: isDarkTheme
            ? Border.all(
                color: AppColors.white,
                width: 1.0,
              )
            : null,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.primary,
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
