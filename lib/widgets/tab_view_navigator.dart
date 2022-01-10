import 'package:flutter/material.dart';

class TabViewNavigator extends StatefulWidget {
  final Function(BuildContext) builder;
  const TabViewNavigator({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  State<TabViewNavigator> createState() => _TabViewNavigatorState();
}

class _TabViewNavigatorState extends State<TabViewNavigator>
    with AutomaticKeepAliveClientMixin {
  var homeNavigatorKey = GlobalKey<NavigatorState>();
  var widgetKey = GlobalKey<State<StatefulWidget>>();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widgetKey,
      child: WillPopScope(
        onWillPop: () async {
          var box = widgetKey.currentContext?.findRenderObject() as RenderBox;

          var yPosition = box.localToGlobal(Offset.zero).dy;
          //invisible
          if (yPosition.isNaN) {
            print('Widget is invisible');
            return Future.value(true);
          }
          //visible
          else {
            print('Widget is visible.');
            return !(await homeNavigatorKey.currentState!.maybePop());
          }
        },
        child: Navigator(
          key: homeNavigatorKey,
          onGenerateRoute: (settings) {
            return MaterialPageRoute(
              builder: (context) => widget.builder(context),
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}