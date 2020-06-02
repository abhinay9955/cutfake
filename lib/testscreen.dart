import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web3dart/web3dart.dart';
import 'package:hex/hex.dart';

import 'ethereum.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  String privateKey = "", publicKey = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$privateKey"),
            SizedBox(
              height: 20.0,
            ),
            Text("${publicKey}"),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
              child: Text("Create"),
              onPressed: () async {
                try {
                  await Ethereum.initialize();
                  var value = await Ethereum().getNotices();
                  privateKey = value[0].toString();
                } catch (e) {
                  privateKey = e.toString();
                }
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}
