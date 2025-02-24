import 'package:get/get.dart';
import '../models/jurnal_pkl_model.dart';

class JurnalPKLProvider extends GetConnect {
  final String baseUrl = 'YOUR_API_BASE_URL';

  Future<Response> getJurnalPKL() => get('$baseUrl/jurnal-pkl');
  
  Future<Response> getJurnalPKLById(int id) => get('$baseUrl/jurnal-pkl/$id');
  
  Future<Response> createJurnalPKL(Map data) => post('$baseUrl/jurnal-pkl', data);
  
  Future<Response> updateJurnalPKL(int id, Map data) => 
      put('$baseUrl/jurnal-pkl/$id', data);
  
  Future<Response> deleteJurnalPKL(int id) => delete('$baseUrl/jurnal-pkl/$id');
  
  Future<Response> uploadDokumentasi(int jurnalId, String filePath) {
    final form = FormData({
      'dokumentasi': MultipartFile(filePath, filename: 'dokumentasi.jpg'),
    });
    return post('$baseUrl/jurnal-pkl/$jurnalId/upload', form);
  }
}
