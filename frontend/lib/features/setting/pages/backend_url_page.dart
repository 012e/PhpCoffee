import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:frontend/shared/services/base_url_service.dart';
import 'package:get_it/get_it.dart';
import 'package:toastification/toastification.dart';

@RoutePage()
class BackendUrlSettingPage extends StatefulWidget {
  const BackendUrlSettingPage({super.key});

  @override
  State<BackendUrlSettingPage> createState() => _BackendUrlSettingPageState();
}

class _BackendUrlSettingPageState extends State<BackendUrlSettingPage> {
  final TextEditingController _urlController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final BaseUrlService _baseUrlService = GetIt.I<BaseUrlService>();

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _urlController.text = _baseUrlService.getBaseUrl();
  }

  void _saveUrl() {
    if (_formKey.currentState!.validate()) {
      final url = _urlController.text;
      _baseUrlService.setBaseUrl(url);
      toastification.show(
        title: Text('URL saved successfully!'),
        description: Text("The new backend URL is: $url"),
        type: ToastificationType.success,
      );
    } else {
      toastification.show(
        title: Text('Error'),
        description: Text("Please enter a valid URL"),
        type: ToastificationType.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter the backend API URL:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              controller: _urlController,
              keyboardType: TextInputType.url,
              decoration: const InputDecoration(
                hintText: 'e.g., https://your-backend.com/api',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a URL';
                }
                if (Uri.tryParse(value) == null) {
                  return 'Please enter a valid URL';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: _saveUrl,
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
