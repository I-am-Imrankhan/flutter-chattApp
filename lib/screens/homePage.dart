import 'package:flutter/material.dart';
import 'package:my_flutter_chatapp/providers/authenticationProvider.dart';
import 'package:my_flutter_chatapp/providers/counterViewModel.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("MyHomePage is render completely");
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              context.read<AuthenticationProvider>().signOut();
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Count(),
          ],
        ),
      ),
      floatingActionButton: (Row(
        children: [
          FloatingActionButton(
            onPressed: () =>
                context.read<CounterViewModel>().inCrementCounter(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () =>
                context.read<CounterViewModel>().incrementCounterbyTow(),
            tooltip: 'Increment',
            child: Icon(Icons.plumbing),
          ),
          FloatingActionButton(
            onPressed: () => context.read<CounterViewModel>().setToNull(),
            tooltip: 'Increment',
            child: Icon(Icons.exposure_zero),
          ),
        ],
      )),
    );
  }
}

class Count extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      '${context.watch<CounterViewModel>().counter}',
      key: Key('counterState'),
      style: Theme.of(context).textTheme.headline3,
    );
  }
}
