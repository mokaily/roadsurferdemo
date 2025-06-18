import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:roadsurferdemo/features/campsites/presentation/widgets/map/map_zoom_buttons_widget.dart';

import 'map_details_widget.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(51.509364, -0.128928),
          initialZoom: 15,
          interactionOptions: InteractionOptions(
            enableMultiFingerGestureRace: true,
          ),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // For demonstration only
            userAgentPackageName: 'com.example.app', // Add your app identifier
            // And many more recommended properties!
          ),

          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(51.509364, -0.128928),
                width: 80,
                height: 80,
                child: FlutterLogo(),
              ),
            ],
          ),
          //
          MapZoomButtonsWidget(
            mini: false,
            padding: 10,
            alignment: Alignment.bottomRight,
          ),

          MapDetailsWidget(),
        ],
      ),
    );
  }
}

//
//
//
//
// import 'dart:math';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:map/map.dart';
// import 'package:latlng/latlng.dart';
// import 'package:roadsurferdemo/features/campsites/presentation/widgets/map/map_zoom_buttons_widget.dart';
// // import 'package:new_portfolio/config/screen_size.dart';
// // import 'package:new_portfolio/controllers/app_provider.dart';
// // import 'package:new_portfolio/models/portfolio_data/contact_data.dart';
// // import 'package:provider/provider.dart';
// //
// // import 'zoom_in_button.dart';
// // import 'map_zoom_buttons_widget.dart';
//
// class Maps extends StatefulWidget {
//   Maps({super.key});
//
//   @override
//   State<Maps> createState() => _MapsState();
// }
//
// class _MapsState extends State<Maps> {
//   double zoom = 12;
//   late MapController mapController;
//
//   @override
//   initState() {
//     super.initState();
//     mapController = MapController(
//       location: LatLng(Angle.degree(51.1657), Angle.degree(10.4515)), // Centered on Germany
//       zoom: zoom,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 500,
//       child: Stack(
//         alignment: Alignment.bottomRight,
//         children: [
//           Stack(
//             children: [
//               MapLayout(
//                 controller: mapController,
//                 builder: (context, transformer) {
//                   return TileLayer(
//                     builder: (context, x, y, z) {
//                       final tilesInZoom = pow(2.0, z).floor();
//                       while (x < 0) {
//                         x += tilesInZoom;
//                       }
//                       while (y < 0) {
//                         y += tilesInZoom;
//                       }
//                       x %= tilesInZoom;
//                       y %= tilesInZoom;
//
//                       final url =
//                           'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425';
//                       if (kIsWeb) {
//                         return Image.network(url, fit: BoxFit.cover);
//                       } else {
//                         return Image.asset(url, fit: BoxFit.cover);
//                       }
//                     },
//                   );
//                 },
//               ),
//               Container(
//                 margin: const EdgeInsets.all(10),
//                 width: 300,
//                 height: 95,
//                 decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.all(Radius.circular(5)),
//                   border: Border.all(color: Colors.grey.shade400, width: 0.5),
//                   color: Colors.white,
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(7),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("fghfgh",
//                                   // "${contactData.postalCode} ${contactData.cityName}",
//                                   style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                                       fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize! - 2)),
//                               Text("asdasd",
//                                   // "${contactData.postalCode} ${contactData.cityName}, ${contactData.stateName}\n${contactData.countryName}",
//                                   style: Theme.of(context).textTheme.labelSmall?.copyWith(
//                                       fontSize: Theme.of(context).textTheme.labelSmall!.fontSize! - 2)),
//                             ],
//                           ),
//                           InkWell(
//                             onTap: () {
//                               // provider.linkLaunchUri(
//                               //   // "https://www.google.com/maps/place/${contactData.cityName},+${contactData.countryName}/@${contactData.lat},${contactData.lng}"
//                               // );
//                             },
//                             child: Text("View larger map",
//                                 style: Theme.of(context).textTheme.labelSmall?.copyWith(
//                                     color: Colors.blue,
//                                     fontSize: Theme.of(context).textTheme.labelSmall!.fontSize! - 2)),
//                           ),
//                         ],
//                       ),
//                       InkWell(
//                         onTap: () {
//                           // provider.linkLaunchUri(
//                           //   // "https://www.google.com/maps/dir//${contactData.cityName}/@${contactData.lat},${contactData.lng}"
//                           // );
//                         },
//                         child: Tooltip(
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               border: Border.all(color: Colors.grey.shade400, width: 0.5)),
//                           message: "Get directions on this location on\nGoogle Maps.",
//                           waitDuration: const Duration(milliseconds: 300),
//                           textStyle: Theme.of(context)
//                               .textTheme
//                               .labelSmall
//                               ?.copyWith(fontSize: Theme.of(context).textTheme.labelSmall!.fontSize! - 2),
//                           child: Column(
//                             children: [
//                               Icon(Icons.directions, color: Colors.blue, size: 25),
//                               Text("Directions",
//                                   style: Theme.of(context).textTheme.labelSmall?.copyWith(
//                                       color: Colors.blue,
//                                       fontSize: Theme.of(context).textTheme.labelSmall!.fontSize! - 2)),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//
