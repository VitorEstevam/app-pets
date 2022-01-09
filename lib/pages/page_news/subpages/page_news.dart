import 'package:app_pets/classes/news.dart';
import 'package:app_pets/stores/news/store_news.dart';
import 'package:app_pets/widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageNews extends StatefulWidget {
  const PageNews({Key? key}) : super(key: key);

  @override
  State<PageNews> createState() => _PageNewsState();
}

class _PageNewsState extends State<PageNews> {
  @override
  Widget build(BuildContext context) {
    final news = Provider.of<StoreNews>(context).news;

    return Scaffold(
      appBar: AppBar(
        title: Text("Notícias"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: news.length,
          itemBuilder: (context, i) {
            var item = news[i];
            return NewsCard(item: item);
          },
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final News item;

  void openNews(BuildContext context, News news) {
    Navigator.pushNamed(context, "page_news_view");
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openNews(context, item),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          height: 400,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  foregroundDecoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(item.header), fit: BoxFit.cover),
                  ),
                ),
              ),
              Container(
                height: 15,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 15,
                      ),
                      Text(
                        item.text,
                        style: const TextStyle(fontSize: 15),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () => openNews(context,item),
                              child: const Text(
                                "LEIA MAIS",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
