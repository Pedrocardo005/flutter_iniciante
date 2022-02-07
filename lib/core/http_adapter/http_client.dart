abstract class HttpClient {
  Future request(String url,
      {Map<String, dynamic>? data, String method = 'GET'});
}
