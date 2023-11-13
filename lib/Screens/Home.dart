import 'package:flutter/material.dart';
import 'package:todoapp/constans/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
       appBar: _buildAppBar(),
       body: Container(
           padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
         child: Column(
           children: [
             searchBox(),
             Expanded(
               child: ListView(
                 children: [
                   Container(
                     margin: EdgeInsets.only(top: 50,bottom: 20) ,
                     child: Text("All ToDo Items",style: TextStyle(fontSize:30,fontWeight: FontWeight.w500 ),),
                   )
                 ],
               ),
             )
           ],
         )
       ),
    );
  }

  Widget searchBox(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search,color: tdBlack,size: 20,),
            prefixIconConstraints: BoxConstraints(maxHeight: 20,minWidth: 25),
            border: InputBorder.none,
            hintText: "Search",
            hintStyle: TextStyle(color: tdGrey)

        ),

      ),
    );
  }


  AppBar _buildAppBar() {
    return AppBar(
       elevation: 0,
      backgroundColor: tdBGColor,
     title: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Icon(
           Icons.menu,
           color: tdBlack,
           size: 30,
         ),
         Container(
           height:40 ,
           width: 40,
           child: ClipRRect(
             borderRadius: BorderRadius.circular(20),
             child: Image.asset('assets/pic1.jpg'),),
         )

       ],
     ),

     );
  }
}