import 'package:dartz/dartz.dart';
import 'package:restaurant_app/domain/core/failures.dart';
import 'package:restaurant_app/domain/core/value_object.dart';
import 'package:restaurant_app/domain/core/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) =>
      EmailAddress._(validateEmailAddress(input));

  EmailAddress._(this.value);
}

class Password extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) => Password._(validatePassword(input));

  Password._(this.value);
}
