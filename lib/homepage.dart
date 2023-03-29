
import 'package:fintrack/core/constant.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
    appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,),
        body:Column(
         
          children: [
            const SizedBox(height: 10,)
    ,          Center(
      child: Container(
      
        height: height/4.3,
        width:width /1.1,            
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(),image: const DecorationImage(image: AssetImage('assets/istockphoto-528219721-612x612.jpg'),fit: BoxFit.cover)),
        child: Column(
          children: [
            kHeight10,
            const Text('Total Balance',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.lightBlue),),
            kHeight10,
            const Text('\$1,4000',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white,fontFamily:''),),
            kHeight10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Column(
                      children:const [
                         CircleAvatar(backgroundColor: Colors.white,child: Icon(Icons.arrow_upward_outlined,color: Colors.green,),)
                      ],
                    ),
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text('Income',style:TextStyle(fontSize: 22, color: Colors.green,fontWeight: FontWeight.bold,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text('\$ 1,3880',style: headTextStyle,),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    Column(
                      children:const [
                        CircleAvatar(backgroundColor: Colors.white,child: Icon(Icons.arrow_downward_outlined,color: Colors.red,),)
                      ],
                    ),
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text('Expense',style:TextStyle(fontSize: 22, color: Colors.red,fontWeight: FontWeight.bold,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text('\$ 1,3880',style: headTextStyle,),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),

      
          ],
        ),
              
              
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Transactions History'),
          Text('See all'),
        ],
      ),
    )

          ],
        ) ,
      ),
    );
  }
}