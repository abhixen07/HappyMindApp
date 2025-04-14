import 'package:get/get.dart';
import 'package:happymindapp/repositories/appointment_repository.dart';

class AppointmentViewModel extends GetxController {
  final AppointmentRepository _repo = AppointmentRepository();

  RxString selectedTime = "11.00 AM".obs;
  RxString selectedDate = "Sun 4".obs;
  RxBool loading = false.obs;

  void setSelectedTime(String time) {
    selectedTime.value = time;
  }

  void setSelectedDate(String date) {
    selectedDate.value = date;
  }

  Future<void> bookAppointment({
    required String doctorName,
    required String date,
    required String slot,
    required String userId,
  }) async {
    loading.value = true;
    final data = {
      "doctorName": doctorName,
      "date": date,
      "slot": slot,
      "userId": userId,
    };
    try {
      final response = await _repo.bookAppointment(data);
      Get.snackbar("Success", "Appointment Booked");
      print(response);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      loading.value = false;
    }
  }
}
