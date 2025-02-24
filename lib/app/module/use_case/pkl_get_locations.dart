import '../../data/providers/pkl_provider.dart';
import '../../data/source/pkl_api_service.dart';

class PKLGetLocationsUseCase {
  final PKLProvider _provider;

  PKLGetLocationsUseCase(this._provider);

  Future<List<PKLLocation>> call() async {
    return await _provider.getLocations();
  }
}
