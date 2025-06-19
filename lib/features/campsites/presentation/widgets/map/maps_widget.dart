import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/campsite_params.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/geocoding_params.dart';
import 'package:roadsurferdemo/features/campsites/presentation/widgets/map/map_zoom_buttons_widget.dart';

import 'map_details_widget.dart';

class Maps extends StatefulWidget {
  final CampsiteParams? campsite;
  final GeoCodingParams? campAddress;

  const Maps({super.key, required this.campsite, required this.campAddress});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    LatLng latLng = LatLng(widget.campsite!.latitude, widget.campsite!.longitude);

    return Container(
      height: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: FlutterMap(
        options: MapOptions(
          initialCenter: latLng,
          initialZoom: 12,
          interactionOptions: const InteractionOptions(enableMultiFingerGestureRace: true),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),

          MarkerLayer(
            markers: [Marker(point: latLng, width: 80, height: 80, child: FlutterLogo())],
          ),
          //
          const MapZoomButtonsWidget(mini: false, padding: 10, alignment: Alignment.bottomRight),

          MapDetailsWidget(campAddress: widget.campAddress, campsite: widget.campsite),
        ],
      ),
    );
  }
}
