import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class MapZoomButtonsWidget extends StatelessWidget {
  final double minZoom;
  final double maxZoom;
  final bool mini;
  final double padding;
  final Alignment alignment;
  final Color? zoomInColor;
  final Color? zoomInColorIcon;
  final Color? zoomOutColor;
  final Color? zoomOutColorIcon;
  final IconData zoomInIcon;
  final IconData zoomOutIcon;

  const MapZoomButtonsWidget({
    super.key,
    this.minZoom = 1,
    this.maxZoom = 18,
    this.mini = true,
    this.padding = 2.0,
    this.alignment = Alignment.topRight,
    this.zoomInColor,
    this.zoomInColorIcon,
    this.zoomInIcon = Icons.zoom_in,
    this.zoomOutColor,
    this.zoomOutColorIcon,
    this.zoomOutIcon = Icons.zoom_out,
  });

  @override
  Widget build(BuildContext context) {
    final controller = MapController.of(context);
    final camera = MapCamera.of(context);

    return Align(
      alignment: alignment,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: padding, top: padding, right: padding),
            child: FloatingActionButton(
              isExtended: false,
              mini: mini,
              onPressed: () {
                final zoom = min(camera.zoom + 1, maxZoom);
                controller.move(camera.center, zoom);
              },
              child: Icon(zoomInIcon),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(padding),
            child: FloatingActionButton(
              isExtended: false,
              mini: mini,
              onPressed: () {
                final zoom = max(camera.zoom - 1, minZoom);
                controller.move(camera.center, zoom);
              },
              child: Icon(zoomOutIcon),
            ),
          ),
        ],
      ),
    );
  }
}
