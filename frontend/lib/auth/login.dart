import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/shared/riverpods/auth_provider.dart';
import 'package:frontend/shared/routes.dart';
import 'package:intl/intl.dart';
import 'package:openid_client/openid_client_io.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late Timer _timer;
  late String _timeString;
  final timeFormat = DateFormat('h:mm a');
  final dateFormat = DateFormat('EEEE, MMMM d');

  @override
  void initState() {
    super.initState();
    _timeString = _formatDateTime(DateTime.now());
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer t) => _getTime(),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return timeFormat.format(dateTime);
  }

  String _formatDate(DateTime dateTime) {
    return dateFormat.format(dateTime);
  }

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
      additionalParameters: {'audience': 'phpcoffeebackend'},
      port: 4000,
      urlLancher: urlLauncher,
    );

    var c = await authenticator.authorize();
    return await c.getTokenResponse();
  }

  Future<void> login(WidgetRef ref, StackRouter router) async {
    {
      final uri = Uri.https("dev-z88j6uoisbogqn82.us.auth0.com");
      final clientId = "hFmc9E1kfde00vAqcq9xaYOkLpQ6T21M";
      final scopes = ["openid", "profile", "email"];
      final tokenResponse = await authenticate(uri, clientId, scopes);
      ref
          .read(authNotifierProvider.notifier)
          .login(
            accessToken: tokenResponse.accessToken,
            idToken: tokenResponse.idToken?.toCompactSerialization(),
          );
      await Future.delayed(const Duration(milliseconds: 500));
      await router.navigatePath("/");
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final accessToken = ref.watch(authNotifierProvider);
    final isAuthenticated = accessToken != null;
    final router = AutoRouter.of(context);

    if (isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        router.navigate(const SettingRoute());
      });
    }

    return Scaffold(
      body: Stack(
        children: [
          // Hero background image with dim overlay
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/login-hero-image.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Dark overlay for dimming
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withValues(alpha: 0.65),
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Time display
                Text(
                  _timeString,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.08,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                // Date display
                Text(
                  _formatDate(DateTime.now()),
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: screenWidth * 0.025,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: screenHeight * 0.08),
                // Login button
                ElevatedButton(
                  onPressed: () async {
                    await login(ref, router);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withValues(alpha: 0.2),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.08,
                      vertical: screenHeight * 0.02,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: screenWidth * 0.018,
                      letterSpacing: 3.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
