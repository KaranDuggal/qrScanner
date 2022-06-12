
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrcodescanner/src/utils/constant.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:permission_handler/permission_handler.dart';
class ScanQrCodeScreen extends StatefulWidget {
  const ScanQrCodeScreen({ Key? key }) : super(key: key);

  @override
  State<ScanQrCodeScreen> createState() => _ScanQrCodeScreenState();
}

class _ScanQrCodeScreenState extends State<ScanQrCodeScreen> {
  final qrKey = GlobalKey(debugLabel: "QR");
  QRViewController ? controller;
  Barcode ? barcode;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
  @override
  void reassemble() async {
    super.reassemble();
    if(Platform.isAndroid){
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          buildQrViewer(context),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 20,
            child: Text(barcode != null ? "Result ${barcode!.code}" : "Scan Qr code",style: const TextStyle(color: Colors.white,fontSize: 20),textAlign: TextAlign.center),
          ),
          Positioned(
            top: 10,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: MyColors.secondary
                    ),
                    child: IconButton(
                      onPressed: () async {
                        await controller?.toggleFlash();
                        setState(() {
                          
                        });
                      }, 
                      icon: FutureBuilder<bool?>(
                        future: controller?.getFlashStatus(),
                        builder: (context,snapshot){
                          if(snapshot.data != null){
                            return Icon(snapshot.data! ? Icons.flash_on : Icons.flash_off,color: Colors.white);
                          }else{
                            return Container();
                          }
                        },
                      )
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: MyColors.secondary
                    ),
                    child: IconButton(
                      onPressed: () async {
                        await controller?.flipCamera();
                        setState(() {
                          
                        });
                      }, 
                      icon: FutureBuilder(
                        future: controller?.getCameraInfo(),
                        builder: (context,snapshot){
                          if(snapshot.data != null){
                            return const Icon(Icons.switch_camera,color: Colors.white,);
                          }else{
                            return Container();
                          }
                        },
                      )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildQrViewer(BuildContext context) =>QRView(
    key: qrKey,
    onQRViewCreated: onQRViewCreated,
    overlay: QrScannerOverlayShape(
      cutOutSize: MediaQuery.of(context).size.width * 0.8,
      borderWidth: 10,
      borderRadius: 5,
      borderColor: Colors.white,
      borderLength: 10,
      overlayColor: Colors.white70
    ),
  );
  void onQRViewCreated(QRViewController controller){
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((code) { 
      setState(() {
        barcode = code;
        Clipboard.setData(ClipboardData(text: "${barcode?.code}"));
        
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${barcode?.code}')));
      });
      Fluttertoast.showToast(
          msg: "Text Copy Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: MyColors.primary,
          textColor: Colors.white,
          fontSize: 16.0
      );
    });
  }
}