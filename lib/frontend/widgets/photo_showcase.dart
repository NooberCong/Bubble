import 'package:auto_route/auto_route.dart';
import 'package:bubble/bloc/photo_showcase_bloc/conversation_photos_showcase_bloc.dart';
import 'package:bubble/router.gr.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PhotoShowcase extends StatefulWidget {
  final String roomId;
  const PhotoShowcase({Key key, this.roomId}) : super(key: key);

  @override
  _PhotoShowcaseState createState() => _PhotoShowcaseState();
}

class _PhotoShowcaseState extends State<PhotoShowcase> {
  bool _canLoadMore;
  bool _isLoading;
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _isLoading = false;
    _canLoadMore = true;
    _controller = ScrollController(keepScrollOffset: true)
      ..addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConversationPhotosShowcaseBloc,
        ConversationPhotosShowcaseState>(
      listener: (context, state) {
        state.maybeWhen(
            error: (msg) => Fluttertoast.showToast(msg: msg),
            endReached: () => {
                  setState(() {
                    _canLoadMore = false;
                  })
                },
            loading: () {
              setState(() {
                _isLoading = true;
              });
            },
            loaded: (_) {
              setState(() {
                _isLoading = false;
              });
            },
            orElse: () {});
      },
      buildWhen: (_, state) =>
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
                      controller: _controller,
                      itemCount: urls.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => _navigateToPhotoView(urls[index]),
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
              if (_isLoading)
                const Center(child: CircularProgressIndicator())
              else
                const SizedBox(),
            ],
          ),
        );
      },
    );
  }

  void _onScroll() {
    if (_reachedBottom() && _canLoadMore) {
      context
          .bloc<ConversationPhotosShowcaseBloc>()
          .add(ConversationPhotosShowcaseEvent.loadImages(widget.roomId));
    }
  }

  bool _reachedBottom() {
    return _controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToPhotoView(String url) {
    ExtendedNavigator.of(context).pushNamed(Routes.fullPhoto,
        arguments: FullPhotoArguments(url: url, title: "Photo view"));
  }
}
