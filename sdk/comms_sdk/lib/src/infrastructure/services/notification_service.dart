import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum NotificationAction {
  showSnackBar,
  navigateToOrderProgress,
  navigateToBlog,
  navigateToCreateOrder,
  none,
}

class NotificationEvent {
  final NotificationAction action;
  final Map<String, dynamic>? data;
  final String? title;
  final String? body;

  NotificationEvent({
    required this.action,
    this.data,
    this.title,
    this.body,
  });
}

class NotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  
  // Stream that the app layer listens to for performing routing/UI actions
  final StreamController<NotificationEvent> _eventController = StreamController<NotificationEvent>.broadcast();
  Stream<NotificationEvent> get events => _eventController.stream;

  Future<void> initialize() async {
    // Request permissions
    await _messaging.requestPermission(
      sound: true,
      alert: true,
      badge: false,
    );

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen(_handleMessage);

    // Handle messages that opened the app
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    final data = message.data;
    final role = LocalStorage.getUser()?.role;
    
    debugPrint("NotificationService: Received message for role $role: ${message.data}");

    // Common logic: news_publish
    if (data['type'] == 'news_publish') {
      _eventController.add(NotificationEvent(
        action: NotificationAction.navigateToBlog,
        data: data,
        title: message.notification?.title,
        body: message.notification?.body,
      ));
      return;
    }

    // Role-specific logic
    if (role == 'deliveryman') {
      if (data['type'] == 'new_order' || data['type'] == 'deliveryman') {
        _eventController.add(NotificationEvent(
          action: NotificationAction.navigateToOrderProgress,
          data: data,
        ));
      }
    } else if (role == 'manager') {
      // Manager logic (e.g. new order alerts)
      _eventController.add(NotificationEvent(
        action: NotificationAction.showSnackBar,
        data: data,
        title: message.notification?.title,
        body: message.notification?.body,
      ));
    } else {
      // Customer logic
      if (data['type'] == 'order_progress' || data['id'] != null) {
        _eventController.add(NotificationEvent(
          action: NotificationAction.navigateToOrderProgress,
          data: data,
        ));
      }
    }
  }

  void dispose() {
    _eventController.close();
  }

  Future<String?> getFcmToken() async {
    return await _messaging.getToken();
  }
}
