import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class CrohnTrackerFirebaseUser {
  CrohnTrackerFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

CrohnTrackerFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<CrohnTrackerFirebaseUser> crohnTrackerFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<CrohnTrackerFirebaseUser>(
            (user) => currentUser = CrohnTrackerFirebaseUser(user));
