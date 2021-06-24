import 'package:dartz/dartz.dart';
import '../failures/failures.dart';
import 'package:uuid/uuid.dart';

import 'value_object.dart';

class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory UniqueId() {
    return UniqueId._(
      right(Uuid().v1()),
    );
  }

  factory UniqueId.fromUniqueString(String uniqueId) {
    return UniqueId._(
      right(uniqueId),
    );
  }

  UniqueId._(this.value);
}
