import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users/features/users/data/services/users_services.dart';
import 'package:users/features/users/presentation/controller/user_details_cubit/user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  final UsersServices services;

  UserDetailsCubit(this.services) : super(UserDetailsState.initial());

  Future<void> getUserById(int userId) async {
    try {
      emit(
        state.copyWith(
          isLoading: true,
          error: null,
        ),
      );

      final result = await services.getUserById(userId);

      result.fold(
        (failure) {
          emit(state.copyWith(
            isLoading: false,
            error: failure.statusMessage,
          ));
        },
        (user) {
          emit(
            state.copyWith(
              userDetails: user,
              isLoading: false,
              error: null,
            ),
          );
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
}
