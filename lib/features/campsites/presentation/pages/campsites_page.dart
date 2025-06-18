import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/core/notifiers/screen_size_notifier.dart';
import 'package:roadsurferdemo/core/providers/screen_size_provider.dart';
import 'package:roadsurferdemo/core/widgets/app_bar_widget.dart';
import 'package:roadsurferdemo/core/widgets/max_width_wrapper_widget.dart';
import 'package:roadsurferdemo/dependency_injection.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/campsite_params.dart';
import 'package:roadsurferdemo/features/campsites/presentation/providers/state/campsite_state.dart';
import 'package:roadsurferdemo/features/campsites/presentation/widgets/camp_card/campsites_cards_widget.dart';
import 'package:roadsurferdemo/features/campsites/presentation/widgets/filter/filter_widget.dart';
import 'package:roadsurferdemo/features/campsites/presentation/widgets/header_widget.dart';
import 'package:roadsurferdemo/features/campsites/presentation/widgets/loading_widget.dart';
import 'package:roadsurferdemo/features/campsites/presentation/widgets/no_data_widget.dart';
import 'package:roadsurferdemo/features/campsites/presentation/widgets/search_widget.dart';
import 'package:roadsurferdemo/features/campsites/presentation/widgets/subheader_widget.dart';

class CampsitesPage extends ConsumerStatefulWidget {
  const CampsitesPage({super.key});

  @override
  ConsumerState<CampsitesPage> createState() => _CampsitesPageState();
}

class _CampsitesPageState extends ConsumerState<CampsitesPage> {
  List<CampsiteParams> campsites = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.watch(campsiteNotifierProvider);
      ref.read(campsiteNotifierProvider.notifier).getAllCampsitesUseCase();
      ref.read(campsiteNotifierProvider.notifier).loadCampsites();
    });
    super.initState();
  }

  bool isLoading = false, isNoData = true;

  @override
  Widget build(BuildContext context) {
    ScreenSizeNotifier sizeProvider = ref.watch(screenSizeProvider);
    ref.watch(campsiteNotifierProvider);

    ref.listen(campsiteNotifierProvider.select((value) => value), ((previous, next) async {
      if (next is LoadingState || next is SearchLoadingState || next is FilterLoadingState) {
        setState(() {
          isLoading = true;
        });
      }
      if (next is FilterResultState) {
        setState(() {
          isLoading = false;
          isNoData = next.campsites.isEmpty;
          campsites = next.campsites;
        });
      }
      if (next is SearchSuccessState) {
        setState(() {
          isLoading = false;
          isNoData = next.campsites.isEmpty;
          campsites = next.campsites;
        });
      }
      if (next is SuccessState) {
        setState(() {
          isLoading = false;
          isNoData = next.campsites.isEmpty;
          campsites = next.campsites;
        });
      }
      if (next is SuccessState) {
        setState(() {
          isLoading = false;
          isNoData = next.campsites.isEmpty;
          campsites = next.campsites;
        });
      }
    }));

    return Scaffold(
      appBar: const CampsiteAppBarWidget(),
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        scrollBehavior: const ScrollBehavior().copyWith(scrollbars: false),
        slivers: [
          const SliverToBoxAdapter(child: HeaderWidget()),
          SliverFillRemaining(
            child: MaxWidthWrapper(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: sizeProvider.isDesktop ? 50 : 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (sizeProvider.isDesktop) const SizedBox(width: 300, child: FiltersScreen()),
                    Flexible(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: ScrollConfiguration(
                          behavior: const MaterialScrollBehavior().copyWith(
                            dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
                          ),
                          child: CustomScrollView(
                            shrinkWrap: true,
                            slivers: [
                              if (sizeProvider.isDesktop) const SliverToBoxAdapter(child: SubHeaderWidget()),
                              SliverPersistentHeader(pinned: true, delegate: _StickySearchFilterBar()),
                              if (isLoading) const LoadingWidget(),
                              if (!isLoading && isNoData) const NoDataWidget(),
                              if (!isLoading && !isNoData) ...[
                                SliverToBoxAdapter(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                                    child: Text(
                                      '${campsites.length} Campsites found',
                                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                CampGridViewWidget(campsite: campsites),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StickySearchFilterBar extends SliverPersistentHeaderDelegate {
  double widgetHeight = 40;
  @override
  double get minExtent => widgetHeight;
  @override
  double get maxExtent => widgetHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SearchWidget(widgetHeight: widgetHeight);
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}
