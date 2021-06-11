import 'package:restaurant_app/domain/core/failures.dart';

///this is not a Failure, rather they are errors specially thrown to crash an app.
class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explanation = 'Encountered a ValueFailure at an unrecoverable point.';
    return Error.safeToString(
        '$explanation TERMINATING. Failure value: $valueFailure');
  }
}
