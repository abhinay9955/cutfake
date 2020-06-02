import 'package:cutfake/AppConstant.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

import 'model/notice.dart';

class Ethereum {
  static var ethClient;
  static var contract;

  static Future<void> initialize() async {
    await AppConstant.initialize();
    ethClient = Web3Client(
        'https://ropsten.infura.io/v3/5bdb59d50c394e3a9927ebf9db007a04',
        Client());
    contract = DeployedContract(
        AppConstant.abi, EthereumAddress.fromHex(AppConstant.contractAddress));
  }

  Ethereum() {}

  Future<int> numberOfNotices() async {
    var credentials =
        await ethClient.credentialsFromPrivateKey(AppConstant.privateKey);
    EthereumAddress address = await credentials.extractAddress();
    var result = await ethClient.call(
        contract: contract, function: contract.function('getNumberofNotice'));
    return result.first;
  }

  Future<bool> checkOrganization() async {
    var credentials =
        await ethClient.credentialsFromPrivateKey(AppConstant.privateKey);
    EthereumAddress address = await credentials.extractAddress();
    var result = await ethClient.call(
        sender: address,
        contract: contract,
        function: contract.function('checkOrganization'),
        params: []);
    print(result);
    return result.first;
  }

  Future<List<Notice>> getNotices() async {
    var credentials =
        await ethClient.credentialsFromPrivateKey(AppConstant.privateKey);
    EthereumAddress address = await credentials.extractAddress();
    var length = await ethClient.call(
        sender: address,
        contract: contract,
        function: contract.function('getNumberofNotice'),
        params: []);
    List<Notice> notices = new List<Notice>();
    print(length);
    for (int i = 0; i < length.first.toInt(); i++) {
      Notice notice = new Notice();
      var temp = await ethClient.call(
          sender: address,
          contract: contract,
          function: contract.function('getNotices'),
          params: [BigInt.from(i).toUnsigned(32)]);
      EthereumAddress org = temp[0] as EthereumAddress;
      notice.title = temp[1] as String;
      notice.message = temp[2] as String;
      var organi = await ethClient.call(
          sender: address,
          contract: contract,
          function: contract.function('getOrganization'),
          params: [org]);
      notice.organization = organi[0] as String;
      notice.logo = organi[1] as String;
      notices.add(notice);
    }
    print(notices.length);
    return notices;
  }
}
