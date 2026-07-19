import 'package:flutter/material.dart';

class ShowActiveAlertPage extends StatelessWidget {
  const ShowActiveAlertPage({
    super.key,
    required this.alertId,
    required this.orgId,
    required this.type,
  });

  final String alertId;
  final String orgId;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                type.toUpperCase(),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 8),
              Text('alert: $alertId'),
              Text('org: $orgId'),
              const SizedBox(height: 24),
              Text(
                'F4 fills in the full-screen critical UI and the ack/decline flow.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
