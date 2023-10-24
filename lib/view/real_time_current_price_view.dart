import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:test_flutter/single_import.dart';

class RealtimeCurrentPriceView extends StatefulWidget {
  const RealtimeCurrentPriceView({Key? key}) : super(key: key);

  @override
  State<RealtimeCurrentPriceView> createState() =>
      RealTimeCurrentPriceViewState();
}

class RealTimeCurrentPriceViewState extends State<RealtimeCurrentPriceView> {
  RealTimeCurrentPriceViewModel realTimeCurrentPriceViewModel = Get.put(RealTimeCurrentPriceViewModel());

  @override
  void initState() {
    // TODO: implement initState
    //realTimeCurrentPriceViewModel.getRealTimeCurrentPriceData();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    realTimeCurrentPriceViewModel.upBitChannel.sink.close(); //socket close
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('업비트 실시간 현재가'),
      ),
      body: StreamBuilder(
        stream: realTimeCurrentPriceViewModel.upBitChannel.stream,
          builder: (context, snapshot) {
            snapshot.hasData ? null : realTimeCurrentPriceViewModel.getRealTimeData();
            snapshot.hasData ? realTimeCurrentPriceViewModel.getTradePrice(utf8.decode(snapshot.data).toString()) : null;
            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
              child: Row(
                children: [
                  Text(realTimeCurrentPriceViewModel.code.value, style: const TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(width: 20),
                  Text(realTimeCurrentPriceViewModel.tradePrice.value.toString())
                ],
              ),
            );
          },
      ),
    ));
  }
}
