import 'package:injectable/injectable.dart';

@lazySingleton
class SignUpValidator {
  final String nameInputError = "Name must not be empty";
  final String passwordInputError =
      "Password must contain at least one digit one lowercase character, one uppercase characater and must be between 6 and 32 characters";
  final String bioInputError = "Bio must not be empty";
  final String emailInputError = "Please enter a valid email address";

  final _emailRegex = RegExp(r"^\w+[\w-\.]*\@\w+((-\w+)|(\w*))\.[a-z]{2,3}$");
  final _passwordRegex = RegExp(r"^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{6,32}$");

  bool validateName(String name) {
    return name.isNotEmpty;
  }

  bool validateBio(String bio) {
    return bio.isNotEmpty;
  }

  bool validateEmail(String email) {
    return _emailRegex.hasMatch(email);
  }

  bool validatePassword(String password) {
    return _passwordRegex.hasMatch(password);
  }
}
