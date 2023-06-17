import 'package:flutter/material.dart';

class details_page extends StatefulWidget {
  const details_page({super.key});

  @override
  State<details_page> createState() => _details_pageState();
}

class _details_pageState extends State<details_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .65,
                width: MediaQuery.of(context).size.width * .99,
                color: Colors.amber,
                child: Container(child: Image.asset("assets/img.jpeg", fit: BoxFit.cover)),
              ),
            ],
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .45,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(55),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30 ,left: 30 ,right: 30, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 300,
                              child: Text(
                                "Edge of the worllkjljljlkjlkjkjkjhd",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.fade,
                              ),
                            ),
                            Container(
                                height: 50,
                                width: 90,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    color: Colors.grey.withOpacity(0.3)),
                                child: const Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("50",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(255, 228, 104, 47),)),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("SR",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(255, 228, 104, 47),)),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                       Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Overview" ,
                               style: 
                               TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 228, 104, 47).withOpacity(0.5),
                                ),
                              ),
                              const SizedBox(height: 10,),

                              const Text(
                               "You can also represent the text continuity by fading the text. By default, it shows fading with white color. If the text is a single line it will fade the text from left to right. If it’s multi-line, fading will be shown from bottom to top."
                               ,
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 10,),
                            const Row(
                               children: [
                                 Text("TODAY" , style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                                 Icon(Icons.arrow_drop_down)
                               ],
                             ),
                              Row(
                              children: [

                               Container(
                                height: 25,
                                width: 60,
                                 decoration:  BoxDecoration(
                                borderRadius:  const BorderRadius.all(Radius.circular(5)),
                                color: Colors.grey.withOpacity(0.3),
                                ),
                                child: const Center(child: Text("3:00 pm",style: TextStyle(color: Colors.grey, fontSize: 12
                                )))),

                              const SizedBox(width: 10,),
                               Container(
                                 height: 25,
                                width: 60,
                                 decoration:  BoxDecoration(
                                borderRadius:  const BorderRadius.all(Radius.circular(5)),
                                color: Colors.grey.withOpacity(0.3),
                                ),
                                child: const Center(child:  Text("7:30 pm",style: TextStyle(color: Colors.grey , fontSize: 12
                                )))),

                               const SizedBox(width: 10,),
                               Container(
                                 height: 25,
                                width: 60,
                                 decoration: BoxDecoration(
                                borderRadius:  const BorderRadius.all(Radius.circular(5)),
                                color: Colors.grey.withOpacity(0.3),
                                ),
                                child:  const Center(child: Text("4:30 pm" ,style: TextStyle(color: Colors.grey, fontSize: 12),
                                ))),
                              ],
                             ),
                             const SizedBox(height: 40,),
                             Center(
                               child: Container(
                                height: 70,
                                width: 400,
                                decoration: const BoxDecoration(
                                borderRadius:  BorderRadius.all(Radius.circular(30)),
                                color: Color.fromARGB(255, 228, 104, 47),
                                ),
                                child: const Center(child:
                                 Text(
                                  "Book Now",
                                  style: 
                                  TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  ),
                                ),
                               ),
                             ),
                          ],
                        ), 
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
