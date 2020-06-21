import 'package:bubble/core/failures/failure.dart';
import 'package:bubble/core/params/params.dart';
import 'package:dartz/dartz.dart';
import 'entities/user.dart';

abstract class IAuth {
  Future<Either<AuthFailure, User>> getSignedInUser(Params params);

  Future<Either<AuthFailure, User>> signInWithEmailAndPassword(Params params);

  Future<Either<AuthFailure, User>> signUpWithEmailAndPassword(Params params);

  Future<Either<AuthFailure, User>> signInWithGoogle(Params params);

  void signOut(Params params);
}
