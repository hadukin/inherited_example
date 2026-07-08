import 'package:flutter/material.dart';
import 'package:inherited_example/data_Inherited_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Inherited Demo', home: const Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> data = [];
  final controller = TextEditingController();

  void _addData() {
    if (controller.text.isEmpty) return;
    setState(() => data = [...data, controller.text]);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return DataInheritedWidget(
      data: data,
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Row(
                  children: [
                    Expanded(child: TextField(controller: controller)),
                    IconButton(icon: Icon(Icons.send), onPressed: _addData),
                  ],
                ),
                Text('$data'),
                InfoView(),
                ProfileWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('${DataInheritedWidget.maybeOf(context)?.data}');
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('${DataInheritedWidget.maybeOf(context)?.data}');
  }
}
