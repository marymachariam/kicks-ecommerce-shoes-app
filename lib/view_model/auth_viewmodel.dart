import 'package:flutter/material.dart';
import 'package:kicks/services/auth_api.dart';
import 'package:kicks/model/user.dart';

class AuthViewmodel extends ChangeNotifier {
  late final AuthApi _authApi;
  User? user;
  String? errorMessage;
  bool isLoading = false;
  
  AuthViewmodel (AuthApi? authApi){
    _authApi = authApi ?? AuthApi();
  }

  Future<bool> login(String username, String password) async{
    isLoading = true;
    notifyListeners();
    var successful = false;
    try{
      final result = await _authApi.login(username, password);
      user = result.user;
      successful = true;
    }
    on AuthException catch (e) {
      successful = false;
      errorMessage = e.message;
    } catch (e) {
      errorMessage = e.toString();
      successful = false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
    return successful;
  }
}