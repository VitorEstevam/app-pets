import 'package:app_pets/pages/page_news/subpages/page_news.dart';
import 'package:app_pets/pages/page_news/subpages/page_news_view.dart';
import 'package:flutter/material.dart';

class RouterPageNews extends StatefulWidget {
  const RouterPageNews({Key? key}) : super(key: key);

  @override
  _RouterPageNewsState createState() => _RouterPageNewsState();
}

class _RouterPageNewsState extends State<RouterPageNews>
    with AutomaticKeepAliveClientMixin<RouterPageNews> {
      
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (_) => PageNews());
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
