import 'base_env_config.dart';

class ProductionEnvConfig extends BaseEnvConfig {
  @override
  String get url =>
      'https://bc6a-102-140-213-230.ngrok.io'; // 'https://ssolution.azurewebsites.net';
}
