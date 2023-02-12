import 'dart:convert';

import '../../Data/Repository/homepage_repo.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () => funCall(),
            child: const Text('Get Data'),
          ),
        ));
  }

  funCall() async {
    var temp = await HomePageRepo().getData();
    print(temp.dob['year']);
    print(temp.address['city']);
    Object? temp1 = temp.address['code'];
    print(jsonDecode(jsonEncode(temp1))['postcode']);
  }
}
