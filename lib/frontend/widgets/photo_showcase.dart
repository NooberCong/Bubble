import 'package:auto_route/auto_route.dart';
import 'package:bubble/bloc/photo_showcase_bloc/conversation_photos_showcase_bloc.dart';
import 'package:bubble/router.gr.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoShowcase extends StatelessWidget {
  final String roomId;
  const PhotoShowcase({Key key, this.roomId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConversationPhotosShowcaseBloc,
        ConversationPhotosShowcaseState>(
      condition: (_, state) =>
          state.maybeWhen(loaded: (_) => true, orElse: () => false),
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              state.maybeWhen(
                  loaded: (urls) => GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 5,
                        crossAxisCount: 3,
                      ),
                      itemCount: urls.length,
                      primary: false,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () =>
                              _navigateToPhotoView(urls[index], context),
                          child: CachedNetworkImage(
                            imageUrl: urls[index],
                            fit: BoxFit.cover,
                            placeholder: (_, __) => Container(
                              color: Colors.grey.shade600,
                            ),
                            errorWidget: (_, __, ___) => Image.asset(
                              "assets/images/img_not_available.jpeg",
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        );
                      }),
                  orElse: () => const SizedBox()),
            ],
          ),
        );
      },
    );
  }

  void _navigateToPhotoView(String url, BuildContext context) {
    ExtendedNavigator.of(context).pushNamed(Routes.fullPhoto,
        arguments: FullPhotoArguments(url: url, title: "Photo view"));
  }
}
