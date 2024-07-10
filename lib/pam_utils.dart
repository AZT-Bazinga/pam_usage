import 'package:pam_flutter/pam.dart';
import 'package:pam_flutter/response/pam_response.dart';

class PamUtils {
  Future<PamResponse> pamLogIn(String email) async {
    return await Pam.userLogin(email);
  }

  void pamLogOut() {
    Pam.userLogout();
  }

  Future<PamResponse?> trackHomePageView(
    String? uid,
    String? email,
    String? mobileNumber,
    String? timeStamp,
    String eventName,
  ) async {
    final payload = {
      'uid': uid,
      'key': email,
      'mobileNumber': mobileNumber,
      'timeStamp': timeStamp,
    };
    return await Pam.track(eventName, payload: payload);
  }
}
