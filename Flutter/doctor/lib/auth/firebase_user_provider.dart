import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class CDATDoctorFirebaseUser {
  CDATDoctorFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

CDATDoctorFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<CDATDoctorFirebaseUser> cDATDoctorFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<CDATDoctorFirebaseUser>(
            (user) => currentUser = CDATDoctorFirebaseUser(user));
