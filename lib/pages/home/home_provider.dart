import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../models/company.dart';
import 'home_repository.dart';

class HomeProvider extends ChangeNotifier {
  List<Company> _listCompany = [];
  HomeRepository homeRepo = HomeRepository();

  List<Company> get listCompany {
    return [..._listCompany];
  }

  Future<List<Company>> getAllCompany() async {
    List<Company> _lst = [];
    await homeRepo.getAllCompany(
        option: Options(),
        beforeSend: () {},
        onSuccess: (res) {
          if (res != null) {
            _listCompany = res.data ?? [];
            notifyListeners();
          }
        },
        onError: (e) {
          print("Error get all company");
        });
    _lst = _listCompany;
    return _lst;
  }
}

HomeProvider homeProvider = HomeProvider();
