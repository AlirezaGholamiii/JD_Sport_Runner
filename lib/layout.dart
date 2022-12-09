import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'Models/order.dart';
import 'main_notifier.dart';
import 'store_config.dart';

class SiteLayout extends StatelessWidget {
  SiteLayout({Key? key}) : super(key: key);

  StoreConfig currecntStore = StoreConfig.getStoreName();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainNotifier>(
        create: (context) => MainNotifier(context),
        builder: (context, child) {
          return Consumer<MainNotifier>(builder: (_, notifier, __) {
            return Scaffold(
                backgroundColor: Colors.black87,
                body: Column(
                  children: [
                    Container(
                      //color: Colors.blue,
                      height: 100,
                      width: MediaQuery.of(context).size.width - 100,
                      margin: const EdgeInsets.fromLTRB(70, 0, 0, 0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            child: const Text(
                              '',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                          Expanded(
                              child: Container(
                            child: const Text(
                              'STATUS',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                          Expanded(
                              child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'TICKET',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                          Expanded(
                              flex: 5,
                              child: Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  'DESCRIPTION',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                          Expanded(
                              child: Container(
                            child: const Text(
                              'SIZE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                          Expanded(
                              child: Container(
                            child: const Text(
                              'COLOUR',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                          Expanded(
                              child: Container(
                            child: const Text(
                              'REQUESTER',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            //color: Colors.amber,
                            height: MediaQuery.of(context).size.height - 150,
                            child: Column(
                              children: const [
                                RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    "PENDING REQUESTS",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 30,
                          child: Container(
                              height: MediaQuery.of(context).size.height - 150,
                              child: _autoscroll(context, notifier)

                              // ListView.separated(
                              //   padding: const EdgeInsets.all(12),

                              //   //get length of Api
                              //   itemCount: notifier.orders.length,
                              //   separatorBuilder:
                              //       (BuildContext context, int index) {
                              //     return const SizedBox(
                              //       height: 12,
                              //     );
                              //   },
                              //   itemBuilder: (context, index) {
                              //     return buildCard(index, notifier);
                              //   },
                              // ),
                              ),
                        ),
                      ],
                    ),
                    Row(children: [
                      Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(currecntStore.website.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          )),
                    ]),
                  ],
                ));
          });
        });
  }

  int Speed(MainNotifier notifier) {
    int orderQuantity = notifier.orders.length;
    int sec = 90;
    if (orderQuantity <= 20) {
      return sec = 60;
    }
    if (orderQuantity <= 50) {
      return sec = 100;
    }
    if (orderQuantity <= 100) {
      return sec = 200;
    }

    return sec;
  }

  Widget _autoscroll(BuildContext context, MainNotifier notifier) {
    List<Widget> widgets = notifier.orders
        .asMap()
        .entries
        .map((e) => buildCard(e.key, notifier))
        .toList();

    return ScrollLoopAutoScroll(
        child: Column(children: widgets),
        scrollDirection: Axis.vertical,
        delay: Duration(seconds: 1),
        duration: Duration(seconds: Speed(notifier)),
        gap: 0,
        reverseScroll: false,
        duplicateChild: 10,
        enableScrollInput: false,
        delayAfterScrollInput: const Duration(seconds: 1));
  }

  List<order> _getRows(MainNotifier notifier) {
    final List<order> rows = [];

    for (final t in notifier.orders) {
      rows.add(order(
          color: t.color,
          description: t.description,
          requester: t.requester,
          runner: t.runner,
          size: t.size,
          status: t.status,
          ticket: t.ticket));
    }
    return rows;
  }

  Widget buildCard(int index, MainNotifier notifier) => ClipRRect(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(120, 159, 215, 255),
          ),
          width: double.infinity,
          height: 80,
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      height: 100,
                      width: 100,
                      child: Image(
                        image: AssetImage(currecntStore.icon.toString()),
                      ))),
              Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(notifier.orders[index].status.toString(),
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)))),
              Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(notifier.orders[index].ticket.toString(),
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)))),
              Expanded(
                  flex: 5,
                  child: Container(
                      child: Text(notifier.orders[index].description.toString(),
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)))),
              Expanded(
                  child: Container(
                      child: Text(notifier.orders[index].size.toString(),
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)))),
              Expanded(
                  child: Container(
                      child: Text(notifier.orders[index].color.toString(),
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)))),
              Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(notifier.orders[index].requester.toString(),
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)))),
            ],
          ),
        ),
      );
}
