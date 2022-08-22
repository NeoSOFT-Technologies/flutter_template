import '../app.dart';
import '../flavors/flavor.dart';
import '../flavors/flavor_config.dart';
import '../flavors/flavor_values.dart';
import '../secrets/app_secrets.dart';

void main() {
  FlavorConfig.initialize(
    flavor: Flavor.dev,
    values: const FlavorValues(
      apiBaseUrl: "https://api.openweathermap.org/",
      secrets: AppSecrets.appSecretsDev,
      logSqlStatements: true,
      showLogs: true,
      useFakeData: false,
    ),
  );
  startApp();
}
