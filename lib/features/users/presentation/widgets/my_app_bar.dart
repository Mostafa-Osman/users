import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users/core/utils/app_colors.dart';
import 'package:users/features/app_theme/controller/ThemeCubit.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MyAppBarState extends State<MyAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _iconController;

  @override
  void initState() {
    super.initState();
    _iconController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // Start icon animation based on current theme
    final theme = context.read<ThemeCubit>().state;
    if (theme == ThemeMode.dark) {
      _iconController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = context.watch<ThemeCubit>().state == ThemeMode.dark;
    return AppBar(
      title: Text(
        "Users",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: GestureDetector(
            onTap: _toggleTheme,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: animation,
                  child: ScaleTransition(scale: animation, child: child),
                );
              },
              child: Icon(
                isDarkTheme ? Icons.nightlight_round : Icons.wb_sunny,
                key: ValueKey<bool>(isDarkTheme),
                color: isDarkTheme ? Colors.white : AppColors.warning,
                size: 28,
              ),
            ),
          ),
        ),
      ],
      centerTitle: true,
    );
  }

  void _toggleTheme() {
    final cubit = context.read<ThemeCubit>();
    if (cubit.state == ThemeMode.light) {
      _iconController.forward();
    } else {
      _iconController.reverse();
    }
    cubit.toggleTheme();
  }
}
