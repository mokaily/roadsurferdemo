import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/dependency_injection.dart';
import '../../../../core/notifiers/screen_size_notifier.dart';
import '../../../../core/providers/screen_size_provider.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/max_width_wrapper_widget.dart';
import '../../domain/entities/campsite_params.dart';
import '../providers/state/campsite_state.dart';
import '../widgets/campsites_cards_widget.dart';
import '../widgets/filter_widget.dart';
import '../widgets/header_widget.dart';
import '../widgets/loading_widget.dart';
import '../widgets/search_widget.dart';
import '../widgets/subheader_widget.dart';

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
      if (next is LoadingState) {
        setState(() {
          isLoading = true;
        });
      }
      if (next is SuccessState) {
        setState(() {
          isLoading = false;
          isNoData = next.campsites!.isEmpty;
          campsites = next.campsites!;
        });
      }
    }));

    return Scaffold(
        appBar: const CampsiteAppBarWidget(),
        body: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          scrollBehavior: const ScrollBehavior().copyWith(scrollbars: false),
          slivers: [
            const SliverToBoxAdapter(
              child: HeaderWidget(),
            ),
            SliverFillRemaining(
              child: MaxWidthWrapper(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: Row(
                    children: [
                      if (sizeProvider.isDesktop) const SizedBox(width: 300, child: FiltersScreen()),
                      Expanded(
                        child: CustomScrollView(
                          shrinkWrap: true,
                          slivers: [
                            if (sizeProvider.isDesktop)
                              const SliverToBoxAdapter(
                                child: SubHeaderWidget(),
                              ),
                            SliverPersistentHeader(
                              pinned: true,
                              delegate: _StickySearchFilterBar(),
                            ),
                            if (isLoading) const LoadingWidget(),
                            if (isNoData && !isLoading) const LoadingWidget(),
                            if (!isNoData && !isLoading) CampGridViewWidget(campsite: campsites),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
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
