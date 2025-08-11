import 'dart:developer';

import 'package:users/core/api/api_helper.dart';
import 'package:users/core/api/failures.dart';
import 'package:users/features/users/data/model/user_model.dart';

import 'package:dartz/dartz.dart';

class UsersServices {
  final ApiService apiService;

  UsersServices(this.apiService);

  Future<Either<Failure, List<UserModel>>> getAllUsers(int page) async {
    try {
      final result = await apiService.get("users?page=$page");
      return result.fold(
        (failure) {
          return Left(failure);
        },
        (data) {
          final users = (data['data'] as List)
              .map((json) => UserModel.fromJson(json))
              .toList();
          log(data['data'].toString());
          return Right(users);
        },
      );
    } on Exception catch (e, s) {
      log(e.toString(), stackTrace: s);
      return Left(Failure(statusMessage: "Parsing error: $e"));
    }
  }

  Future<Either<Failure, UserModel>> getUserById(int id) async {
    try {
      final result = await apiService.get("users/$id");
      return result.fold(
        (failure) => Left(failure),
        (data) {
          log(data['data'].toString());
          final user = UserModel.fromJson(data['data']);
          return Right(user);
        },
      );
    } on Exception catch (e, s) {
      log("Error fetching user by ID: $e", stackTrace: s);
      return Left(Failure(statusMessage: "Parsing error: $e"));
    }
  }
}
