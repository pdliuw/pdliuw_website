import 'package:url_launcher/url_launcher.dart' as launcher;

///
/// LauncherHelper
class LauncherHelper {
  ///
  /// url
  static void openUrl({
    String url,
  }) async {
    if (await launcher.canLaunch(url)) {
      await launcher.launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
