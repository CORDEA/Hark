import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'package:logger/logger.dart' show Logger;

part 'app_logger.g.dart';

Logger buildAppLogger() => Logger(
      filter: ProductionFilter(),
      level: kReleaseMode ? Level.off : Level.trace,
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        colors: !kReleaseMode,
        printEmojis: false,
      ),
    );

@Riverpod(keepAlive: true)
Logger appLogger(Ref ref) => buildAppLogger();
