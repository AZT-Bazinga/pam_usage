import 'package:pam_flutter/pam.dart';
import 'package:pam_uage/sample_constants.dart';

class PamConfigProvider {
  static PamConfig getConfig() {
    const endpoint = SampleConstants.endpoint;
    const publicDBAlias = SampleConstants.publicDBAlias;
    const loginDBAlias = SampleConstants.loggedInDBAlias;
    const trackingConsentMessageID = SampleConstants.trackingConsentMessageID;
    const debugMode = true;

    return PamConfig(
      endpoint,
      publicDBAlias,
      loginDBAlias,
      trackingConsentMessageID,
      debugMode,
    );
  }
}
