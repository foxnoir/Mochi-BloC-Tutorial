import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mochi/core/di/di.dart';
import 'package:mochi/core/utils/logger.dart';

// test
Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await _loadApp();
  }, (Object error, StackTrace stack) {
    logger.f('zone error $error', error, stack);
  });
}

Future<void> _loadApp() async {
  await DI.getIt.reset();
  configureInjection(Environment.dev);

  try {
    runApp(Mochi());
  } catch (ex, st) {
    logger.e('startup exception', ex, st);
  }
}

class Mochi extends StatelessWidget with WidgetsBindingObserver {
  // <instance> is the single instance that is being create with the _internal named constructor
  // the factory method returns this single instance
  const Mochi._internal();

  static const Mochi instance = Mochi._internal();

  factory Mochi() => instance;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addObserver(this);

    return MaterialApp.router(
        // debugShowCheckedModeBanner: false,
        // routeInformationParser: appRouter.routeInformationParser,
        // routeInformationProvider: appRouter.routeInformationProvider,
        // routerDelegate: appRouter.routerDelegate,
        // localizationsDelegates: const [
        //   ...AppLocalizations.localizationsDelegates,
        //   PhoneFieldLocalization.delegate
        // ],
        // supportedLocales: AppLocalizations.supportedLocales,
        // locale: DI.getIt<SettingsRepository>().locale,
        // theme: getLightTheme(),
        );
  }
}
