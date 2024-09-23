import 'package:catcher/core/catcher.dart';
import 'package:catcher/handlers/console_handler.dart';
import 'package:catcher/mode/silent_report_mode.dart';
import 'package:catcher/model/catcher_options.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gru_chang_thai/app/app.dart';
import 'package:flutter_gru_chang_thai/app/app_config.dart';
import 'package:flutter_gru_chang_thai/core/get_it.dart';
import 'package:flutter_gru_chang_thai/core/service/translation_service.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TranslationService.loadTranslations();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory : await getApplicationDocumentsDirectory(),
  );

  AppConfig.dev();
  setupGetIt();

  Logger.level = Level.all;

  CatcherOptions catcherOptions = CatcherOptions(
    SilentReportMode(),
    [ConsoleHandler()],
  );

  Catcher(
    rootWidget: Phoenix(
      child: const MainAppLocalization(),
    ),
    debugConfig: catcherOptions,
    releaseConfig: catcherOptions,
    profileConfig: catcherOptions,
  );
}
