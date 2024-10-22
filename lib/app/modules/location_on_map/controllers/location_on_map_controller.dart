import 'dart:async';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationOnMapController extends GetxController {
  final mapController = Completer<GoogleMapController>().obs;

  RxMap<PolylineId, Polyline> polylines = RxMap();
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  final initialCameraPosition =
      const CameraPosition(target: LatLng(37.4, -122.0), zoom: 13.0).obs;
  static const departurePosition = LatLng(37.4, -122.0);
  static const arrivalPosition = LatLng(37.5, -122.0);

  final placeDepature = Marker(
          markerId: const MarkerId("placeDepature"),
          position: departurePosition,
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen))
      .obs;
  final placeArrival = Marker(
          markerId: const MarkerId("placeArrival"),
          position: arrivalPosition,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue))
      .obs;

  @override
  void onInit() {
    drawPolyline();
    super.onInit();
  }

  addPolyLine() {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(polylineId: id, points: polylineCoordinates);
    polylines[id] = polyline;
  }

  drawPolyline() async {
    try {
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey: "AIzaSyDwmSn55zTqkI-ZL3gNDAowq52MtxOOExE",
        request: PolylineRequest(
          origin: PointLatLng(
              departurePosition.latitude, departurePosition.longitude),
          destination:
              PointLatLng(arrivalPosition.latitude, arrivalPosition.longitude),
          mode: TravelMode.driving,
          wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")],
        ),
      );
      if (result.errorMessage != null) {
        print("Error: ${result.errorMessage}");
      }
      print("resultat: $result");
      if (result.points.isNotEmpty) {
        for (var point in result.points) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        }
        addPolyLine();
      } else {
        print("No points found.");
      }
    } catch (e) {
      print("Exceeption: $e");
    }
  }

  chekState(){
    
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
