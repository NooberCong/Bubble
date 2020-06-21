import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bubble/core/params/params.dart';
import 'package:bubble/domain/i_cloud_data_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';
part 'home_screen_bloc.freezed.dart';

@injectable
class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final ICloudDataService cloudDataService;

  HomeScreenBloc(this.cloudDataService);
  @override
  HomeScreenState get initialState => const HomeScreenState.initial();

  @override
  Stream<HomeScreenState> mapEventToState(
    HomeScreenEvent event,
  ) async* {
    final streamOrFailure = await cloudDataService
        .fetchConverstionSnapShotsStream(Params.id(event.uid));
    yield streamOrFailure.fold((error) => HomeScreenState.error(error.message),
        (stream) => HomeScreenState.conversationsStreamLoaded(stream));
  }
}
