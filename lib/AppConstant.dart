import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart' show join, dirname;
import 'package:web3dart/web3dart.dart';

class AppConstant {
  static ContractAbi abi;

  static String contractAddress = "0x4fe0756b5f6ad8506972b6feff8f7110d3a8b660";

  static String chairperson =
      "6c9a631eb7d7562ea79ef5f76523310850c031827bed693a5e563e3a6d91bce5";
  static String privateKey =
      "dbad4daa68dd370ca80da28856fdd3ac4a06b08185ba815e5e37286866c2ea55";

  static Future<void> initialize() async {
    String abicode = await rootBundle.loadString("assets/abi.json");
    // var abicode = abiFile.readAsStringSync();
    abi = ContractAbi.fromJson(abicode, 'Bulletin');
  }
}
