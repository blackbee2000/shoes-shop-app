import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:shoes_shop_app/pages/payment/payment_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPayment extends StatefulWidget {
  const WebPayment({Key? key}) : super(key: key);

  @override
  State<WebPayment> createState() => _WebPaymentState();
}

class _WebPaymentState extends State<WebPayment> with TickerProviderStateMixin {
  late final AnimationController _controller;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
        builder: (payment) => payment.urlPayment.value != ""
            ? Scaffold(
                body: SafeArea(
                child: WebView(
                    initialUrl: payment.urlPayment.value,
                    javascriptMode: JavascriptMode.unrestricted,
                    onPageFinished: (request) {
                      print(request + "TTTTTTTTTTTTT");
                      if (request.contains(payment.returnURL.value)) {
                        Navigator.of(context).pop();
                        Get.snackbar(
                          'success'.tr,
                          'payment_success'.tr,
                          colorText: Colors.white,
                          backgroundColor: const Color(0xff00FF00),
                        );
                      }
                      if (request.contains(payment.cancelURL.value)) {
                        Get.snackbar(
                          'fail'.tr,
                          'payment_fail'.tr,
                          colorText: Colors.white,
                          backgroundColor: const Color(0xffFF0000),
                        );
                      }
                    }),
              ))
            : Scaffold(
                key: _scaffoldKey,
                appBar: AppBar(
                  leading: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  backgroundColor: Theme.of(context).backgroundColor,
                  elevation: 0.0,
                ),
                body: Center(
                    child: Container(
                        child: CircularProgressIndicator(
                  color: Colors.black,
                ))),
              ));
  }
}
