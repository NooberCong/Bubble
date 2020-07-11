import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bubble/core/params/params.dart';
import 'package:bubble/domain/i_cloud_data_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'conversation_photos_showcase_event.dart';
part 'conversation_photos_showcase_state.dart';
part 'conversation_photos_showcase_bloc.freezed.dart';

@injectable
class ConversationPhotosShowcaseBloc extends Bloc<
    ConversationPhotosShowcaseEvent, ConversationPhotosShowcaseState> {
  final ICloudDataService cloudDataService;
  int loadLimit = 15;

  ConversationPhotosShowcaseBloc(this.cloudDataService);
  @override
  Stream<ConversationPhotosShowcaseState> mapEventToState(
    ConversationPhotosShowcaseEvent event,
  ) async* {
    yield const ConversationPhotosShowcaseState.loading();
    final photoUrlsOrFailure = await cloudDataService.fetchConversationPhotos(
        Params.map({"roomId": event.roomId, "limit": loadLimit}));
    yield* photoUrlsOrFailure.fold((error) async* {
      yield const ConversationPhotosShowcaseState.error(
          "Photos retrieval failed, retrying...");
    }, (urls) async* {
      if (urls.length < loadLimit) {
        yield const ConversationPhotosShowcaseState.endReached();
      } else {
        loadLimit += 15;
      }
      yield ConversationPhotosShowcaseState.loaded(urls);
    });
  }

  @override
  ConversationPhotosShowcaseState get initialState =>
      const ConversationPhotosShowcaseState.initial();
}
