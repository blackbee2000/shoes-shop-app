import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shoes_shop_app/pages/voucher/voucher_controller.dart';

class VoucherPage extends StatelessWidget {
  final int id;
  VoucherPage({Key? key, required this.id}) : super(key: key);

  final voucherController = Get.put(VoucherController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/background_singin.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.black,
                leading: IconButton(
                  onPressed: () {
                    Get.back(id: id);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  'voucher'.tr,
                  style: GoogleFonts.ebGaramond(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                centerTitle: true,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 20),
                    child: GestureDetector(
                      child: Image.asset(
                        "assets/icons/icon_message.png",
                        width: 20,
                        height: 20,
                        fit: BoxFit.contain,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              body: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: GetBuilder<VoucherController>(
                  init: voucherController,
                  builder: (controller) => RefreshIndicator(
                    child: ListView.builder(
                      itemCount: controller.listVoucher.length,
                      itemBuilder: (context, index) => Container(
                        width: double.infinity,
                        margin: index == 7
                            ? const EdgeInsets.only(
                                left: 20,
                                right: 20,
                                top: 20,
                                bottom: 40,
                              )
                            : const EdgeInsets.only(
                                left: 20,
                                right: 20,
                                top: 20,
                              ),
                        padding: const EdgeInsets.all(20),
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
                          children: [
                            ClipOval(
                              child: Container(
                                width: 60,
                                height: 60,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${controller.listVoucher[index].title != null && controller.listVoucher[index].title!.isNotEmpty ? controller.listVoucher[index].title : 'no_information'.tr}',
                                    style: GoogleFonts.ebGaramond(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Giảm giá: ${controller.listVoucher[index].discount ?? '--'}',
                                    style: GoogleFonts.ebGaramond(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Thời hạn: '
                                    '${controller.listVoucher[index].expiry != null && controller.listVoucher[index].expiry!.isNotEmpty ? DateFormat('HH:mm - dd/MM/yyyy').format(DateTime.parse(controller.listVoucher[index].expiry ?? '').toLocal()) : '--'}',
                                    style: GoogleFonts.ebGaramond(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  controller.selectVoucher(
                                      controller.listVoucher[index], id);
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/icons/icon-right.png',
                                      width: 20,
                                      height: 20,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onRefresh: () async {
                      controller.update();
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
