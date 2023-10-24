import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mint_core/mint_bloc.dart';
import 'package:mint_core/mint_core.dart';
import 'package:mint_core/mint_utils.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../l10n/l10n.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    required this.notification,
    super.key,
    this.svgIcon,
    this.padding,
  });

  final NotificationModel notification;
  final SvgGenImage? svgIcon;
  final EdgeInsetsGeometry? padding;

  /// Formats a [DateTime] value into a human-readable string representing the
  /// creation date or time difference from the current time.
  String _getCreatedAtString(BuildContext context, DateTime createdAt) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final difference = now.difference(createdAt);

    if (createdAt.isBefore(today)) {
      return _formatDate(context, today, createdAt);
    } else {
      return _formatTimeDifference(context, difference);
    }
  }

  /// Formats a [date] value into a date string, calculating the difference with
  /// [todayDateOnly].
  ///
  /// Date within a week returned as short-weekday (e.g. 'Mon'), otherwise the
  /// full date is returned (e.g. 1/1/2023).
  String _formatDate(
    BuildContext context,
    DateTime todayDateOnly,
    DateTime date,
  ) {
    final locale = context.l10n.localeName;
    if (todayDateOnly.difference(DateTimeUtils.toDateOnly(date)).inDays < 7) {
      return DateFormat('E, HH:mm', locale).format(date);
    } else {
      return DateFormat.yMd(locale).format(date);
    }
  }

  /// Formats a [difference] representing the time difference between two
  /// [DateTime] values into a human-readable string.
  ///
  /// It formats the time difference as either minutes (e.g., "5m"),
  /// hours (e.g. "2h"), or 'Just now' for very recent differences.
  String _formatTimeDifference(BuildContext context, Duration difference) {
    final minutesDifference = difference.inMinutes;
    if (minutesDifference < 1) {
      return context.l10n.justNow;
    } else if (minutesDifference < 60) {
      return '$minutesDifference${'m'}';
    } else {
      return '${difference.inHours}${'h'}';
    }
  }

  void _onNotificationClick(
    BuildContext context,
    NotificationModel notification,
  ) {
    if (notification.status != AppNotificationStatus.seen) {
      context
          .read<AppNotificationsBloc>()
          .add(AppNotificationsMarkAsReadRequested(notification.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onNotificationClick(context, notification),
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Row(
          children: <Widget>[
            _NotificationCircleAvatar(
              svgIcon: svgIcon,
              photoUrl: notification.photoUrl,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _NotificationMessage(notification: notification),
                  const SizedBox(height: 4),
                  Text(
                    _getCreatedAtString(context, notification.createdAt),
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).hintColor.withOpacity(0.6),
                      letterSpacing: -0.25,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationMessage extends StatelessWidget {
  const _NotificationMessage({required this.notification});

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: _NotificationContent(notification: notification)),
        const SizedBox(width: 8),
        SizedBox(
          width: 16,
          height: 16,
          child: Align(
            child: _NotificationStatusWidget(notification: notification),
          ),
        ),
      ],
    );
  }
}

class _NotificationContent extends StatelessWidget {
  const _NotificationContent({required this.notification});

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    final notification = this.notification;
    return switch (notification) {
      ChatNotification() => _ChatNotification(notification: notification),
      BookingNotification() => _BookingNotification(notification: notification),
    };
  }
}

class _ChatNotification extends StatelessWidget {
  const _ChatNotification({required this.notification});

  final ChatNotification notification;

  String? get fullName =>
      notification.firstName != null && notification.lastName != null
          ? '${notification.firstName} ${notification.lastName}'
          : null;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    const style = TextStyle(fontSize: 14);
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '${fullName ?? l10n.patient} ',
            style: style.copyWith(fontWeight: FontWeight.w500),
          ),
          TextSpan(text: '${l10n.sentA} ', style: style),
          TextSpan(
            text: l10n.message.toLowerCase(),
            style: style.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _BookingNotification extends StatelessWidget {
  const _BookingNotification({required this.notification});

  final BookingNotification notification;

  String _getBookingContent(BuildContext context) {
    final l10n = context.l10n;
    final firstName = notification.firstName;
    final lastName = notification.lastName;
    return firstName != null && lastName != null
        ? '$firstName $lastName'
        : l10n.patient;
  }

  String _getBookingDate(BuildContext context, DateTime date) {
    return DateFormat('MMM d, HH:mm', context.l10n.localeName).format(date);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    const style = TextStyle(fontSize: 14);
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '${_getBookingContent(context)} ',
            style: style.copyWith(fontWeight: FontWeight.w500),
          ),
          TextSpan(text: '${l10n.bookedA.toLowerCase()} ', style: style),
          TextSpan(
            text: '${l10n.bookedConsultation.toLowerCase()} ',
            style: style.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(text: '${l10n.bookedOn.toLowerCase()} ', style: style),
          TextSpan(
            text: _getBookingDate(context, notification.bookTime),
            style: style.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class _NotificationCircleAvatar extends StatelessWidget {
  const _NotificationCircleAvatar({this.svgIcon, this.photoUrl});

  final SvgGenImage? svgIcon;
  final String? photoUrl;

  static const double _tileRadius = 24;

  SvgGenImage get _fallBackIcon => Assets.svg.notificationTileIcon;

  @override
  Widget build(BuildContext context) {
    final photoUrl = this.photoUrl;
    final backgroundColor =
        Theme.of(context).colorScheme.primary.withOpacity(0.5);

    final notificationIcon = (svgIcon ?? _fallBackIcon).svg(
      width: 48,
      height: 48,
      fit: BoxFit.scaleDown,
      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
    );

    return Container(
      width: _tileRadius * 2,
      height: _tileRadius * 2,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: photoUrl != null
          ? Image.network(
              photoUrl,
              errorBuilder: (_, __, ___) => notificationIcon,
              fit: BoxFit.cover,
            )
          : notificationIcon,
    );
  }
}

class _NotificationStatusWidget extends StatelessWidget {
  const _NotificationStatusWidget({required this.notification});

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppNotificationsBloc, AppNotificationsState, bool>(
      selector: (state) => state.loadingMessageId == notification.id,
      builder: (context, isLoading) => isLoading
          ? const CircularProgressIndicator(strokeWidth: 2)
          : notification.status != AppNotificationStatus.seen
              ? Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                )
              : const SizedBox.shrink(),
    );
  }
}
