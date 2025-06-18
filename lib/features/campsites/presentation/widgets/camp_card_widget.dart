import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/campsite_params.dart';
import 'camp_features_widget.dart';
import 'language_chip_widget.dart';
import 'package:roadsurferdemo/core/utils/extensions.dart';

class CampCardWidget extends ConsumerStatefulWidget {
  final CampsiteParams campsite;

  const CampCardWidget({super.key, required this.campsite});

  @override
  ConsumerState<CampCardWidget> createState() => _CampCardWidgetState();
}

class _CampCardWidgetState extends ConsumerState<CampCardWidget> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHover = true),
      onExit: (_) => setState(() => _isHover = false),
      child: GestureDetector(
        onTap: () {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(_isHover ? 0.5 : 0.3),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    image: DecorationImage(
                      image: NetworkImage(widget.campsite.photo),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "€",
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                                text: widget.campsite.pricePerNight.toStringAsFixed(2),
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                            const TextSpan(text: " / night"),
                          ],
                        ),
                      ),
                      Text(
                        widget.campsite.label.capitalize(),
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      const SizedBox(height: 5),
                      if (widget.campsite.address != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            widget.campsite.address!,
                            style:
                                const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
                          ),
                        )
                      else
                        const SizedBox(height: 20),
                      if (widget.campsite.isCloseToWater || widget.campsite.isCampFireAllowed)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(spacing: 10,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (widget.campsite.isCloseToWater)
                                const CampFeaturesWidget(feature: "Close to Water",iconPath: 'assets/water.png'),
                              if (widget.campsite.isCampFireAllowed)
                                const CampFeaturesWidget(feature: "Campfires",iconPath: 'assets/fire.png'),
                            ],
                          ),
                        )
                      else
                        const SizedBox(height: 30),
                      LanguageChipsWidget(hostLanguages: widget.campsite.hostLanguages),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
