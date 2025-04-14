// appointment_repository.dart

import 'package:happymindapp/data/app_url.dart';

import '../data/network_api_service.dart';

class AppointmentRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> bookAppointment(dynamic data) async {
    try {
      dynamic response = await _apiServices.postApi(appointmentbookingUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
