import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app2/inspiration/1/generated/l10n.dart';
import 'package:notes_app2/inspiration/1/shared/components/widgets/bloc_observe.dart';
import 'package:notes_app2/inspiration/1/shared/network/local/cache_helper.dart';
import 'package:notes_app2/inspiration/1/shared/styles/language_constant.dart';
import 'package:notes_app2/inspiration/1/shared/styles/mode/cubit.dart';
import 'package:notes_app2/inspiration/1/shared/styles/mode/state.dart';
import 'package:notes_app2/inspiration/1/shared/styles/themes.dart';
import 'package:notes_app2/inspiration/1/views/app_home_view/app_home_view.dart';
import 'package:notes_app2/inspiration/1/views/create_tweet/create_tweet_view.dart';
import 'package:notes_app2/inspiration/1/views/info_on_boarding_view/info_on_boarding.dart';
import 'package:notes_app2/inspiration/1/views/location_view/location_view.dart';
import 'package:notes_app2/inspiration/1/views/on_boarding/presentation/on_boarding_view.dart';
import 'package:notes_app2/inspiration/1/views/splash_view/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getData(key: 'isDark');
  runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatefulWidget {
  final bool? isDark;
  const MyApp({super.key, this.isDark});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  // This widgets is the root of your application.
  Locale? _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ModeCubit()
              ..changeAppMode(
                fromShared: widget.isDark,
              ),
          ),
        ],
        child: BlocConsumer<ModeCubit, ModeStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return ScreenUtilInit(
                designSize: const Size(360, 690),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (context, child) => MaterialApp(
                  locale: _locale,
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  themeMode: ModeCubit.get(context).isDark
                      ? ThemeMode.dark
                      : ThemeMode.light,
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  routes: {
                    SplashView.pageID: (context) => const SplashView(),
                    OnBoardingView.pageID: (context) => const OnBoardingView(),
                    LocationView.pageID: (context) => const LocationView(),
                    InfoOnBoardingView.pageID: (context) =>
                        const InfoOnBoardingView(),
                    AppHomeView.pageID: (context) => const AppHomeView(),
                    CreateTweetView.pageID: (context) =>
                        const CreateTweetView(),
                  },
                  initialRoute: SplashView.pageID,
                  debugShowCheckedModeBanner: false,
                  home: const SplashView(),
                ),
              );
            }));
  }
}
