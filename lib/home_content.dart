import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/home_controller.dart';

class HomeContent extends StatelessWidget {
  HomeContent({Key? key}) : super(key: key);

  BuildContext? dialogContext;

  @override
  Widget build(BuildContext context) {
    return Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: Column(
        // Column is also a layout widget. It takes a list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        // children horizontally, and tries to be as tall as its parent.
        //
        // Invoke "debug painting" (press "p" in the console, choose the
        // "Toggle Debug Paint" action from the Flutter Inspector in Android
        // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
        // to see the wireframe for each widget.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Selector<HomeController, int>(
            builder: (_, count, __) {
              return Text(
                '$count',
                style: Theme.of(context).textTheme.headline4,
              );
            },
            selector: (_, controller) => controller.homeState.count,
          ),
          Selector<HomeController, bool>(
            builder: (ctx, doing, __) {
              if (doing) {
                _showMaterialDialog(ctx);
              } else {
                _hideDialog();
              }

              return SizedBox();
            },
            selector: (_, controller) => controller.homeState.doing,
          ),
          InkWell(
            child: Selector<HomeController, bool>(
              selector: (_, controller) => controller.homeState.isOdd,
              builder: (_, isOdd, __) {
                return Container(
                  color: isOdd ? Colors.yellow : Colors.blue,
                  width: 50,
                  height: 50,
                );
              },
            ),
            onTap: () {
              context.read<HomeController>().colorClicked();
            },
          ),
        ],
      ),
    );
  }

  void _showMaterialDialog(BuildContext context) {
    Future.microtask(
      () {
        showDialog(
          context: context,
          builder: (ctx) {
            dialogContext = ctx;
            return const AlertDialog(
              title: Text('Material Dialog'),
              content: Center(
                child: CircularProgressIndicator(),
              ),
              actions: <Widget>[],
            );
          },
        );
      },
    );
  }

  void _hideDialog() {
    if (dialogContext != null) {
      Navigator.of(dialogContext!).pop();
    }
    dialogContext = null;
  }
}
