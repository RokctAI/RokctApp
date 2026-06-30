import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remixicon/remixicon.dart';
import 'package:comms_sdk/comms_sdk.dart';
import 'package:productivity_sdk/productivity_sdk.dart';
import 'package:auto_route/auto_route.dart';

class GlanceCard extends ConsumerWidget {
  const GlanceCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationState = ref.watch(notificationProvider);
    final taskState = ref.watch(tasksStateProvider);

    if (notificationState.notifications.isEmpty && taskState.tasks.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Glance',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            if (notificationState.notifications.isNotEmpty)
              _GlanceItem(
                icon: Remix.notification_3_line,
                text: notificationState.notifications.first.title ?? 'New Notification',
                onTap: () => context.pushRouteNamed('/notification_page'),
              ),
            if (taskState.tasks.isNotEmpty)
              _GlanceItem(
                icon: Remix.todo_line,
                text: taskState.tasks.first.title ?? 'Upcoming Task',
                onTap: () => context.pushRouteNamed('/tasks_page'),
              ),
          ],
        ),
      ),
    );
  }
}

class _GlanceItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const _GlanceItem({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.white54, size: 16),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(Remix.arrow_right_s_line, color: Colors.white24, size: 14),
          ],
        ),
      ),
    );
  }
}
