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
  const LocationOnMapView({super.key, this.state = "", this.action = ""});
  @override
  Widget build(BuildContext context) {
    Color getStateColor() {
      switch (state) {
        case "En cours":
          return Colors.green;
        case "En attente":
          return Colors.blue;
        case "Terminé":
          return AppColors.tertiaryColor;
        default:
          return AppColors.primaryColor;
      }
    }

    String getStatetitle() {
      switch (state) {
        case "En cours":
          return "Trajet en cours";
        case "En attente":
          return "Trajet en attente";
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
            initialCameraPosition: controller.initialCameraPosition.value,
            polylines: Set<Polyline>.from(controller.polylines.values),
            markers: {
              controller.placeDepature.value.copyWith(
                  iconParam: AssetMapBitmap("assets/icones/depart.png")),
              controller.placeArrival.value.copyWith(
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
                const Search(),
                if (action == "Publication") const OptionsPostPublication(),
                if (action != "Publication") const OptionsPayment()
              ],
            ),
          ),
        ),
        Positioned(
            top: 63.0.hp,
            right: 8.0.wp,
            child: InfosDriver(
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
