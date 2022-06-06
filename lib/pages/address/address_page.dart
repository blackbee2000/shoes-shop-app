import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'address_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressPage extends StatelessWidget {
  final id;
  AddressPage({Key? key, required this.id}) : super(key: key);

  final addressController = Get.put(AddressController());

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
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xffF0F0F0),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
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
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xffF0F0F0),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                controller: addressController.customerAddress,
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
                  hintText: 'address_enter_address'.tr,
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget editAddress(BuildContext context, String name) {
    addressController.customerNameEdit.text = name;
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
                      'address_edit'.tr,
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
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xffF0F0F0),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                controller: addressController.customerNameEdit,
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
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xffF0F0F0),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                controller: addressController.customerAddressEdit,
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
                  hintText: 'address_enter_address'.tr,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => FlutterSwitch(
                    width: 45,
                    height: 25,
                    value: addressController.statusSwitch.value,
                    activeColor: Colors.black,
                    onToggle: (val) {
                      addressController.statusSwitch.value = val;
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'address_set_default_address'.tr,
                  style: GoogleFonts.ebGaramond(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
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
                ],
              ),
            )
          ],
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
            Align(
              alignment: Alignment.center,
              child: Text(
                'address_warning'.tr,
                style: GoogleFonts.ebGaramond(
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
                  GetBuilder<AddressController>(
                    init: addressController,
                    builder: (controller) => Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.deleteAddress(id);
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
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                  onPressed: () {
                    Get.back(id: id);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
                title: Text(
                  'cart_address'.tr,
                  style: GoogleFonts.ebGaramond(
                    color: Colors.black,
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
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
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
                              offset: const Offset(
                                  0, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              padding: const EdgeInsets.all(8),
                              height: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${controller.addressDefault.value.nameReciever != null && controller.addressDefault.value.nameReciever!.isNotEmpty ? controller.addressDefault.value.nameReciever : '--'}',
                                    style: GoogleFonts.ebGaramond(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    '${controller.addressDefault.value.street != null && controller.addressDefault.value.street!.isNotEmpty ? controller.addressDefault.value.street : '--'}'
                                    ', '
                                    '${controller.addressDefault.value.ward != null && controller.addressDefault.value.ward!.isNotEmpty ? controller.addressDefault.value.ward : '--'}'
                                    ', '
                                    '${controller.addressDefault.value.district != null && controller.addressDefault.value.district!.isNotEmpty ? controller.addressDefault.value.district : '--'}',
                                    style: GoogleFonts.ebGaramond(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
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
                                          controller.addressDefault.value
                                              .nameReciever!),
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
                                              .addressDefault.value.id!),
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
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'address_other'.tr,
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
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.listAddress.length,
                          itemBuilder: (context, index) => Container(
                            width: double.infinity,
                            height: 75,
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: const Offset(
                                      0, 4), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  height: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${controller.listAddress[index].nameReciever != null && controller.listAddress[index].nameReciever!.isNotEmpty ? controller.listAddress[index].nameReciever : '--'}',
                                        style: GoogleFonts.ebGaramond(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
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
                                            '${controller.listAddress[index].district != null && controller.listAddress[index].district!.isNotEmpty ? controller.listAddress[index].district : '--'}',
                                        style: GoogleFonts.ebGaramond(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
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
                                              controller.listAddress[index]
                                                  .nameReciever!),
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
                                                  .listAddress[index].id!),
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
                  print(addressController.listAddress.length);
                },
                child: Container(
                  width: 170,
                  height: 45,
                  decoration: const BoxDecoration(
                    color: Colors.black,
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
                          color: Colors.black,
                          border: Border.all(color: Colors.white),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/icons/icon-address-add.png',
                            width: 20,
                            height: 20,
                            fit: BoxFit.contain,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'address_new_add'.tr,
                        style: GoogleFonts.ebGaramond(
                          color: Colors.white,
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
    );
  }
}
