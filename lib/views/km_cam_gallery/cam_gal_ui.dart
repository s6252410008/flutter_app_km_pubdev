import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CamgalUI extends StatefulWidget {
  const CamgalUI({Key? key}) : super(key: key);

  @override
  _CamgalUIState createState() => _CamgalUIState();
}

class _CamgalUIState extends State<CamgalUI> {

  //สร้างตัวแปรเก็บรูปทีไ่ด้จากการเลือก
  File? imageSectedUse;      //อย่าลืม import 'dart:io'; ข้างบนสุด




  //เทธอดเปิดกล้อง
  Future selectImgFromCamera() async{
    final imageSelect = await ImagePicker().pickImage(
      source: ImageSource.camera
    );
  
    // ตรวจสอบว่าได้เลือกรูปหรือไม่
    if (imageSelect == null){
      return;
  }
    // กรณีเลือกรูป ให้กำหนดรูปให้กับตัวแปรที่สร้างไว้ข้างบนเพื่อเอาไปใช้ในจุดอื่นๆ
    final imageSelectPath = File(imageSelect.path);
    setState(() {
      imageSectedUse = imageSelectPath;
    });
  }
  


  //เทธอดเปิด gallery
   selectImgFromGallery() async{
    final imageSelect = await ImagePicker().pickImage(
      source: ImageSource.gallery
    );
     if (imageSelect == null){
      return;
  }
    // กรณีเลือกรูป ให้กำหนดรูปให้กับตัวแปรที่สร้างไว้ข้างบนเพื่อเอาไปใช้ในจุดอื่นๆ
    final imageSelectPath = File(imageSelect.path);
    setState(() {
      imageSectedUse = imageSelectPath;
    });


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          'CamGal KM',
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 60.0,
              ),
              CircleAvatar(
                backgroundColor: Colors.redAccent,
                radius: 100.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    90.0,
                  ),
                  child: 
                  imageSectedUse == null
                  ?
                  Image.asset(
                    'assets/images/logo.png',
                    width: 180.0,
                    height: 180.0,
                    fit: BoxFit.cover,
                  )
                  :
                  Image.file(
                    
                    File(
                      imageSectedUse!.path
                     
                    ), 
                     width: 180.0,
                    height: 180.0,
                    fit: BoxFit.cover,
                  ),

                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      selectImgFromCamera();
                    },
                    icon: Icon(Icons.camera_alt),
                    label: Text(
                      'Camere',
                    ),
                  ),
                  SizedBox(
                    width: 50
                    ,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      selectImgFromGallery();
                    },
                    icon: Icon(Icons.image_search),
                    label: Text(
                      'Gallery',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
