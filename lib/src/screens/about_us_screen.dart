import 'package:flutter/material.dart';
import 'package:qrcodescanner/src/utils/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String gitHubUrl = "https://github.com/KaranDuggal/qrScanner";
    return Center(
      child: Card(
        elevation: 8,
        shadowColor: MyColors.primary,
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 100,
          height: MediaQuery.of(context).size.width - 180,
          child: Column(
            children: [
              const SizedBox(height: 20,),
              const Text("About Us",style: TextStyle(fontSize: 26),),
              const SizedBox(height: 20,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text("Developer Name" ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      Text("Karan Duggal",style: TextStyle(fontSize: 16),)
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40,),
              ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                minimumSize: const Size(200, 50),
                elevation: 8,
                shadowColor: MyColors.primary,
                primary: MyColors.primary
              ),
              onPressed: ()async {  
                await launchUrl(Uri.parse(gitHubUrl));  
              },
              child:  SizedBox(
                width: 120,
                child: Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.link),
                    Text("Git Hub Link"),
                  ],
                ),
              )
            ),
            ],
          )
        ),
        // shape: BeveledRectangleBorder(
        //     borderRadius: BorderRadius.circular(15)
        // ),
      ),
    );
  }
}