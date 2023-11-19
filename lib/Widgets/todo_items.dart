import 'package:flutter/material.dart';
import 'package:todoapp/Model/todo.dart';
import 'package:todoapp/constans/colors.dart';

class ToDoItems extends StatelessWidget {
  final ToDo toDo;
  final onToDoChanged;
  final onDeleteItem;

  const ToDoItems({super.key, required this.toDo,required this.onToDoChanged,required this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal:20 ,vertical:5 ),
        onTap: (){
          onToDoChanged(toDo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        leading: Icon(
          toDo.isDone?
          Icons.check_box: Icons.check_box_outline_blank,
          color: tdBlue,),
        title: Text(
          toDo.todoText!,
          style: TextStyle(
              fontSize: 16,
              color: tdBlack,
              decoration: toDo.isDone? TextDecoration.lineThrough:null),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 8),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),

          ),
          child: IconButton(

                color: Colors.white,
                iconSize: 18,
                icon:Icon(Icons.delete),
                onPressed: (){
                  onDeleteItem(toDo.id);
                },
          ),
        ),
      )

    );
  }
}
