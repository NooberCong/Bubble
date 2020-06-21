import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bubble/core/params/params.dart';
import 'package:bubble/domain/i_cloud_data_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'user_status_ball_event.dart';
part 'user_status_ball_state.dart';
part 'user_status_ball_bloc.freezed.dart';

@injectable
class UserStatusBallBloc
    extends Bloc<UserStatusBallEvent, UserStatusBallState> {
  final ICloudDataService cloudDataService;

  UserStatusBallBloc(this.cloudDataService);
  @override
  UserStatusBallState get initialState => const UserStatusBallState.initial();

  @override
  Stream<UserStatusBallState> mapEventToState(
    UserStatusBallEvent event,
  ) async* {
    final userStatusStreamOrFailure =
        await cloudDataService.fetchUserStatusStream(Params.id(event.uid));
    yield userStatusStreamOrFailure.fold(
        (error) => UserStatusBallState.error(error.message),
        (stream) => UserStatusBallState.userStatusStreamLoaded(stream));
  }
}
