import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../Models/order.dart';
import '../../WebServices/rest_manager.dart';

class MainNotifier with ChangeNotifier {
  final BuildContext _context;
  List<order> orders = [];

  MainNotifier(this._context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _getData();
    });
  }

  Future<void> _getData() async {
    try {
      orders = (await RestManager.getOrders()).listOforders!;
      // for (int i = 0; i < 0; i++) {
      //   orders.add(orders[0]);
      // }
      notifyListeners();
    } catch (error) {
      showDialog(
        context: _context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error!!"),
            content: const Text("Something went wrong!"),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
