import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wasteagram/models/post.dart';
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
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                DateFormat('EEEE, MMM. d y').format(post.date),
                style: Theme.of(context).textTheme.headline,
              ),
              Image.network(
                post.imageURL,
                width: MediaQuery.of(context).size.height * 0.4,
                height: MediaQuery.of(context).size.height * 0.4,
                fit: BoxFit.cover,
              ),
              Text(
                'Items: ${post.quantity}',
                style: Theme.of(context).textTheme.subhead,
              ),
              Text(
                '(${post.longitude}, ${post.latitude})',
                style: Theme.of(context).textTheme.subtitle,
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
