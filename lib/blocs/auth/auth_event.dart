abstract class AuthEvent {
  const AuthEvent();
}

class AuthEventLogin extends AuthEvent {
  const AuthEventLogin();
}

class AuthEventLogout extends AuthEvent {
  const AuthEventLogout();
}
