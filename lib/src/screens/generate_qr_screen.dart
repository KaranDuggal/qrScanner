import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrcodescanner/src/utils/constant.dart';
class GenerateQrScreen extends StatefulWidget {
  const GenerateQrScreen({ Key? key }) : super(key: key);

  @override
  State<GenerateQrScreen> createState() => _GenerateQrScreenState();
}

class _GenerateQrScreenState extends State<GenerateQrScreen> {

  String gQrCode = "";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImage(
              data: gQrCode,
              version: QrVersions.auto,
              size: 200.0,
            ),
            const SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                keyboardType: TextInputType.text,
                onFieldSubmitted: (value) async{
                  gQrCode = value;
                  setState(() {
                    
                  });
                },
                decoration: const InputDecoration(
                  hintText: "Generate QR code",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColors.primary
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColors.primary
                    )
                  )
                ),
                onChanged: (value){
                  gQrCode = value;
                },
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  minimumSize: const Size(200, 50),
                  elevation: 8,
                  shadowColor: MyColors.primary,
                  primary: MyColors.primary),
              onPressed: () async {
                setState(() {
                    
                });
              },
              child: SizedBox(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.create_rounded),
                    Text("Generate QR Code"),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}