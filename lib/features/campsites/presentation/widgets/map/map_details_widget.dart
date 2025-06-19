import 'package:flutter/material.dart';
import 'package:roadsurferdemo/core/themes/themes.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/campsite_params.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/geocoding_params.dart';
import 'package:roadsurferdemo/l10n/app_localizations.dart';
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
    final theme = Themes(baseContext: context);

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
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.campAddress?.city ?? ''}, ${widget.campAddress?.country ?? ''}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.setTheme().textTheme.displayMedium?.copyWith(
                      fontSize: theme.setTheme().textTheme.displayMedium!.fontSize! - 2,
                      fontWeight: FontWeight.w300,
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      _launchURL(
                        "https://www.google.com/maps/place/${widget.campAddress?.city},+${widget.campAddress?.country}/@${widget.campsite?.latitude},${widget.campsite?.longitude}",
                      );
                    },
                    child: Text(
                      AppLocalizations.of(context)!.m_view_larger_map,
                      style: theme.setTheme().textTheme.labelSmall?.copyWith(
                        color: Colors.blue,
                        fontSize: theme.setTheme().textTheme.labelSmall!.fontSize! - 2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            InkWell(
              onTap: () {
                _launchURL(
                  "https://www.google.com/maps/dir//${widget.campAddress?.city}/@${widget.campsite?.latitude},${widget.campsite?.longitude}",
                );
              },
              child: Tooltip(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade400, width: 0.5),
                ),
                message: AppLocalizations.of(context)!.m_get_directions,
                waitDuration: const Duration(milliseconds: 300),
                textStyle: theme.setTheme().textTheme.labelSmall?.copyWith(
                  fontSize: theme.setTheme().textTheme.labelSmall!.fontSize! - 2,
                  color: theme.setTheme().primaryColorDark,
                  fontWeight: FontWeight.w400,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.directions, color: Colors.blue, size: 25),
                    Text(
                      AppLocalizations.of(context)!.m_directions,
                      style: theme.setTheme().textTheme.labelSmall?.copyWith(
                        color: Colors.blue,
                        fontSize: theme.setTheme().textTheme.labelSmall!.fontSize! - 2,
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
