import '../../data/providers/pkl_provider.dart';

class PKLGetLocationsUseCase {
  final PKLProvider _provider;

  PKLGetLocationsUseCase(this._provider);

  Future<List<Map<String, dynamic>>> call() async {
    return await _provider.getLocations();
  }
}
