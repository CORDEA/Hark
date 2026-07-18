import 'package:flutter/material.dart';

class ConnectOrgPage extends StatelessWidget {
  const ConnectOrgPage({
    super.key,
    this.prefillServerUrl = '',
    this.prefillCode = '',
  });

  final String prefillServerUrl;
  final String prefillCode;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Connect (stub — filled in F2)')),
    );
  }
}
