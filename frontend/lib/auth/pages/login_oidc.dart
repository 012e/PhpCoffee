import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

class LoginOidc extends ConsumerStatefulWidget {
  final String code = "Hello world";
  const LoginOidc({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginOidcState();
}

class _LoginOidcState extends ConsumerState<LoginOidc> {
  String code = "hello world";
  @override
  void initState() {
    super.initState();
    code = widget.code;
  }

  Future<String> getAccessToken({
    required String code,
    required String clientId,
    required String callbackUrlScheme,
  }) async {
    final url = Uri.https('dev-z88j6uoisbogqn82.us.auth0.com', '/oauth/token');

    final response = await Dio().post(
      url.toString(),
      data: {
        'client_id': clientId,
        'redirect_uri': '$callbackUrlScheme://callback',
        'grant_type': 'authorization_code',
        'code': code,
      },
    );

    return response.data['access_token'];
  }

  void login() async {
    setState(() {
      code = "loading";
    });
    final clientId = 'hFmc9E1kfde00vAqcq9xaYOkLpQ6T21M';
    final callbackUrlScheme = 'phpcoffeefrontend';
    final url = Uri.https('dev-z88j6uoisbogqn82.us.auth0.com', '/authorize', {
      'response_type': 'code',
      'client_id': clientId,
      'redirect_uri': '$callbackUrlScheme://callback',
      'scope': 'email',
    });
    final result = await FlutterWebAuth2.authenticate(
      url: url.toString(),
      callbackUrlScheme: callbackUrlScheme,
      options: const FlutterWebAuth2Options(
        silentAuth: false,
        windowName: "Login",
      ),
    );
    setState(() {
      code = Uri.parse(result).queryParameters['code'] ?? "invalid state";
    });
    final accessToken = await getAccessToken(
      code: code,
      clientId: clientId,
      callbackUrlScheme: callbackUrlScheme,
    );
    setState(() {
      code = accessToken;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(onPressed: login, child: Text(code)),
    );
  }
}
