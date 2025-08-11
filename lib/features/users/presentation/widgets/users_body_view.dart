import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:users/config/routes/app_routes.dart';
import 'package:users/features/users/presentation/controller/user_cubit/users_cubit.dart';
import 'package:users/features/users/presentation/controller/user_cubit/users_state.dart';
import 'package:users/features/users/presentation/widgets/user_card_item.dart';

class UsersBodyView extends StatelessWidget {
  const UsersBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserCubit>();
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      return NotificationListener<ScrollNotification>(
        onNotification: (scrollInfo) {
          log('scrollInfo: $scrollInfo', name: 'mostafa osman');
          if (!state.isLoading &&
              state.hasMore &&
              scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent) {
            cubit.getAllUsers();
          }
          return false;
        },
        child: RefreshIndicator(
          onRefresh: cubit.refreshUsers,
          child: ListView(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return UserCardItem(
                    user: user,
                    onTap: () {
                      context.push(
                        Routes.userDetails,
                        extra: user.id,
                      );
                    },
                  );
                },
              ),
              if (state.hasMore && state.isLoading)
                const Center(
                  child: CupertinoActivityIndicator(),
                ),
            ],
          ),
        ),
      );
    });
  }
}
