import 'package:app_pets/pages/page%20pets/subpages/page_add_task/widgets/date_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PeriodSelector extends StatefulWidget  {
  final void Function(DateTime) onSelectedUnique;

  const PeriodSelector({
    Key? key, required this.onSelectedUnique,
  }) : super(key: key);

  @override
  State<PeriodSelector> createState() => _PeriodSelectorState();
}

class _PeriodSelectorState extends State<PeriodSelector> with SingleTickerProviderStateMixin {
  
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Frequência",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Container(height: 10),
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(3)),
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
            child: TabBar(
              controller: _tabController,
              isScrollable: false,
              labelColor: Colors.white,
              unselectedLabelColor: Theme.of(context).primaryColor,
              indicator: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              indicatorColor: Colors.transparent,
              labelPadding: EdgeInsets.only(top: 3),
              tabs: const [
                TabBarItem(title: "única"),
                TabBarItem(
                  title: "Semanal",
                  showBorder: true,
                ),
                TabBarItem(title: "Periódica"),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                      child: Align(
                    alignment: Alignment.topLeft,
                    child: FractionallySizedBox(
                      widthFactor: 0.5,
                      child: DatePicker(callback: (date)=>widget.onSelectedUnique(date)),
                    ),
                  )),
                ),
                Container(child: Text('selector here')),
                Container(child: Text('selector here')),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TabBarItem extends StatelessWidget {
  final String title;
  final bool showBorder;

  const TabBarItem({
    Key? key,
    this.showBorder = false,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: showBorder
            ? Border.symmetric(
                vertical: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              )
            : null,
      ),
      child: Tab(
        child: Text(
          title,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
