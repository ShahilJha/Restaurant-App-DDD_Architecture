import 'package:firebase_auth/firebase_auth.dart';
import 'package:restaurant_app/domain/auth/user.dart' as app;
import 'package:restaurant_app/domain/core/value_objects.dart';

extension FirebaseUserDomainX on User {
  app.User toDomain() {
    return app.User(
      id: UniqueId.fromUniqueString(uid),
    );
  }
}
