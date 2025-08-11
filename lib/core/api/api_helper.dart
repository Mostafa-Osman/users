import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:dartz/dartz.dart';

import 'failures.dart';

class ApiService {
  final String baseUrl = "https://reqres.in/api";

  Future<Either<Failure, Map<String, dynamic>>> get(String endpoint) async {
    try {
      final response = await http.get(
        headers: {
          'Content-Type': 'application/json',
          'x-api-key': 'reqres-free-v1',
        },
        Uri.parse("$baseUrl/$endpoint"),
      );
      log("$baseUrl/$endpoint");
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(jsonDecode(response.body));
      } else {
        log(response.body.toString());
        return Left(Failure(statusMessage: "Error: ${response.statusCode}"));
      }
    } on Exception catch (e, s) {
      log(e.toString(), stackTrace: s);
      return Left(Failure(statusMessage: e.toString()));
    }

  }
}
