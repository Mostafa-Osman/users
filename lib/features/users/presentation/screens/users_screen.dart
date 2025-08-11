import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users/core/widgets/error_widget.dart';
import 'package:users/features/users/presentation/controller/user_cubit/users_cubit.dart';
import 'package:users/features/users/presentation/controller/user_cubit/users_state.dart';
import 'package:users/features/users/presentation/widgets/grid_shimmer.dart';
import 'package:users/features/users/presentation/widgets/my_app_bar.dart';
import 'package:users/features/users/presentation/widgets/users_body_view.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state.isLoading && state.users.isEmpty) {
            return const GridShimmer();
          }

          if (state.error != null && state.users.isEmpty) {
            final cubit = context.read<UserCubit>();
            return ErrorWidgetView(
              onPressed: cubit.getAllUsers,
            );
          }
          return const UsersBodyView();
        },
      ),
    );
  }
}
