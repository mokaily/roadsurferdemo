import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/dependency_injection.dart';
import '../../../../core/notifiers/screen_size_notifier.dart';
import '../../../../core/providers/screen_size_provider.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/max_width_wrapper_widget.dart';
import '../../domain/entities/campsite_params.dart';
import '../providers/state/campsite_state.dart';
import '../widgets/filter_widget.dart';
import '../widgets/loading_widget.dart';
import '../widgets/map/maps_widget.dart';

class CampsiteDetails extends ConsumerStatefulWidget {
  const CampsiteDetails({super.key});

  @override
  ConsumerState<CampsiteDetails> createState() => _CampsiteDetailsState();
}

class _CampsiteDetailsState extends ConsumerState<CampsiteDetails> {
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
    final theme = Themes(baseContext: context);
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
        body: MaxWidthWrapper(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: ListView(
              children: [
                Text("Maps"),
                Maps(),
                const SizedBox(height: 30),
                Text("Name"),
                Text("Address"),
                const SizedBox(height: 30),
                Divider(),
                Text("Features"),
                const SizedBox(height: 10),
                Wrap(
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/fire.png",
                            width: 24,
                            height: 24,
                          ),
                          Text("Feature 1"),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Image.asset(
                          "assets/images/fire.png",
                          width: 24,
                          height: 24,
                        ),
                        Text("Feature 1"),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          "assets/images/fire.png",
                          width: 24,
                          height: 24,
                        ),
                        Text("Feature 1"),
                      ],
                    ),
                    ...["en", "de"].where((langCode) => Constants.languageLabels.containsKey(langCode)).map((langCode) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                          color: theme.setTheme().primaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          Constants.languageLabels[langCode]!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
