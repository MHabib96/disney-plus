import 'package:disney_plus/utils/services/interfaces/i_json_service.dart';
import 'package:disney_plus/utils/services/json_service.dart';
import 'package:get_it/get_it.dart';

GetIt services = GetIt.instance;

Future<void> configureServices() async {
  services.registerSingleton<IJsonService>(JsonService());
}
