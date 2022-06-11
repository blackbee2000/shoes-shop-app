import 'package:url_launcher/url_launcher.dart';

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

Future<void> launchInBrowser(String url) async {
  if (!await launch(
    url,
    forceSafariVC: false,
    forceWebView: false,
    headers: <String, String>{'my_header_key': 'my_header_value'},
  )) {
    throw 'Could not launch $url';
  }
}

Future<void> launchInWebViewOrVC(String url) async {
  if (!await launch(
    url,
    forceSafariVC: true,
    forceWebView: true,
    headers: <String, String>{'my_header_key': 'my_header_value'},
  )) {
    throw 'Could not launch $url';
  }
}

Future<void> launchInWebViewWithJavaScript(String url) async {
  if (!await launch(
    url,
    forceSafariVC: true,
    forceWebView: false,
    enableJavaScript: true,
  )) {
    throw 'Could not launch $url';
  }
}

Future<void> launchInWebViewWithDomStorage(String url) async {
  if (!await launch(
    url,
    forceSafariVC: true,
    forceWebView: true,
    enableDomStorage: true,
  )) {
    throw 'Could not launch $url';
  }
}

Future<void> launchUniversalLinkIos(String url) async {
  final bool nativeAppLaunchSucceeded = await launch(
    url,
    forceSafariVC: false,
    universalLinksOnly: true,
  );
  if (!nativeAppLaunchSucceeded) {
    await launch(
      url,
      forceSafariVC: true,
    );
  }
}

Future<void> launchMailTo(String emailAddress, String subject) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: emailAddress,
    query: encodeQueryParameters(<String, String>{'subject': subject}),
  );

  launch(emailLaunchUri.toString());
}

Future<void> launchCall(String phoneNumber) async {
  // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
  // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
  // such as spaces in the input, which would cause `launch` to fail on some
  // platforms.
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launch(launchUri.toString());
}
