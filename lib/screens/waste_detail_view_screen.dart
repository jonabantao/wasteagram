import 'package:flutter/material.dart';
import 'package:wasteagram/models/post.dart';
import 'package:wasteagram/util/date_util.dart';
import 'package:wasteagram/widgets/post_scroll_view.dart';
import 'package:wasteagram/widgets/wasteagram_app_bar.dart';

class WasteDetailViewScreen extends StatelessWidget {
  static const route = 'waste-details';

  Post _getPostFromArgs(context) {
    final WasteDetailViewScreenArguments args =
        ModalRoute.of(context).settings.arguments;

    return args.post;
  }

  @override
  Widget build(BuildContext context) {
    final post = _getPostFromArgs(context);

    return Scaffold(
      appBar: WasteagramAppBar(),
      body: PostScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                displayDetailTitleDate(post.date),
                key: Key('detailsDate'),
                style: Theme.of(context).textTheme.headline,
              ),
              const SizedBox(height: 16.0),
              Semantics(
                image: true,
                label: 'Picture of wasted items',
                child: Image.network(
                  post.imageURL,
                  key: Key('detailsImage'),
                  width: MediaQuery.of(context).size.height * 0.4,
                  height: MediaQuery.of(context).size.height * 0.4,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Items: ${post.quantity}',
                key: Key('detailsQuantity'),
                style: Theme.of(context).textTheme.display1,
              ),
              const SizedBox(height: 24.0),
              Semantics(
                label: 'Coordinates of post',
                child: Text(
                  '(${post.longitude}, ${post.latitude})',
                  key: Key('detailsLocation'),
                  style: Theme.of(context).textTheme.subhead,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WasteDetailViewScreenArguments {
  final Post post;

  WasteDetailViewScreenArguments(this.post) : assert(post != null);
}
