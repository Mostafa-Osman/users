import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users/features/users/data/services/users_services.dart';
import 'package:users/features/users/presentation/controller/user_cubit/users_state.dart';

class UserCubit extends Cubit<UserState> {
  final UsersServices services;

  UserCubit(this.services) : super(const UserState());

  Future<void> getAllUsers() async {
    try {
      if (state.isLoading || !state.hasMore) return;

      emit(state.copyWith(isLoading: true, error: null));

      final result = await services.getAllUsers(state.page);

      result.fold(
        (failure) {
          emit(state.copyWith(
            isLoading: false,
            error: failure.statusMessage,
          ));
        },
        (newUsers) {
          emit(state.copyWith(
            users: [...state.users, ...newUsers],
            isLoading: false,
            page: state.page + 1,
            hasMore: newUsers.isNotEmpty,
          ));
        },
      );
    } on Exception catch (e, s) {
      emit(state.copyWith(
        isLoading: false,
        error: 'An unexpected error occurred: ${e.toString()}',
      ));
      log(e.toString(), stackTrace: s);
    }
  }

  Future<void> refreshUsers() async {
    emit(const UserState()); // reset state
    await getAllUsers();
  }
}
