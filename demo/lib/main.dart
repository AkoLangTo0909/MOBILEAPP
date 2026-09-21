import 'package:flutter/material.dart';

import '../services.dart';
import '../user/notifications_screen.dart';
import 'theme.dart';

/// Top bar used by every user/admin screen: title, optional subtitle,
/// optional back arrow, optional extra actions and the notification bell.
class ScreenHeader extends StatelessWidget {
  const ScreenHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.onBack,
    this.actions = const [],
  });

  final String title;
  final String? subtitle;
  final VoidCallback? onBack;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.cardBorder)),
      ),
      child: Row(
        children: [
          if (onBack != null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: InkResponse(
                onTap: onBack,
                radius: 22,
                child: const Icon(Icons.arrow_back, size: 22),
              ),
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: onBack != null ? 16 : 18,
                    fontWeight: onBack != null ? FontWeight.w600 : FontWeight.w700,
                  ),
                ),
                if (subtitle != null)
                  Text(subtitle!,
                      style: const TextStyle(
                          fontSize: 11, color: AppColors.muted)),
              ],
            ),
          ),
          ...actions,
          const BellButton(),
        ],
      ),
    );
  }
}

class BellButton extends StatelessWidget {
  const BellButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: appState,
      builder: (context, _) {
        final unread = appState.unreadCount > 0;
        return Padding(
          padding: const EdgeInsets.only(left: 8),
          child: InkResponse(
            radius: 22,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const NotificationsScreen()),
            ),
            child: Container(
              width: 34,
              height: 34,
              decoration: const BoxDecoration(
                  color: AppColors.card, shape: BoxShape.circle),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(Icons.notifications_none_rounded, size: 18),
                  if (unread)
                    Positioned(
                      top: 8,
                      right: 9,
                      child: Container(
                        width: 7,
                        height: 7,
                        decoration: const BoxDecoration(
                            color: AppColors.red, shape: BoxShape.circle),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
