import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:restaurant_app/domain/core/errors/errors.dart';
import 'package:uuid/uuid.dart';

import '../failures/failures.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  ///Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    //id - identity - same as writing (right) => right
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ValueObject<T> &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}
