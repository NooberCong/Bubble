import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bubble/core/failures/failure.dart';
import 'package:bubble/core/params/params.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/domain/i_cloud_data_service.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'find_user_screen_event.dart';
part 'find_user_screen_state.dart';
part 'find_user_screen_bloc.freezed.dart';

@injectable
class FindUserScreenBloc
    extends Bloc<FindUserScreenEvent, FindUserScreenState> {
  final ICloudDataService cloudDataService;

  FindUserScreenBloc(this.cloudDataService);
  @override
  FindUserScreenState get initialState => const FindUserScreenState.initial();

  @override
  Stream<FindUserScreenState> mapEventToState(
    FindUserScreenEvent event,
  ) async* {
    yield const FindUserScreenState.loading();
    yield* event.when(
      findUserByUID: (uid) async* {
        final userOrFailure =
            await cloudDataService.fetchUserByUID(Params.id(uid));
        yield _parseResult(userOrFailure);
      },
      random: (uid) async* {
        final userOrFailure =
            await cloudDataService.fetchRandomUser(Params.id(uid));
        yield _parseResult(userOrFailure);
      },
      startConveration: (user, otherUser) async* {
        await cloudDataService.addConversation(
            Params.map({"user": user, "otherUser": otherUser}));
      },
    );
  }

  FindUserScreenState _parseResult(Either<CloudFailure, User> userOrFailure) {
    return userOrFailure.fold(
        (error) => FindUserScreenState.error(error.message),
        (user) => FindUserScreenState.loaded(user));
  }
}
