import 'package:equatable/equatable.dart';
import 'package:users/features/users/data/model/user_model.dart';

class UserDetailsState extends Equatable {
  final UserModel userDetails;
  final bool isLoading;
  final String? error;

  const UserDetailsState({
    required this.userDetails,
    this.isLoading = false,
    this.error,
  });

  factory UserDetailsState.initial() {
    return UserDetailsState(
      userDetails: UserModel(
        id: 0,
        firstName: '',
        lastName: '',
        email: '',
        avatar: '',
      ),
      isLoading: false,
      error: null,
    );
  }

  UserDetailsState copyWith({
    UserModel? userDetails,
    bool? isLoading,
    String? error,
  }) {
    return UserDetailsState(
      userDetails: userDetails ?? this.userDetails,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
        userDetails,
        isLoading,
        error,
      ];
}
