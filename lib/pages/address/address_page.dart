import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:shoes_shop_app/models/address.dart';
import 'package:shoes_shop_app/models/district.dart';
import 'package:shoes_shop_app/models/province.dart';
import 'package:shoes_shop_app/models/ward.dart';
import 'package:shoes_shop_app/theme/theme_controller.dart';
import 'address_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

class AddressPage extends StatefulWidget {
  final int id;
  const AddressPage({Key? key, required this.id}) : super(key: key);
  @override
  State<StatefulWidget> createState() => AddressState();
}

class AddressState extends State<AddressPage> {
  final addressController = Get.put(AddressController());

  @override
  void initState() {
    BackButtonInterceptor.add(myInterceptor);
    super.initState();
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    Get.back(id: widget.id);
    return true;
  }

  Widget addAddress(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'address_add'.tr,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 30,
                        height: 2,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      addressController.clear();
                      Get.back();
                    },
                    child: const Icon(
                      Icons.close,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'addresss_name'.tr,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xffF0F0F0),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  controller: addressController.customerName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                      bottom: 7,
                      left: 15,
                    ),
                    hintText: 'address_enter_name'.tr,
                    hintStyle: TextStyle(
                      color: const Color(0xffD0D0D0),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'addresss_phone'.tr,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xffF0F0F0),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  controller: addressController.customerPhone,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                      bottom: 7,
                      left: 15,
                    ),
                    hintText: 'address_enter_phone'.tr,
                    hintStyle: TextStyle(
                      color: const Color(0xffD0D0D0),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'addresss_province'.tr,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<AddressController>(
                init: addressController,
                builder: (controller) => Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xffF0F0F0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownSearch<Province>(
                    showClearButton: true,
                    clearButton: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 15,
                    ),
                    dropDownButton: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                      size: 25,
                    ),
                    popupShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    showSearchBox: true,
                    mode: Mode.BOTTOM_SHEET,
                    items: controller.listProvince,
                    // selectedItem: controller.nameCompany.value,
                    popupItemBuilder: (context, item, isSelected) => Container(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        item.name ?? '',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    itemAsString: (item) {
                      return item?.name ?? 'select_province'.tr;
                    },
                    dropdownBuilder: (context, item) {
                      return Text(
                        item?.name ?? 'select_province'.tr,
                        style: TextStyle(
                          color: item == null
                              ? const Color(0xffD0D0D0)
                              : Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    },
                    onSaved: (item) {},
                    onChanged: (item) {
                      if (item != null) {
                        controller.province.value = item.name!;
                        controller.getDistricts(item.code!);
                        controller.update();
                      }
                    },
                    dropdownSearchDecoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 15),
                      isDense: true,
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: const Color(0xffD0D0D0),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'addresss_district'.tr,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<AddressController>(
                init: addressController,
                builder: (controller) => Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xffF0F0F0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownSearch<District>(
                    showClearButton: true,
                    clearButton: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 15,
                    ),
                    dropDownButton: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                      size: 25,
                    ),
                    popupShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    showSearchBox: true,
                    mode: Mode.BOTTOM_SHEET,
                    items: controller.listDistrict,
                    // selectedItem: controller.nameCompany.value,
                    popupItemBuilder: (context, item, isSelected) => Container(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        item.name ?? '',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    itemAsString: (item) {
                      return item?.name ?? 'select_district'.tr;
                    },
                    dropdownBuilder: (context, item) {
                      return Text(
                        item?.name ?? 'select_district'.tr,
                        style: TextStyle(
                          color: item == null
                              ? const Color(0xffD0D0D0)
                              : Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    },
                    onSaved: (item) {},
                    onChanged: (item) {
                      if (item != null) {
                        controller.district.value = item.name!;
                        controller.getWards(item.code!);
                        controller.update();
                      }
                    },
                    dropdownSearchDecoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 15),
                      isDense: true,
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: const Color(0xffD0D0D0),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'address_ward'.tr,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<AddressController>(
                init: addressController,
                builder: (controller) => Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xffF0F0F0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownSearch<Ward>(
                    showClearButton: true,
                    clearButton: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 15,
                    ),
                    dropDownButton: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                      size: 25,
                    ),
                    popupShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    showSearchBox: true,
                    mode: Mode.BOTTOM_SHEET,
                    items: controller.listWard,
                    // selectedItem: controller.nameCompany.value,
                    popupItemBuilder: (context, item, isSelected) => Container(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        item.name ?? '',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    itemAsString: (item) {
                      return item?.name ?? 'select_ward'.tr;
                    },
                    dropdownBuilder: (context, item) {
                      return Text(
                        item?.name ?? 'select_ward'.tr,
                        style: TextStyle(
                          color: item == null
                              ? const Color(0xffD0D0D0)
                              : Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    },
                    onSaved: (item) {},
                    onChanged: (item) {
                      if (item != null) {
                        controller.ward.value = item.name!;
                        controller.update();
                      }
                    },
                    dropdownSearchDecoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 15),
                      isDense: true,
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: const Color(0xffD0D0D0),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'addresss_street'.tr,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xffF0F0F0),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  controller: addressController.customerStreet,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                      bottom: 7,
                      left: 15,
                    ),
                    hintText: 'address_enter_street'.tr,
                    hintStyle: TextStyle(
                      color: const Color(0xffD0D0D0),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          addressController.clear();
                          Get.back();
                        },
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'address_cancel'.tr,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GetBuilder<AddressController>(
                      init: addressController,
                      builder: (controller) => Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (controller.province.value.isEmpty ||
                                controller.district.value.isEmpty ||
                                controller.ward.value.isEmpty ||
                                controller.customerName.text.isEmpty ||
                                controller.customerPhone.text.isEmpty ||
                                controller.customerStreet.text.isEmpty) {
                              Get.snackbar(
                                  'Validate', 'Vui lòng nhập đầy đủ thông tin',
                                  colorText: Colors.black,
                                  backgroundColor: Colors.white);
                              return;
                            }
                            controller.createAddress(
                              controller.province.value,
                              controller.district.value,
                              controller.ward.value,
                              controller.customerStreet.text,
                              controller.customerName.text,
                              controller.customerPhone.text,
                            );
                            addressController.clear();
                            controller.update();
                            Get.back();
                          },
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                            ),
                            child: Center(
                              child: Text(
                                'address_confirm'.tr,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget editAddress(BuildContext context, Address address) {
    addressController.customerName.text = address.nameReciever ?? '';
    addressController.customerPhone.text = address.phoneReciever ?? '';
    addressController.customerStreet.text = address.street ?? '';
    addressController.statusSwitch.value = address.status ?? false;
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        width: double.infinity,
        // height: 300,
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'address_edit'.tr,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 30,
                        height: 2,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.close,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'addresss_name'.tr,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xffF0F0F0),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  controller: addressController.customerName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                      bottom: 7,
                      left: 15,
                    ),
                    hintText: 'address_enter_name'.tr,
                    hintStyle: TextStyle(
                      color: const Color(0xffD0D0D0),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'addresss_phone'.tr,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xffF0F0F0),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  controller: addressController.customerPhone,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                      bottom: 7,
                      left: 15,
                    ),
                    hintText: 'address_enter_phone'.tr,
                    hintStyle: TextStyle(
                      color: const Color(0xffD0D0D0),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'addresss_province'.tr,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<AddressController>(
                init: addressController,
                builder: (controller) => Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xffF0F0F0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownSearch<String>(
                    showClearButton: true,
                    clearButton: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 15,
                    ),
                    dropDownButton: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                      size: 25,
                    ),
                    popupShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    showSearchBox: true,
                    mode: Mode.BOTTOM_SHEET,
                    items: controller.listProvince
                        .map((element) => element.name!)
                        .toList(),
                    selectedItem: address.province ?? '',
                    popupItemBuilder: (context, item, isSelected) => Container(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        item,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    itemAsString: (item) {
                      return item ?? 'select_province'.tr;
                    },
                    dropdownBuilder: (context, item) {
                      return Text(
                        item ?? 'select_province'.tr,
                        style: TextStyle(
                          color: item == null
                              ? const Color(0xffD0D0D0)
                              : Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    },
                    onSaved: (item) {},
                    onChanged: (item) {
                      if (item != null) {
                        controller.province.value = item;
                        for (var e in controller.listProvince) {
                          if (e.name == item) {
                            controller.getDistricts(e.code!);
                          }
                        }
                        controller.update();
                      }
                    },
                    dropdownSearchDecoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 15),
                      isDense: true,
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: const Color(0xffD0D0D0),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'addresss_district'.tr,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<AddressController>(
                init: addressController,
                builder: (controller) => Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xffF0F0F0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownSearch<String>(
                    showClearButton: true,
                    clearButton: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 15,
                    ),
                    dropDownButton: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                      size: 25,
                    ),
                    popupShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    showSearchBox: true,
                    mode: Mode.BOTTOM_SHEET,
                    items: controller.listDistrict.map((e) => e.name!).toList(),
                    selectedItem: address.district ?? '',
                    popupItemBuilder: (context, item, isSelected) => Container(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        item,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    itemAsString: (item) {
                      return item ?? 'select_district'.tr;
                    },
                    dropdownBuilder: (context, item) {
                      return Text(
                        item ?? 'select_district'.tr,
                        style: TextStyle(
                          color: item == null
                              ? const Color(0xffD0D0D0)
                              : Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    },
                    onSaved: (item) {},
                    onChanged: (item) {
                      if (item != null) {
                        controller.district.value = item;
                        for (var e in controller.listDistrict) {
                          if (e.name == item) {
                            controller.getWards(e.code!);
                          }
                        }
                        controller.update();
                      }
                    },
                    dropdownSearchDecoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 15),
                      isDense: true,
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: const Color(0xffD0D0D0),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'address_ward'.tr,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<AddressController>(
                init: addressController,
                builder: (controller) => Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xffF0F0F0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownSearch<String>(
                    showClearButton: true,
                    clearButton: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 15,
                    ),
                    dropDownButton: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                      size: 25,
                    ),
                    popupShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    showSearchBox: true,
                    mode: Mode.BOTTOM_SHEET,
                    items: controller.listWard.map((e) => e.name!).toList(),
                    selectedItem: address.ward ?? '',
                    popupItemBuilder: (context, item, isSelected) => Container(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        item,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    itemAsString: (item) {
                      return item ?? 'select_ward'.tr;
                    },
                    dropdownBuilder: (context, item) {
                      return Text(
                        item ?? 'select_ward'.tr,
                        style: TextStyle(
                          color: item == null
                              ? const Color(0xffD0D0D0)
                              : Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    },
                    onSaved: (item) {},
                    onChanged: (item) {
                      if (item != null) {
                        controller.ward.value = item;
                        controller.update();
                      }
                    },
                    dropdownSearchDecoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 15),
                      isDense: true,
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: const Color(0xffD0D0D0),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'addresss_street'.tr,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xffF0F0F0),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  controller: addressController.customerStreet,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                      bottom: 7,
                      left: 15,
                    ),
                    hintText: 'address_enter_street'.tr,
                    hintStyle: TextStyle(
                      color: const Color(0xffD0D0D0),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GetBuilder<AddressController>(
                init: addressController,
                builder: (controller) => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FlutterSwitch(
                      width: 45,
                      height: 25,
                      value: controller.statusSwitch.value,
                      activeColor: Colors.black,
                      onToggle: (val) {
                        controller.statusSwitch.value = val;
                        controller.updateDefaultAddress(address.id ?? '');
                        controller.update();
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'address_set_default_address'.tr,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'address_cancel'.tr,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GetBuilder<AddressController>(
                      init: addressController,
                      builder: (controller) => Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (controller.province.value.isEmpty ||
                                controller.district.value.isEmpty ||
                                controller.ward.value.isEmpty ||
                                controller.customerName.text.isEmpty ||
                                controller.customerPhone.text.isEmpty ||
                                controller.customerStreet.text.isEmpty) {
                              Get.snackbar(
                                  'Validate', 'Vui lòng nhập đầy đủ thông tin',
                                  colorText: Colors.black,
                                  backgroundColor: Colors.white);
                              return;
                            }
                            controller.updateAddress(
                              address.id ?? '',
                              controller.province.value,
                              controller.district.value,
                              controller.ward.value,
                              controller.customerStreet.text,
                              address.status ?? false,
                              controller.customerName.text,
                              controller.customerPhone.text,
                            );
                            controller.clear();
                            controller.update();
                            Get.back();
                          },
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                            ),
                            child: Center(
                              child: Text(
                                'address_confirm'.tr,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget deleteAddress(BuildContext context, String id) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'address_delete'.tr,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 30,
                      height: 2,
                      color: Colors.black,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.close,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'address_warning'.tr,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'address_cancel'.tr,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GetBuilder<AddressController>(
                    init: addressController,
                    builder: (controller) => Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.deleteAddress(id);
                          controller.update();
                          Get.back();
                        },
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                          ),
                          child: Center(
                            child: Text(
                              'address_confirm'.tr,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) => {
        if (details.primaryVelocity! > 0) {Get.back(id: widget.id)}
      },
      child: SafeArea(
        child: GetBuilder<ThemeController>(
          builder: (theme) => Container(
            width: double.infinity,
            height: double.infinity,
            color: theme.theme == ThemeMode.light ? Colors.white : Colors.black,
            child: Stack(
              children: [
                Scaffold(
                  backgroundColor: theme.theme == ThemeMode.light
                      ? Colors.white
                      : Colors.black,
                  appBar: AppBar(
                    bottom: theme.theme == ThemeMode.dark
                        ? PreferredSize(
                            child: Container(
                              width: double.infinity,
                              color: const Color(0xffF01101),
                              height: 1,
                            ),
                            preferredSize: const Size.fromHeight(0),
                          )
                        : PreferredSize(
                            child: Container(),
                            preferredSize: const Size.fromHeight(0),
                          ),
                    backgroundColor: theme.theme == ThemeMode.light
                        ? Colors.white
                        : Colors.black,
                    leading: IconButton(
                      onPressed: () {
                        Get.back(id: widget.id);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: theme.theme == ThemeMode.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                    title: Text(
                      'cart_address'.tr,
                      style: TextStyle(
                        color: theme.theme == ThemeMode.light
                            ? Colors.black
                            : Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    centerTitle: true,
                  ),
                  body: GetBuilder<AddressController>(
                    init: addressController,
                    builder: (controller) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'address_default'.tr,
                                style: TextStyle(
                                  color: theme.theme == ThemeMode.light
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 30,
                                height: 2,
                                color: theme.theme == ThemeMode.light
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          controller.listAddressDefault.value.id != null
                              ? GestureDetector(
                                  onTap: () {
                                    controller.chooseAddressPayment(
                                        controller.listAddressDefault.value,
                                        widget.id);
                                    controller.update();
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.25),
                                          spreadRadius: 0,
                                          blurRadius: 4,
                                          offset: const Offset(0,
                                              4), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.all(20),
                                            height: double.infinity,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${controller.listAddressDefault.value.nameReciever != null && controller.listAddressDefault.value.nameReciever!.isNotEmpty ? controller.listAddressDefault.value.nameReciever : '--'} - ${controller.listAddressDefault.value.phoneReciever != null && controller.listAddressDefault.value.phoneReciever!.isNotEmpty ? controller.listAddressDefault.value.phoneReciever : '--'}',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                  '${controller.listAddressDefault.value.street != null && controller.listAddressDefault.value.street!.isNotEmpty ? controller.listAddressDefault.value.street : '--'}' +
                                                      ', ' +
                                                      '${controller.listAddressDefault.value.ward != null && controller.listAddressDefault.value.ward!.isNotEmpty ? controller.listAddressDefault.value.ward : '--'}' +
                                                      ', ' +
                                                      '${controller.listAddressDefault.value.district != null && controller.listAddressDefault.value.district!.isNotEmpty ? controller.listAddressDefault.value.district : '--'}' +
                                                      ', ' +
                                                      '${controller.listAddressDefault.value.province != null && controller.listAddressDefault.value.province!.isNotEmpty ? controller.listAddressDefault.value.province : '--'}',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 10,
                                              height: double.infinity,
                                              color: const Color(0xffFFD9D9),
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Get.bottomSheet(
                                                  editAddress(
                                                      context,
                                                      controller
                                                          .listAddressDefault
                                                          .value),
                                                  isScrollControlled: true,
                                                );
                                              },
                                              child: Image.asset(
                                                'assets/icons/icon-edit.png',
                                                width: 20,
                                                height: 20,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Get.bottomSheet(
                                                  deleteAddress(
                                                      context,
                                                      controller
                                                          .listAddressDefault
                                                          .value
                                                          .id!),
                                                  isScrollControlled: true,
                                                );
                                              },
                                              child: Image.asset(
                                                'assets/icons/icon-trash.png',
                                                width: 20,
                                                height: 20,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/icons/icon-box.png',
                                        width: 45,
                                        color: theme.theme == ThemeMode.light
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'no_information'.tr,
                                        style: TextStyle(
                                          color: theme.theme == ThemeMode.light
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          const SizedBox(
                            height: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'address_other'.tr,
                                style: TextStyle(
                                  color: theme.theme == ThemeMode.light
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 30,
                                height: 2,
                                color: theme.theme == ThemeMode.light
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: controller.listAddress.isNotEmpty
                                ? ListView.builder(
                                    itemCount: controller.listAddress.length,
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
                                      onTap: () {
                                        controller.chooseAddressPayment(
                                            controller.listAddress[index],
                                            widget.id);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 120,
                                        margin:
                                            const EdgeInsets.only(bottom: 20),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.25),
                                              spreadRadius: 0,
                                              blurRadius: 4,
                                              offset: const Offset(0,
                                                  4), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(20),
                                                height: double.infinity,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '${controller.listAddress[index].nameReciever != null && controller.listAddress[index].nameReciever!.isNotEmpty ? controller.listAddress[index].nameReciever : '--'} - ${controller.listAddress[index].phoneReciever != null && controller.listAddress[index].phoneReciever!.isNotEmpty ? controller.listAddress[index].phoneReciever : '--'}',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      '${controller.listAddress[index].street != null && controller.listAddress[index].street!.isNotEmpty ? controller.listAddress[index].street : '--'}' +
                                                          ', ' +
                                                          '${controller.listAddress[index].ward != null && controller.listAddress[index].ward!.isNotEmpty ? controller.listAddress[index].ward : '--'}' +
                                                          ', ' +
                                                          '${controller.listAddress[index].district != null && controller.listAddress[index].district!.isNotEmpty ? controller.listAddress[index].district : '--'}' +
                                                          ', ' +
                                                          '${controller.listAddress[index].province != null && controller.listAddress[index].province!.isNotEmpty ? controller.listAddress[index].province : '--'}',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 10,
                                                  height: double.infinity,
                                                  color:
                                                      const Color(0xffFFD9D9),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.bottomSheet(
                                                      editAddress(
                                                          context,
                                                          controller
                                                                  .listAddress[
                                                              index]),
                                                      isScrollControlled: true,
                                                    );
                                                  },
                                                  child: Image.asset(
                                                    'assets/icons/icon-edit.png',
                                                    width: 20,
                                                    height: 20,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.bottomSheet(
                                                      deleteAddress(
                                                          context,
                                                          controller
                                                              .listAddress[
                                                                  index]
                                                              .id!),
                                                      isScrollControlled: true,
                                                    );
                                                  },
                                                  child: Image.asset(
                                                    'assets/icons/icon-trash.png',
                                                    width: 20,
                                                    height: 20,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/icons/icon-box.png',
                                          width: 45,
                                          color: theme.theme == ThemeMode.light
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'no_information'.tr,
                                          style: TextStyle(
                                            color:
                                                theme.theme == ThemeMode.light
                                                    ? Colors.black
                                                    : Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 80,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      Get.bottomSheet(
                        addAddress(context),
                        isScrollControlled: true,
                      );
                    },
                    child: Container(
                      width: 170,
                      height: 45,
                      decoration: BoxDecoration(
                        color: theme.theme == ThemeMode.light
                            ? Colors.black
                            : Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: theme.theme == ThemeMode.light
                                  ? Colors.black
                                  : Colors.white,
                              border: Border.all(
                                  color: theme.theme == ThemeMode.light
                                      ? Colors.white
                                      : Colors.black),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/icons/icon-address-add.png',
                                width: 20,
                                height: 20,
                                fit: BoxFit.contain,
                                color: theme.theme == ThemeMode.light
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'address_new_add'.tr,
                            style: TextStyle(
                              color: theme.theme == ThemeMode.light
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
