import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/dependency_injection.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/geocoding_params.dart';
import 'package:roadsurferdemo/features/campsites/presentation/widgets/camp_details/camp_details_features_widget.dart';
import 'package:roadsurferdemo/features/campsites/presentation/widgets/camp_details/camp_details_image_widget.dart';
import 'package:roadsurferdemo/features/campsites/presentation/widgets/camp_details/camp_details_widget.dart';
import '../../../../core/notifiers/screen_size_notifier.dart';
import '../../../../core/providers/screen_size_provider.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/max_width_wrapper_widget.dart';
import '../../domain/entities/campsite_params.dart';
import '../providers/state/campsite_state.dart';
import '../widgets/map/maps_widget.dart';

class CampsiteDetails extends ConsumerStatefulWidget {
  final CampsiteParams? campsite;

  const CampsiteDetails({super.key, required this.campsite});

  @override
  ConsumerState<CampsiteDetails> createState() => _CampsiteDetailsState();
}

class _CampsiteDetailsState extends ConsumerState<CampsiteDetails> {
  GeoCodingParams? campAddress;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      ref.watch(campsiteNotifierProvider);
      ref
          .read(campsiteNotifierProvider.notifier)
          .getCampAddress(lat: widget.campsite?.latitude, long: widget.campsite?.longitude);
    });
    super.initState();
  }

  bool isLoading = false, isNoData = true;

  @override
  Widget build(BuildContext context) {
    ScreenSizeNotifier sizeProvider = ref.watch(screenSizeProvider);
    ref.watch(campsiteNotifierProvider);

    ref.listen(campsiteNotifierProvider.select((value) => value), ((previous, next) async {
      if (next is LoadingState) {
        setState(() {
          isLoading = true;
        });
      }
      if (next is AddressResultState) {
        setState(() {
          isLoading = false;
          campAddress = next.address;
        });
      }
    }));

    return Scaffold(
      appBar: const CampsiteAppBarWidget(),
      body: MaxWidthWrapper(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: sizeProvider.isDesktop ? 50 : 20, vertical: 20),
          child: ListView(
            children: [
              if (!isLoading &&
                  campAddress != null &&
                  widget.campsite?.latitude != null &&
                  widget.campsite?.longitude != null) ...[
                const SizedBox(height: 32),
                Maps(campAddress: campAddress, campsite: widget.campsite),
              ],
              const SizedBox(height: 32),
              CampDetailsWidget(campAddress: campAddress, campsite: widget.campsite),
              const SizedBox(height: 32),
              if (sizeProvider.isDesktop) webView(widget.campsite!),
              if (!sizeProvider.isDesktop) mobileView(widget.campsite!),
            ],
          ),
        ),
      ),
    );
  }
}

Widget webView(campsite) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Expanded(flex: 1, child: CampDetailsFeaturesWidget(campsite: campsite)),
      const SizedBox(width: 32),
      Expanded(flex: 1, child: CampDetailsImageWidget(campsite: campsite)),
    ],
  );
}

Widget mobileView(campsite) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      CampDetailsFeaturesWidget(campsite: campsite),
      const SizedBox(height: 32),
      CampDetailsImageWidget(campsite: campsite),
    ],
  );
}
