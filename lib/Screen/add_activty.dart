import 'dart:io';
import 'package:count_stepper/count_stepper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddActivity extends StatefulWidget {
  const AddActivity({super.key});
  @override
  State<AddActivity> createState() => _AddActivityState();
}

//---------//---------

class _AddActivityState extends State<AddActivity> {
  XFile? image;
  final ImagePicker picker = ImagePicker();


  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
    setState(() {
      image = img;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF6363),
        // leading: Text("aaa"),
        title: const Center(child: Text("Add Activity")),
        toolbarHeight: 100,
      ),




      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children:[
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        
            children: [

              const Text( "Upload activity picture",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ), const SizedBox(height: 10,),


              Container(
                height: 120,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.grey)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.white,
                          maximumSize: Size(400, 100)),
                      onPressed: () {
                        Alert();
                      },
                      child: image != null ? Image.file(
                         File(image!.path),fit: BoxFit.cover,)
                         
                          : const Center(
                              child: Icon(
                              Icons.add,
                              color: Colors.grey,
                              size: 45,
                            )),
                    ),
                  ],
                ),
              ),



//---------------------------------------text fields---------------------------------------

              const SizedBox(height: 15,),
              const Text(
                "Activity Title",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
             const SizedBox(height: 5,),

              const TextField(
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
                ),
              ),
        
              const SizedBox(height: 15,),
              const Text(
                "City",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
             const SizedBox(height: 5,),
              const TextField(
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'City',
                ),
              ),
        
        
              const SizedBox(height: 15,),
              const Text(
                "Location",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
             const SizedBox(height: 5,),
              const TextField(
                keyboardType: TextInputType.url,
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Google Map Link',
                ),
              ),
        

            const SizedBox(height: 15,),
              const Text(
                "Price",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
             const SizedBox(height: 5,),
        
              const SizedBox(
                width: 130,
                height: 40,

                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Price',
                  ),
                ),
              ),
        
        
          const SizedBox(height: 10,),
           const Text(
                "Number of Person",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
             const SizedBox(height: 5,),
        
          CountStepper(
              
              iconColor: Theme.of(context).primaryColor,
              defaultValue: 1,
              max: 500,
              min: 1,
              iconDecrementColor: Colors.red,
              splashRadius: 25,
              onPressed: (value) {
                print("--------$value");
              },
        ),

              SizedBox(height: 20,),

//----------------------------------------------------------------------------------------------------------



//-------------------------------------Next Button-------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color:  const Color(0xFFFF6363)
                    ),
                    child: const Center(
                      child: Text(
                            "Next",
                            style: 
                            TextStyle(
                              color: Colors.white,
                              fontSize:20,
                              
                        ),)),
                       ),
                  ),
                ],
              ),
            ],
          ),
          ]
        ),
      ),
    );
  }







  void Alert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Please choose media to select'),
            content: Container(
              height: 100,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
