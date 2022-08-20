import 'package:flutter/material.dart';

import 'audio_player_screen.dart';
import 'package:firebase_admob/firebase_admob.dart';

//const String testDevice = 'Mobile_id';

const appId = 'ca-app-pub-1170851332113980~9259123054';
const bannerId = 'ca-app-pub-1170851332113980/1815747302';
//const insterstitialId = 'ca-app-pub-XXXXXXXXX/XXXXXXXX';

MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
//  keywords: <String>['flutterio', 'beautiful apps'],
//  contentUrl: 'https://flutter.io',
//  birthday: DateTime.now(),
  childDirected: false,
  designedForFamilies: false,
  gender: MobileAdGender.unknown, // or MobileAdGender.female, MobileAdGender.unknown
  testDevices: <String>[], // Android emulators are considered test devices
);

BannerAd myBanner = BannerAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId: bannerId,
  size: AdSize.smartBanner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {


  @override
  void initState() {
  //  FirebaseAdMob.instance.initialize(appId: appId);
    super.initState();
  }



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    myBanner
    // typically this happens well before the ad is shown
      ..load()
      ..show(
        // Positions the banner ad 60 pixels from the bottom of the screen
       // anchorOffset: 20.0,
        anchorOffset: 0.0,
        // Banner Position
        anchorType: AnchorType.bottom,
      );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AudioPlayerScreen(),
    );
  }
}
