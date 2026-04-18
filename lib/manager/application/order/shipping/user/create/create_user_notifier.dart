import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rokctapp/core/domain/handlers/handlers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/infrastructure/services/services.dart';
import 'package:rokctapp/manager/application/order/shipping/user/create/create_user_state.dart';
import 'package:rokctapp/manager/domain/interface/interfaces.dart';
import 'package:rokctapp/manager/infrastructure/models/models.dart';

class CreateUserNotifier extends AutoDisposeNotifier<CreateUserState> {
  final UsersInterface _usersRepository;
  String _email = '';
  String _phone = '';
  String _lastname = '';
  String _firstname = '';

  CreateUserNotifier(this._usersRepository) : super(const CreateUserState());

  void setEmail(String value) {
    _email = value.trim();
  }

  void setPhone(String value) {
    _phone = value.trim();
  }

  void setLastname(String value) {
    _lastname = value.trim();
  }

  void setFirstname(String value) {
    _firstname = value.trim();
  }

  Future<void> createUser(
    BuildContext context, {
    Function(UserData?)? created,
    VoidCallback? failed,
  }) async {
    state = state.copyWith(isLoading: true);
    final response = await _usersRepository.createUser(
      firstname: _firstname,
      lastname: _lastname,
      phone: _phone,
      email: _email,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
        created?.call(data.data);
      },
      f: (error, s) {
        debugPrint('====> create user f $error');
        failed?.call();
        state = state.copyWith(isLoading: false);
        AppHelpers.showCheckTopSnackBar(
          context,
          text: error,
          type: SnackBarType.error,
        );
      },
    );
  }
}
