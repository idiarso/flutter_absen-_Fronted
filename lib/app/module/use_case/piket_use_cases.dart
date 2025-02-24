import '../../data/models/piket_model.dart';
import '../../data/providers/piket_provider.dart';

// Schedule Use Cases
class GetPiketScheduleUseCase {
  final PiketProvider _provider;
  GetPiketScheduleUseCase(this._provider);

  Future<List<PiketSchedule>> execute() async {
    return await _provider.getSchedule();
  }
}

class GetMyPiketScheduleUseCase {
  final PiketProvider _provider;
  GetMyPiketScheduleUseCase(this._provider);

  Future<List<PiketSchedule>> execute() async {
    return await _provider.getMySchedule();
  }
}

class CreatePiketScheduleUseCase {
  final PiketProvider _provider;
  CreatePiketScheduleUseCase(this._provider);

  Future<void> execute(PiketSchedule schedule) async {
    await _provider.createSchedule(schedule);
  }
}

class UpdatePiketScheduleUseCase {
  final PiketProvider _provider;
  UpdatePiketScheduleUseCase(this._provider);

  Future<void> execute(int id, PiketSchedule schedule) async {
    await _provider.updateSchedule(id, schedule);
  }
}

class DeletePiketScheduleUseCase {
  final PiketProvider _provider;
  DeletePiketScheduleUseCase(this._provider);

  Future<void> execute(int id) async {
    await _provider.deleteSchedule(id);
  }
}

// Activity Use Cases
class GetPiketActivitiesUseCase {
  final PiketProvider _provider;
  GetPiketActivitiesUseCase(this._provider);

  Future<List<PiketActivity>> execute({
    String? startDate,
    String? endDate,
    String? status,
  }) async {
    return await _provider.getActivities(
      startDate: startDate,
      endDate: endDate,
      status: status,
    );
  }
}

class CreatePiketActivityUseCase {
  final PiketProvider _provider;
  CreatePiketActivityUseCase(this._provider);

  Future<void> execute({
    required String activity,
    required String status,
    List<int>? documentation,
    String? filename,
    String? notes,
  }) async {
    await _provider.createActivity(
      activity: activity,
      status: status,
      documentation: documentation,
      filename: filename,
      notes: notes,
    );
  }
}

class UpdatePiketActivityUseCase {
  final PiketProvider _provider;
  UpdatePiketActivityUseCase(this._provider);

  Future<void> execute(int id, PiketActivity activity) async {
    await _provider.updateActivity(id, activity);
  }
}

class DeletePiketActivityUseCase {
  final PiketProvider _provider;
  DeletePiketActivityUseCase(this._provider);

  Future<void> execute(int id) async {
    await _provider.deleteActivity(id);
  }
}

// Report Use Cases
class GetPiketReportsUseCase {
  final PiketProvider _provider;
  GetPiketReportsUseCase(this._provider);

  Future<List<PiketReport>> execute({
    String? startDate,
    String? endDate,
  }) async {
    return await _provider.getReports(
      startDate: startDate,
      endDate: endDate,
    );
  }
}

class GetPiketReportDetailUseCase {
  final PiketProvider _provider;
  GetPiketReportDetailUseCase(this._provider);

  Future<PiketReport> execute(int id) async {
    return await _provider.getReportDetail(id);
  }
}

class GeneratePiketReportUseCase {
  final PiketProvider _provider;
  GeneratePiketReportUseCase(this._provider);

  Future<PiketReport> execute({
    required String startDate,
    required String endDate,
  }) async {
    return await _provider.generateReport(
      startDate: startDate,
      endDate: endDate,
    );
  }
}
