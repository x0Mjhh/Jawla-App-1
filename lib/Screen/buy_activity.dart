import 'package:flutter/material.dart';
import 'package:jawla_app/constants/constants.dart';
import '../components/button.dart';
import '../components/text_field.dart';
import '../constants/app_styles.dart';

class BuyActivity extends StatelessWidget {
  const BuyActivity({
    super.key,
 
  });
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black12,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const Padding(
              padding: EdgeInsets.only(top: 40 , left: 20),
              child: Text(
                "Card Details",
                  style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
            ),
      
            height24,
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.check_box_outline_blank, color: primaryColor,size: 25),
                      Image.asset("assets/visa.jpg" ,width: 80,),
                    ],),
                  Row(
                  children: [
                  const Icon(Icons.check_box_sharp  , color: primaryColor,size: 25),
                  Image.asset("assets/mada.jpg" ,width: 80,),
                ],),
              ],
                    ),
            ),
          height16,
          const CustomTextField(
            maxLines: 1,
            minLines: 1,
            hint: "Card Holder Name",
            // controller: ,
            iconName: Icons.payment,
          ),
      
          const CustomTextField(
            maxLines: 1,
            minLines: 1,
            hint: "Card Number",
            // controller: ,
            iconName: Icons.numbers,
          ),
          
          const Row(
            children: [
              SizedBox(
                width: 250,
                child:  CustomTextField(
                  // maxLines: 1,
                  // minLines: 1,
                  hint: "MM/YY",
                  // controller: ,
                  iconName: Icons.date_range_outlined,
                ),
              ),

              SizedBox(
                width: 160,
                child:  CustomTextField(
                  maxLines: 1,
                  minLines: 1,
                  hint: "CVV",
                  // controller: ,
                  iconName: Icons.payment,
                ),
              ),
           ],
          ),
            height32,
            const Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Text("PAY" , style: TextStyle(fontSize: 20,color: Colors.grey),),
                  width8,
                  Text("18 SR" , style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
      
            height16,
           Center(

             child: CustomButton(
              width: 370,
              height: 60,
              text: "Proceed to Pay",
               onPressed: () {
                 
               },),
           )
        ],
        ),
      ),
    );
  }
}






