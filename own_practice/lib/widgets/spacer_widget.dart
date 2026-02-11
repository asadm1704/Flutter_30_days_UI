import 'package:flutter/material.dart';

class Spacer_widget extends StatelessWidget {
  const Spacer_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('spacer widget'),
      ),
      body: 
         Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(10),
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.pink.shade200,
            gradient: LinearGradient(
              //begin: Alignment.topRight,
         //     end: Alignment.bottomRight,              
              colors: [Colors.yellow.shade400,  Colors.red.shade400, Colors.purple.shade400],
            ),
            border: Border.all(color: Colors.black, width:2),
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 4,
                offset: Offset(2, 4)

              )
            ]
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.menu, color: Colors.black),
              Spacer(),
              Center(child: const Text('Search Bar ',style: TextStyle(fontStyle:FontStyle.italic,color: Colors.black87),)),
              
              
              SizedBox(width: 80,),
              const Icon(Icons.search, color: Colors.black),
              SizedBox(width: 10),
              const Icon(Icons.more_vert, color: Colors.black),
            ],
          ),
        ),
      
    );
  }
}
