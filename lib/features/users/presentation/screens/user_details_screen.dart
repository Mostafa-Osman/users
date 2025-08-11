import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:users/core/widgets/error_widget.dart';
import 'package:users/features/users/presentation/controller/user_details_cubit/user_details_cubit.dart';
import 'package:users/features/users/presentation/controller/user_details_cubit/user_details_state.dart';
import 'package:users/features/users/presentation/widgets/user_details_body_view.dart';
import 'package:users/features/users/presentation/widgets/user_details_shimmer.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({
    super.key,
    required this.userId,
  });

  final int userId;

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  late final UserDetailsCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<UserDetailsCubit>();
    cubit.getUserById(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          onTap: () => context.pop(),
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: BlocBuilder<UserDetailsCubit, UserDetailsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const UserDetailsShimmer();
          }
          log(state.error.toString(), name: 'mostafa');
          if (state.error != null) {
            return ErrorWidgetView(
              onPressed: () => cubit.getUserById(widget.userId),
            );
          }
          return UserDetailsBodyView(
            user: state.userDetails,
          );
        },
      ),
    );
  }
}
