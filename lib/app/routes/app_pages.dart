import 'package:get/get.dart';

import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/jurnal_pkl/bindings/jurnal_pkl_binding.dart';
import '../modules/jurnal_pkl/views/jurnal_pkl_view.dart';
import '../modules/jurnal_pkl/views/input_kegiatan_view.dart';
import '../modules/jurnal_pkl/views/riwayat_kegiatan_view.dart';
import '../modules/jurnal_pkl/views/laporan_pkl_view.dart';
import '../modules/learning/bindings/learning_binding.dart';
import '../modules/learning/views/learning_view.dart';
import '../modules/face_recognition/bindings/face_recognition_binding.dart';
import '../modules/face_recognition/face_recognition_screen.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const JURNAL_PKL = _Paths.JURNAL_PKL;
  static const INPUT_KEGIATAN = JURNAL_PKL + _Paths.INPUT_KEGIATAN;
  static const RIWAYAT_KEGIATAN = JURNAL_PKL + _Paths.RIWAYAT_KEGIATAN;
  static const LAPORAN_PKL = JURNAL_PKL + _Paths.LAPORAN_PKL;
  static const LEARNING = _Paths.LEARNING;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const FACE_RECOGNITION = _Paths.FACE_RECOGNITION;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const JURNAL_PKL = '/jurnal-pkl';
  static const INPUT_KEGIATAN = '/input-kegiatan';
  static const RIWAYAT_KEGIATAN = '/riwayat-kegiatan';
  static const LAPORAN_PKL = '/laporan-pkl';
  static const LEARNING = '/learning';
  static const DASHBOARD = '/dashboard';
  static const FACE_RECOGNITION = '/face-recognition';
}

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.JURNAL_PKL,
      page: () => const JurnalPKLView(),
      binding: JurnalPKLBinding(),
      children: [
        GetPage(
          name: _Paths.INPUT_KEGIATAN,
          page: () => const InputKegiatanView(),
        ),
        GetPage(
          name: _Paths.RIWAYAT_KEGIATAN,
          page: () => const RiwayatKegiatanView(),
        ),
        GetPage(name: _Paths.LAPORAN_PKL, page: () => const LaporanPKLView()),
      ],
    ),
    GetPage(
      name: _Paths.LEARNING,
      page: () => const LearningView(),
      binding: LearningBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.FACE_RECOGNITION,
      page: () => const FaceRecognitionScreen(),
      binding: FaceRecognitionBinding(),
    ),
  ];
}
