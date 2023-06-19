import 'package:flutter/material.dart';




class PreviousPackages extends StatelessWidget {
   const PreviousPackages({super.key ,
    //  required this.activityName ,
    //  required this.activityLocation,
    //  required this.activityDate,
    //  required this.activityImg
     }
     );

      // final  String activityName ;
      // final  String activityImg;
      // final  String activityLocation;
      // final DateTime activityDate;  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black12,
        appBar: AppBar(
          // elevation: 0,
          backgroundColor: Colors.white,
        ),
        body:  Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("My Previous Package" , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),

              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child:   SizedBox(
                  width: 400,
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        const Padding(padding: EdgeInsets.only(top: 15 ,left: 15 ,right: 15, bottom: 15),
                        child: Text("2 November 2023" , style: TextStyle(fontWeight: FontWeight.bold), ),
                        ),
                        Padding(padding: const EdgeInsets.only(left: 25 ,right: 100 ),
                        child: Row(
                          children: [

                            ClipRRect(
                                borderRadius: BorderRadius.circular(5), // Image border
                                child: SizedBox.fromSize(
                                  // size: Size.fromRadius(48), // Image radius
                                  child:  Image.asset(
                                  "assets/img.jpeg",
                                  height: 50,
                                  width: 90, 
                                  fit: BoxFit.fitWidth,
                               ),
                              ),
                            ),
                            const SizedBox(width: 12,),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Text("Horse Riding", style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),),
                                  Row(
                                    children: [
                                      Icon(Icons.location_pin,size: 17 , color: Colors.redAccent,),
                                      SizedBox(width: 1,),
                                      Text("Riyadh"),
                                    ],
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

        ),

    );
  }
}































class OutlinedCardExample extends StatelessWidget {
  const OutlinedCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: const SizedBox(
          width: 300,
          height: 100,
          child: Center(child: Text('Outlined Card')),
        ),
      ),
    );
  }
}










// class PreviousPackages extends StatelessWidget {
//   const PreviousPackages({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Card(
//         child: SizedBox(
//           width: 300,
//           height: 100,
//           child: Center(child: Text('Elevated Card')),
//         ),
//       ),
//     );
//   }
// }


// class FilledCardExample extends StatelessWidget {
//   const FilledCardExample({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Card(
//         elevation: 0,
//         color: Theme.of(context).colorScheme.surfaceVariant,
//         child: const SizedBox(
//           width: 300,
//           height: 100,
//           child: Center(child: Text('Filled Card')),
//         ),
//       ),
//     );
//   }
// }
