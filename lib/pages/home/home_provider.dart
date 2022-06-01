import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../models/company.dart';
import '../../models/product.dart';
import '../../models/type_product.dart';
import 'home_repository.dart';

class HomeProvider extends ChangeNotifier {
  List<Company> _listCompany = [];
  HomeRepository homeRepo = HomeRepository();

  List<Company> get listCompany {
    return [..._listCompany];
  }

  List<String> getListSize(Product product) {
    List<String> lstSize = [];
    List<TypeProduct> lstTypeProduct = product.type!;
    for (var element in lstTypeProduct) {
      lstSize.add(element.size!);
    }
    return lstSize;
  }

  String? getLogoCompany(String id) {
    final index = _listCompany.indexWhere((element) {
      return element.id == id;
    });
    if (index == -1) {
      return null;
    }
    return _listCompany[index].logoCompany;
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
