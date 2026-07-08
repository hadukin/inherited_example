import 'package:flutter/material.dart';

class DataInheritedWidget extends InheritedWidget {
  final List<String> data;

  const DataInheritedWidget({
    super.key,
    required this.data,
    required super.child,
  });

  static DataInheritedWidget? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DataInheritedWidget>();
  }

  static DataInheritedWidget of(BuildContext context) {
    final DataInheritedWidget? result = maybeOf(context);
    assert(result != null, 'No DataInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(DataInheritedWidget oldWidget) {
    return data != oldWidget.data;
  }
}

