import 'package:disney_plus/utils/services/interfaces/i_local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService implements ILocalStorageService {
  static const _watchlistKey = 'watchlist_key';

  final SharedPreferences sharedPreferences;

  LocalStorageService({required this.sharedPreferences});

  @override
  List<String> get watchlistIds {
    return sharedPreferences.getStringList(_watchlistKey) ?? <String>[];
  }

  @override
  set watchlistIds(List<String> ids) {
    sharedPreferences.setStringList(_watchlistKey, ids);
  }
}
