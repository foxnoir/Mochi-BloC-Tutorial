// we want to check if a failure is the same as an other failure
// that's why we use equatable
import 'package:equatable/equatable.dart';

class ApiException extends Equatable {
  const ApiException({required this.message, required this.statusCode});

  final String message;
  final int statusCode;

  @override
  List<Object> get props => [message, statusCode];
}
