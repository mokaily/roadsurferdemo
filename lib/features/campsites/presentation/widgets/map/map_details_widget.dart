import 'package:flutter/material.dart';

class MapDetailsWidget extends StatefulWidget {
  const MapDetailsWidget({super.key});

  @override
  State<MapDetailsWidget> createState() => _MapDetailsWidgetState();
}

class _MapDetailsWidgetState extends State<MapDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 300,
      height: 95,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(color: Colors.grey.shade400, width: 0.5),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("fghfgh",
                        // "${contactData.postalCode} ${contactData.cityName}",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize! - 2)),
                    Text("asdasd",
                        // "${contactData.postalCode} ${contactData.cityName}, ${contactData.stateName}\n${contactData.countryName}",
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(fontSize: Theme.of(context).textTheme.labelSmall!.fontSize! - 2)),
                  ],
                ),
                InkWell(
                  onTap: () {
                    // provider.linkLaunchUri(
                    //   // "https://www.google.com/maps/place/@${contactData.lat},${contactData.lng}"
                    // );
                  },
                  child: Text("View larger map",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Colors.blue,
                          fontSize: Theme.of(context).textTheme.labelSmall!.fontSize! - 2)),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                // provider.linkLaunchUri(
                //   // "https://www.google.com/maps/dir//${contactData.cityName}/@${contactData.lat},${contactData.lng}"
                // );
              },
              child: Tooltip(
                decoration: BoxDecoration(
                    color: Colors.white, border: Border.all(color: Colors.grey.shade400, width: 0.5)),
                message: "Get directions on this location on\nGoogle Maps.",
                waitDuration: const Duration(milliseconds: 300),
                textStyle: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(fontSize: Theme.of(context).textTheme.labelSmall!.fontSize! - 2),
                child: Column(
                  children: [
                    Icon(Icons.directions, color: Colors.blue, size: 25),
                    Text("Directions",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Colors.blue,
                            fontSize: Theme.of(context).textTheme.labelSmall!.fontSize! - 2)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
