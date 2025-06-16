import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/notifiers/screen_size_notifier.dart';
import '../../../../core/providers/screen_size_provider.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/max_width_wrapper_widget.dart';
import '../../../../dependency_injection.dart';
import '../../domain/entities/campsite_params.dart';
import '../providers/state/campsite_state.dart';
import '../widgets/campsites_cards_widget.dart';
import '../widgets/filter_widget.dart';
import '../widgets/loading_widget.dart';

class CampsiteViewPage extends ConsumerStatefulWidget {
  const CampsiteViewPage({super.key});

  @override
  ConsumerState<CampsiteViewPage> createState() => _CampsiteViewPageState();
}

class _CampsiteViewPageState extends ConsumerState<CampsiteViewPage> {
  List<CampsiteParams> campsites = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(campsiteNotifierProvider.notifier).getAllCampsitesUseCase();
      ref.read(campsiteNotifierProvider.notifier).loadCampsites();
    });
    super.initState();
  }

  bool isLoading = false, isNoData = true;

  @override
  Widget build(BuildContext context) {
    ScreenSizeNotifier sizeProvider = ref.watch(screenSizeProvider);
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
        body: MaxWidthWrapper(
          child: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            scrollBehavior: const ScrollBehavior().copyWith(scrollbars: false),
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/banner.jpg"),
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      colorFilter: ColorFilter.mode(Colors.black.withValues(alpha: 0.3), BlendMode.darken),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Discover amazing campsites",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Use filters on the left to refine your search.",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
              SliverFillRemaining(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: Row(
                    children: [
                      if (sizeProvider.isDesktop) const SizedBox(width: 300, child: FiltersScreen()),
                      Expanded(
                        child: CustomScrollView(
                          shrinkWrap: true,
                          slivers: [
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Discover amazing campsites",
                                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Use filters on the left to refine your search.",
                                      style: TextStyle(fontSize: 16, color: Colors.grey),
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                ),
                              ),
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
            ],
          ),
        ));
  }
}

class _StickySearchFilterBar extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 60;
  @override
  double get maxExtent => 60;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Campsites", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Search & Filter"),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}
