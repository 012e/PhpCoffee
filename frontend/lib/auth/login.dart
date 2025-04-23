import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/setting/setting.dart';
import 'package:frontend/shared/riverpods/auth_provider.dart';
import 'package:frontend/shared/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:openid_client/openid_client_io.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  authenticate(Uri uri, String clientId, List<String> scopes) async {
    var issuer = await Issuer.discover(uri);
    var client = Client(issuer, clientId);

    urlLauncher(String url) async {
      var uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $url';
      }
    }

    var authenticator = Authenticator(
      client,
      scopes: scopes,
      port: 4000,
      urlLancher: urlLauncher,
    );

    var c = await authenticator.authorize();
    return await c.getTokenResponse();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accessToken = ref.watch(authNotifierProvider);
    final isAuthenticated = accessToken != null;
    final router = AutoRouter.of(context);

    if (isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        router.navigate(const SettingRoute());
      });
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final uri = Uri.https("dev-z88j6uoisbogqn82.us.auth0.com");
            final clientId = "hFmc9E1kfde00vAqcq9xaYOkLpQ6T21M";
            final scopes = ["openid", "profile", "email"];
            final tokenResponse = await authenticate(uri, clientId, scopes);
            ref
                .read(authNotifierProvider.notifier)
                .login(accessToken: tokenResponse.accessToken);
            await router.navigate(const SettingRoute());
          },
          child: Text(accessToken ?? 'Login'),
        ),
      ),
    );
  }
}
