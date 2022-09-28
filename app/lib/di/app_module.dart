import 'package:app/flavors/flavor_config.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @Named("BaseUrl")
  String get baseUrl => FlavorConfig.instance.values.apiBaseUrl;

  @Named("ApiKey")
  String get apiKey => FlavorConfig.instance.values.secrets.thirdpartyApiKey;
}
