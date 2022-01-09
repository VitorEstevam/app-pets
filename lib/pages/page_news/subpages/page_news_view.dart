import 'package:app_pets/classes/news.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PageNewsView extends StatefulWidget {
  final News news;
  const PageNewsView(this.news, {Key? key}) : super(key: key);

  @override
  _PageNewsViewState createState() => _PageNewsViewState();
}

class _PageNewsViewState extends State<PageNewsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 160.0,
            centerTitle: true,
            flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                title: constraints.biggest.height == 80
                    ? Text(widget.news.title,softWrap: false, maxLines: 1,overflow: TextOverflow.fade,)
                    : null,
                background: Container(
                  foregroundDecoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.news.header),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
              child: Text(
                widget.news.title,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.directions_run),
                      Text("Adicionar uma tarefa")
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: Text(
                widget.news.text,
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
