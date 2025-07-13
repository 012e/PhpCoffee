class Auth0Config {
  static const String domain = "dev-z88j6uoisbogqn82.us.auth0.com";
  static const String clientId = "hFmc9E1kfde00vAqcq9xaYOkLpQ6T21M";
  static const String audience = "phpcoffeebackend";
  static const List<String> scopes = ["openid", "profile", "email"];
  static const int redirectPort = 4000;
  
  static Uri get issuerUri => Uri.https(domain);
  
  static Uri buildLogoutUrl({
    required String idToken,
    String? returnTo,
  }) {
    return Uri.https(domain, '/v2/logout', {
      'client_id': clientId,
      'id_token_hint': idToken,
      if (returnTo != null) 'returnTo': returnTo,
    });
  }
}
