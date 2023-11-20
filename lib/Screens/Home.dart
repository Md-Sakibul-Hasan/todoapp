import 'package:flutter/material.dart';
import 'package:todoapp/Model/todo.dart';
import 'package:todoapp/constans/colors.dart';

import '../Widgets/todo_items.dart';

class Home extends StatefulWidget {
   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList= ToDo.todoList();
  List<ToDo>_foundToDo=[];
  final _todoController= TextEditingController();
  @override
  void initState() {
    _foundToDo= todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
       appBar: _buildAppBar(),
       body: Stack(
         children: [
           Container(
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
                       ),

                       for(ToDo todoo in _foundToDo.reversed)
                        ToDoItems(
                            toDo: todoo,
                            onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),

                     ],
                   ),
                 )
               ],
             )
           ),

           Align(
             alignment: Alignment.bottomCenter,
             child: Row(
               children: [
                 Expanded(child: Container(
                   margin: EdgeInsets.only(bottom:20 ,right:20 ,left:20 ),
                   padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color: Colors.white,
                     boxShadow: const [BoxShadow(
                         color: Colors.grey,
                         offset: Offset(0.0,0.0),
                         blurRadius: 10.0,
                         spreadRadius: 0.0
                     )]

                   ),
                   child: TextField(
                     controller: _todoController,
                     decoration: InputDecoration(
                       hintText: 'Add a new todo item',
                         border: InputBorder.none
                     ),
                   ),
                 )

                 ),
                 Container(
                   margin: EdgeInsets.only(
                     bottom: 20,
                     right: 20,
                   ),
                   child: ElevatedButton(
                     child: Text('+',style: TextStyle(fontSize: 40,)),
                     onPressed: (){
                       _addtodoItem(_todoController.text);
                     },
                     style: ElevatedButton.styleFrom(
                       backgroundColor: tdBlue,
                       minimumSize: Size(60, 60),
                       elevation: 10
                     ),
                   ),
                 )
               ],
             ),
           )
         ],
       ),
    );
  }


  void _handleToDoChange(ToDo todo){
    setState(() {
      todo.isDone=!todo.isDone;
    });
  }

  void _deleteToDoItem(String id){
    setState(() {
      todosList.removeWhere((item) => item.id==id);
    });
  }

  void _addtodoItem(String toDo){
    setState(() {
      todosList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText: toDo));
    });
    _todoController.clear();
  }

  void runFilter(String enteredKeyword){
    List<ToDo> results=[];
    if( enteredKeyword.isEmpty){
      results=todosList;
    }
    else{
      results= todosList.where((item) => item.todoText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }
    setState(() {
      _foundToDo= results;
    });
  }


  Widget searchBox(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        onChanged: (value) => runFilter(value),
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
