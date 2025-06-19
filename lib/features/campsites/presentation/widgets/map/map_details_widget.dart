import 'package:flutter/material.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/campsite_params.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/geocoding_params.dart';
import 'package:url_launcher/url_launcher.dart';

class MapDetailsWidget extends StatefulWidget {
  final CampsiteParams? campsite;
  final GeoCodingParams? campAddress;

  const MapDetailsWidget({super.key, required this.campsite, required this.campAddress});

  @override
  State<MapDetailsWidget> createState() => _MapDetailsWidgetState();
}

class _MapDetailsWidgetState extends State<MapDetailsWidget> {
  Future<void> _launchURL(String uri) async {
    final Uri url = Uri.parse(uri);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
                    Text(
                      "${widget.campAddress?.city}".substring(0, 15),
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize! - 2,
                      ),
                    ),
                    Text(
                      "${widget.campAddress?.city}, ${widget.campAddress?.country}",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontSize: Theme.of(context).textTheme.labelSmall!.fontSize! - 2,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    _launchURL(
                      "https://www.google.com/maps/place/@${widget.campsite?.latitude},${widget.campsite?.longitude}",
                    );
                  },
                  child: Text(
                    "View larger map",
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.blue,
                      fontSize: Theme.of(context).textTheme.labelSmall!.fontSize! - 2,
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                _launchURL(
                  "https://www.google.com/maps/dir/${widget.campsite?.latitude},${widget.campsite?.longitude}",
                );
              },
              child: Tooltip(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade400, width: 0.5),
                ),
                message: "Get directions on this location on\nGoogle Maps.",
                waitDuration: const Duration(milliseconds: 300),
                textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontSize: Theme.of(context).textTheme.labelSmall!.fontSize! - 2,
                ),
                child: Column(
                  children: [
                    const Icon(Icons.directions, color: Colors.blue, size: 25),
                    Text(
                      "Directions",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Colors.blue,
                        fontSize: Theme.of(context).textTheme.labelSmall!.fontSize! - 2,
                      ),
                    ),
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
