import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class BreadCrumb {
  final String uuid;
  bool isActive;
  final String name;

  BreadCrumb({
    required this.isActive,
    required this.name,
  }) : uuid = const Uuid().v4();

  void activate() {
    isActive = true;
  }

  @override
  bool operator ==(covariant BreadCrumb other) => uuid == other.uuid;

  @override
  // TODO: implement hashCode
  int get hashCode => uuid.hashCode;
  String get title => name + (isActive ? ' > ' : '');
}

class breadCrumbProvider extends ChangeNotifier{
  final List<BreadCrumb> _items=[];
  UnmodifiableListView<BreadCrumb> get item => UnmodifiableListView(_items);

  void add(BreadCrumb breadCrumb){
    for (final item in _items){
      item.activate();
    }
    _items.add(breadCrumb);
    notifyListeners();
  }

  void reset(){
    _items.clear();
    notifyListeners();
  }
}

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
    );
  }
}
