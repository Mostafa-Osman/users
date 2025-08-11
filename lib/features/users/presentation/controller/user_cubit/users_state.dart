import 'package:equatable/equatable.dart';
import 'package:users/features/users/data/model/user_model.dart';

class UserState extends Equatable {
  final List<UserModel> users;
  final bool isLoading;
  final int page;
  final bool hasMore;
  final String? error;

  const UserState({
    this.users = const [],
    this.isLoading = false,
    this.page = 1,
    this.hasMore = true,
    this.error,
  });

  UserState copyWith({
    List<UserModel>? users,
    bool? isLoading,
    int? page,
    bool? hasMore,
    String? error,
  }) {
    return UserState(
      users: users ?? this.users,
      isLoading: isLoading ?? this.isLoading,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
        users,
        isLoading,
        page,
        hasMore,
        error,
      ];
}
