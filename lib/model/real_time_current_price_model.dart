import 'dart:ffi';

class RealTimeCurrentPriceModel {
  final String type; //타입
  final String code; //마켓코드
  final double openingPrice; //시가
  final double highPrice; //고가
  final double lowPrice; //저가
  final double tradePrice; //현재가
  final double preClosingPrice; //전일종가
  final String change; //전일대비
  final double changePrice; //부호 없는 전일 대비 값
  final double signedChangePrice; //전일 대비 값
  final double changeRate; //부호없는 전일 대비 등락율
  final double signedChangeRate; //전일 대비 등락률
  final double tradeVolume; //전일 대비 등락율
  final double accTradeVolume; //누적 거래량
  final double accTradeVolume24h; //24시간 누적 거래량
  final double accTradePrice; //누적 거래대금
  final double accTradePrice24h; //24시간 누적 거래대금
  final String tradeDate; //최근 거래 일자
  final String tradeTime; //최근 거래 시각
  final int tradeTimestamp; //체결 타임스탬프
  final String askBid; //매수/매도 구분
  final double accAskVolume; //누적 매도량
  final double accBidVolume; //누적 매수량
  final double highest52WeekPrice; //52주 최고가
  final String highest52WeekDate; //52주 최고가 달성일
  final double lowest52WeekPrice; //52주 최저가
  final String lowest52WeekDate; //52주 최저가 달성일
  final String tradeStatus; // 거래상태 * deprecated
  final String marketState; //거래상태
  final String marketStateForIos; //거래상태 * deprecated
  final bool isTradingSuspended; //거래 정지 여부
  final String delistingDate; //상장폐지일
  final String marketWarning; //유의 종목 여부
  final int timeStamp; //타임스탬프
  final String streamType; //스트림 타입

  RealTimeCurrentPriceModel({
    required this.type,
    required this.code,
    required this.openingPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.tradePrice,
    required this.preClosingPrice,
    required this.change,
    required this.changePrice,
    required this.signedChangePrice,
    required this.changeRate,
    required this.signedChangeRate,
    required this.tradeVolume,
    required this.accTradeVolume,
    required this.accTradeVolume24h,
    required this.accTradePrice,
    required this.accTradePrice24h,
    required this.tradeDate,
    required this.tradeTime,
    required this.tradeTimestamp,
    required this.askBid,
    required this.accAskVolume,
    required this.accBidVolume,
    required this.highest52WeekPrice,
    required this.highest52WeekDate,
    required this.lowest52WeekPrice,
    required this.lowest52WeekDate,
    required this.tradeStatus,
    required this.marketState,
    required this.marketStateForIos,
    required this.isTradingSuspended,
    required this.delistingDate,
    required this.marketWarning,
    required this.timeStamp,
    required this.streamType
  });

  factory RealTimeCurrentPriceModel.fromJson(Map<String , dynamic> json){
   return RealTimeCurrentPriceModel(
       type: json['type'],
       code: json['code'],
       openingPrice: json['opening_price'],
       highPrice: json['high_price'],
       lowPrice: json['low_price'],
       tradePrice: json['trade_price'],
       preClosingPrice: json['prev_closing_price'],
       change: json['change'],
       changePrice: json['change_price'],
       signedChangePrice: json['signed_change_price'],
       changeRate: json['change_rate'],
       signedChangeRate: json['signed_change_rate'],
       tradeVolume: json['trade_volume'],
       accTradeVolume: json['acc_trade_volume'],
       accTradeVolume24h: json['acc_trade_volume_24h'],
       accTradePrice: json['acc_trade_price'],
       accTradePrice24h: json['acc_trade_price_24h'],
       tradeDate: json['trade_date'],
       tradeTime: json['trade_time'],
       tradeTimestamp: json['trade_timestamp'],
       askBid: json['ask_bid'],
       accAskVolume: json['acc_ask_volume'],
       accBidVolume: json['acc_bid_volume'],
       highest52WeekPrice: json['highest_52_week_price'],
       highest52WeekDate: json['highest_52_week_date'],
       lowest52WeekPrice: json['lowest_52_week_price'],
       lowest52WeekDate: json['lowest_52_week_date'],
       tradeStatus: json['trade_status'] ?? '',
       marketState: json['market_state'],
       marketStateForIos: json['market_state_for_ios'] ?? '',
       isTradingSuspended: json['is_trading_suspended'],
       delistingDate: json['delisting_date'] ?? '',
       marketWarning: json['market_warning'],
       timeStamp: json['timestamp'],
       streamType: json['stream_type']);
  }
}
