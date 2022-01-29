import 'package:app_pets/classes/news.dart';
import 'package:mobx/mobx.dart';

// run builder on cmd to generate the code

// Include this
part 'store_news.g.dart';

class StoreNews = _StoreNews with _$StoreNews;

String lorem =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sit amet tincidunt urna. Donec maximus iaculis turpis. Duis non massa eu massa mollis bibendum at quis ex. Suspendisse eu elementum nibh, vitae semper metus. Vivamus vulputate velit sit amet ex fringilla, eu finibus massa mollis. Cras lobortis volutpat odio ac auctor. Praesent lobortis convallis erat, eu tincidunt elit tincidunt ac. Duis pulvinar dapibus dui ut facilisis. Vestibulum semper dignissim eros a fringilla. Pellentesque scelerisque tellus ipsum, vitae pharetra orci vehicula gravida. Aenean eget sem nisi. Phasellus nisi risus, pellentesque ac sapien a, pellentesque interdum mi. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent ullamcorper purus metus, id accumsan leo consequat eu. Vestibulum sed lacus nec metus vehicula tempus id eget ex. Nulla a quam nec dui volutpat vehicula sit amet facilisis ligula.\n\nSed mauris eros, viverra ac vestibulum in, volutpat nec sem. Donec non ipsum vitae nulla interdum rutrum ut sed sem. Nullam a diam nunc. Cras at massa et velit porta pharetra eu in eros. Praesent interdum tortor et dignissim fringilla. Quisque laoreet congue ex ullamcorper aliquet. Quisque id ullamcorper diam. Pellentesque posuere nec arcu eget condimentum. Etiam fringilla risus et orci viverra luctus. Curabitur eget ipsum mi. Integer malesuada urna quis orci scelerisque, non fringilla risus volutpat.";

// Create the class
abstract class _StoreNews with Store {
  @observable
  ObservableList<News> news = ObservableList<News>.of([
    News(
        title: "As vacinas imprecidíveis para seus cachorros e gatos",
        header: "lib/assets/newsHeader.jpg",
        text: lorem,
        taskTitle: "Levar para vacinar"),
    News(
        title: "teste2",
        header: "lib/assets/newsHeader.jpg",
        text: lorem),
    News(
        title: "teste3",
        header: "lib/assets/newsHeader.jpg",
        text: lorem)
  ]);
}
