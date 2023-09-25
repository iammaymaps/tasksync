// import 'package:unity_ads_plugin/unity_ads_plugin.dart';

// class AdsMeager {
//   static Future<void> loadUnitiAds() async {
//     UnityAds.load(
//       placementId: 'Interstitial_Android',
//       onComplete: (placementId) => print('Load Complete $placementId'),
//       onFailed: (placementId, error, message) =>
//           print('Load Failed $placementId: $error $message'),
//     );
//   }

//   static Future<void> showInAd() async {
//     UnityAds.showVideoAd(
//       placementId: 'Interstitial_Android',
//       onStart: (placementId) => print('Video Ad $placementId started'),
//       onClick: (placementId) => print('Video Ad $placementId click'),
//       onSkipped: (placementId) => print('Video Ad $placementId skipped'),
//       onComplete: (placementId) => print('Video Ad $placementId completed'),
//       onFailed: (placementId, error, message) =>
//           print('Video Ad $placementId failed: $error $message'),
//     );
//   }

//   static Future<void> showBannerAd() async {
//     UnityBannerAd(
//       placementId: 'Banner_Android',
//       onLoad: (placementId) => print('Banner loaded: $placementId'),
//       onClick: (placementId) => print('Banner clicked: $placementId'),
//       onFailed: (placementId, error, message) =>
//           print('Banner Ad $placementId failed: $error $message'),
//     );
//   }
// }
