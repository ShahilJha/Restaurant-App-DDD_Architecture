import 'package:dartz/dartz.dart';
import 'package:restaurant_app/domain/core/failures/failures.dart';
import 'package:restaurant_app/domain/core/value_objects/value_object.dart';
import 'package:restaurant_app/domain/core/value_validators/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) =>
      EmailAddress._(validateEmailAddress(input));

  int getValueLength() {
    int length = value.fold((l) => l.failedValue.length, (r) => r.length);
    return length;
  }

  EmailAddress._(this.value);
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) => Password._(validatePassword(input));

  Password._(this.value);
}
