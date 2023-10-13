import 'dart:async';

import 'package:count_provider1/provider_class/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountSimple extends StatefulWidget {
  const CountSimple({super.key});

  @override
  State<CountSimple> createState() => _CountSimpleState();
}

class _CountSimpleState extends State<CountSimple> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);

    Timer.periodic(Duration(seconds: 1), (timer) {
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print('build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text(
          'Provider Count Example',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<CountProvider>(
        builder: (context, value, child) {
          return Center(
            child: Text(
              value.count.toString(),
              style: TextStyle(fontSize: 30),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
