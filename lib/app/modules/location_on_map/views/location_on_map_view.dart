import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';

import 'package:tripee/app/modules/location_on_map/views/widgets/infos_driver.dart';
import 'package:tripee/app/modules/location_on_map/views/widgets/options_payment.dart';
import 'package:tripee/app/modules/location_on_map/views/widgets/options_post_publication.dart';
import 'package:tripee/app/modules/publication/views/widgets/search.dart';
import '../controllers/location_on_map_controller.dart';

class LocationOnMapView extends GetView<LocationOnMapController> {
  final String state;
  final String action;
  final String departurePlace;
  final String arrivalPlace;
  final String id;
  final String rideId;
  final String imagePath;
  final String userName;
  final String vehiceNumber;
  final String vehicleBrand;
  final String availablePlaces;
  final String maxPlaces;
  final String email;
  final double latitudeDeparture;
  final double longitudeDeparture;
  final double latitudeArrival;
  final double longitudeArrival;

  const LocationOnMapView({
    super.key,
    this.state = "",
    this.action = "",
    this.departurePlace = "",
    this.arrivalPlace = "",
    this.id = "",
    this.rideId = "",
    this.imagePath = "",
    this.userName = "",
    this.email = "",
    this.latitudeDeparture = 0.0,
    this.longitudeDeparture = 0.0,
    this.latitudeArrival = 0.0,
    this.longitudeArrival = 0.0,
    this.vehiceNumber = "",
    this.vehicleBrand = "",
    this.availablePlaces = "",
    this.maxPlaces = "",
  });
  @override
  Widget build(BuildContext context) {
    Color getStateColor() {
      switch (state) {
        case "En cours":
          return Colors.green;
        case "Accepté":
          return Colors.green;
        case "En attente":
          return Colors.blue;
        case "Terminé":
          return AppColors.tertiaryColor;
        case "Refusé":
          return AppColors.tertiaryColor;
        default:
          return AppColors.primaryColor;
      }
    }

    String getStatetitle() {
      switch (state) {
        case "En cours":
          return "Trajet en cours";
        case "Accepté":
          return "Demande accepté";
        case "En attente":
          return "Trajet en attente";
        case "Refusé":
          return "Demande terminé";
        case "Terminé":
          return "Trajet terminé";
        default:
          return "";
      }
    }

    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        Obx(
          () => GoogleMap(
            mapType: MapType.normal,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            compassEnabled: true,
            initialCameraPosition: CameraPosition(
                target: LatLng(latitudeDeparture, longitudeDeparture),
                zoom: 4.0),
            polylines: Set<Polyline>.from(controller.polylines.values),
            markers: {
              controller.placeDepature.value.copyWith(
                  positionParam: LatLng(latitudeDeparture, longitudeDeparture),
                  iconParam: AssetMapBitmap("assets/icones/depart.png")),
              controller.placeArrival.value.copyWith(
                  positionParam: LatLng(latitudeArrival, longitudeArrival),
                  iconParam: AssetMapBitmap("assets/icones/arrive.png")),
            },
            onMapCreated: (GoogleMapController googleMapController) {
              controller.mapController.value.complete(googleMapController);
            },
          ),
        ),
        Positioned(
          top: 6.0.hp,
          width: 100.0.wp,
          child: SizedBox(
            height: 27.0.hp,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Search(
                  initialValueDepart: departurePlace,
                  initialValueArrive: arrivalPlace,
                  readOnly: true,
                ),
                if (action == "Publication")
                  OptionsPostPublication(
                    state: state,
                    rideId: int.parse(rideId),
                  ),
                if (action != "Publication") const OptionsPayment()
              ],
            ),
          ),
        ),
        Positioned(
            top: 63.0.hp,
            right: 8.0.wp,
            child: InfosDriver(
              id: id,
              rideId: rideId,
              imagePath: imagePath,
              userName: userName,
              vehiceNumber: vehiceNumber,
              vehicleBrand: vehicleBrand,
              email: email,
              availablePlaces: availablePlaces,
              maxPlaces: maxPlaces,
              action: action,
            )),
        Positioned(
          bottom: 0,
          child: Container(
            width: 100.0.wp,
            height: 7.0.hp,
            color: getStateColor(),
            child: Center(
              child: Text(getStatetitle(),
                  style: Apptheme.ligthTheme.textTheme.headlineSmall!
                      .copyWith(color: AppColors.white)),
            ),
          ),
        )
      ]),
    );
  }
}
