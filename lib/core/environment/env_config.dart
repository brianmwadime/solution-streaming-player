import 'base_env_config.dart';
import 'production_env_config.dart';

enum Environment { solutionApiV1Environment }

class EnvConfig {
  late BaseEnvConfig config;

  initConfig({Environment? environment}) {
    config = _getConfig(environment ?? null);
  }

  _getConfig([Environment? environment]) {
    switch (environment) {
      case Environment.solutionApiV1Environment:
        return ProductionEnvConfig();
      default:
        return ProductionEnvConfig();
    }
  }
}
