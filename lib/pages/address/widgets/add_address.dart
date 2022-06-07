import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes_shop_app/models/address.dart';

import '../../../models/address_detail.dart';
import '../../profile/profile_controller.dart';
import '../address_controller.dart';

Widget addAddress(BuildContext context) {
  final addressController = Get.put(AddressController());
  final _formKey = GlobalKey<FormState>();
  return Form(
    key: _formKey,
    child: Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
                        style: GoogleFonts.ebGaramond(
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
                'Tên người nhận:',
                style: GoogleFonts.ebGaramond(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xffF0F0F0),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  controller: addressController.customerName,
                  style: GoogleFonts.ebGaramond(
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
                    hintStyle: GoogleFonts.ebGaramond(
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
                'Số điện thoại:',
                style: GoogleFonts.ebGaramond(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xffF0F0F0),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (String? val) {
                    if (val!.length != 10) {
                      return "Vui lòng nhập đúng số điện thoại!";
                    }
                    return null;
                  },
                  controller: addressController.customerPhoneNumber,
                  style: GoogleFonts.ebGaramond(
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
                    hintStyle: GoogleFonts.ebGaramond(
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
                'Tỉnh/Thành phố:',
                textAlign: TextAlign.start,
                style: GoogleFonts.ebGaramond(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xffF0F0F0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Obx(
                    () => DropdownButtonFormField<Province>(
                      value: addressController.customerProvince.value,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 8,
                      decoration: InputDecoration(
                        labelStyle: GoogleFonts.ebGaramond(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onChanged: (Province? newValue) {
                        addressController.customerProvince.value = newValue!;
                        addressController.getDistrict(newValue.id);
                      },
                      items: addressController.lstProvince.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(
                            value.name,
                            style: GoogleFonts.ebGaramond(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  )),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Quận/Huyện:',
                textAlign: TextAlign.start,
                style: GoogleFonts.ebGaramond(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xffF0F0F0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Obx(
                    () => DropdownButtonFormField<District>(
                      value: addressController.customerDistrict.value,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 8,
                      decoration: InputDecoration(
                        labelStyle: GoogleFonts.ebGaramond(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onChanged: (District? newValue) {
                        addressController.customerDistrict.value = newValue!;
                        addressController.getWard(newValue.id);
                      },
                      items: addressController.lstDistrict.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(
                            value.name,
                            style: GoogleFonts.ebGaramond(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  )),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Xã/Phường:',
                textAlign: TextAlign.start,
                style: GoogleFonts.ebGaramond(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xffF0F0F0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Obx(
                    () => DropdownButtonFormField<Ward>(
                      value: addressController.customerWard.value,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 8,
                      decoration: InputDecoration(
                        labelStyle: GoogleFonts.ebGaramond(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onChanged: (Ward? newValue) {
                        addressController.customerWard.value = newValue!;
                        addressController.update();
                      },
                      items: addressController.lstWard.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(
                            value.name,
                            style: GoogleFonts.ebGaramond(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  )),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Số nhà/đường:',
                style: GoogleFonts.ebGaramond(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xffF0F0F0),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  controller: addressController.customerStreet,
                  style: GoogleFonts.ebGaramond(
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
                    hintText: 'Nhập số nhà, số đường',
                    hintStyle: GoogleFonts.ebGaramond(
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
                              style: GoogleFonts.ebGaramond(
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
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          addressController.createAddress(AddressRequest(
                              addressController.customerProvince.value.name,
                              addressController.customerDistrict.value.name,
                              addressController.customerWard.value.name,
                              addressController.customerStreet.text,
                              false,
                              addressController.customerName.text,
                              addressController.customerPhoneNumber.text));
                          // addressController.getAllAddress();
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
                              style: GoogleFonts.ebGaramond(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
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
    ),
  );
}
