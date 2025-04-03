// import 'package:geolocator/geolocator.dart';
//
// class LocationService {
//   static Future<Position> getCurrentLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.elements("Dịch vụ vị trí không được bật");
//     }
//
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.elements("Quyền truy cập vị trí bị từ chối");
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       return Future.elements("Quyền truy cập vị trí bị từ chối vĩnh viễn");
//     }
//
//     return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//   }
// }
