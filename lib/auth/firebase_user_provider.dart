import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class FansTribeAdminFirebaseUser {
  FansTribeAdminFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

FansTribeAdminFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<FansTribeAdminFirebaseUser> fansTribeAdminFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<FansTribeAdminFirebaseUser>(
            (user) => currentUser = FansTribeAdminFirebaseUser(user));
