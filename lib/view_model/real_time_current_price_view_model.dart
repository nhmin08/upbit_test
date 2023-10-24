import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:test_flutter/single_import.dart';

import 'package:test_flutter/constants/constants.dart' as constants;

class RealTimeCurrentPriceViewModel extends GetxController {
  RxString code = ''.obs;
  RxDouble tradePrice = 0.0.obs;

  // final upBitChannel = IOWebSocketChannel.connect(
  //     constants.upBitRealTime,
  //     headers: {
  //       'Content-type': 'application/json',
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $yourtoken'
  //     }
  // );

  // final upBitChannel = IOWebSocketChannel.connect(
  //   constants.upBitRealTime,
  // );

  final upBitChannel = WebSocketChannel.connect(
    Uri.parse(constants.upBitRealTime),
  );


  getRealTimeData() {
    var uuid = const Uuid();

    // upBitChannel.stream.listen((message) {
    //   debugPrint('listen');
    //   upBitChannel.sink.add(
    //       '[{"ticket": "${uuid.v4()}"}, {"type": "ticker", "codes": ["KRW-BTC", "KRW-ETH"]}, {"format": "DEFAULT"}]');
    //   debugPrint(message);
    // });

    debugPrint('uuid: ${uuid.v4()}');

    upBitChannel.sink.add(
        '[{"ticket": "${uuid.v4()}"},{"type": "ticker", "codes": ["KRW-BTC"]},{"format": "DEFAULT"}]');
  }

  getTradePrice(String data){
    dynamic response = RealTimeCurrentPriceModel.fromJson(jsonDecode(data));

    code.value = response.code; //종목 코드
    tradePrice.value = response.tradePrice; //현재가

    debugPrint(response.tradePrice.toString());
  }
}
