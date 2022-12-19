import 'dart:io';

class PreloadProvider {
  Future<String?> getRedirect() async {
    final client = HttpClient();
    var uri = Uri.parse('https://kueski.shop/cq1al3k.php?key=9ckcsrbnkseenkjkuh04');
    var request = await client.getUrl(uri);
    request.followRedirects = false;
    var response = await request.close();

    return response.headers.value(HttpHeaders.locationHeader);
  }
}
