import 'package:bubble/bloc/sign_up_bloc/sign_up_screen_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpStateManager {
  final List<SignUpScreenState> _states = [];

  int _pointer = 0;

  List<SignUpScreenState> get states => _states;

  bool get hasNext => _pointer < _states.length;

  void put(SignUpScreenState state) {
    //If user is at a previous state, replace the state instead
    if (_pointer < _states.length) {
      _states[_pointer] = state;
    } else {
      //If not, add to the list
      _states.add(state);
    }
    _pointer++;
  }

  SignUpScreenState getNextState() {
    return _states[_pointer];
  }

  SignUpScreenState getPreviousState() {
    return _states[--_pointer];
  }

  Map<String, dynamic> parseDataFromStates() {
    final details = <String, dynamic>{};
    for (final s in _states) {
      s.maybeMap(
        name: (s) => details["name"] = s.initialValue,
        bio: (s) => details["bio"] = s.initialValue,
        email: (s) => details["email"] = s.initialValue,
        orElse: () {},
      );
    }
    details["chattingWith"] = "";
    details["isOnline"] = true;
    return details;
  }
}
