import 'package:flutter/material.dart';
import 'package:todoapp/constans/colors.dart';

class ToDoItems extends StatelessWidget {
  const ToDoItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal:20 ,vertical:5 ),
        onTap: (){},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        leading: Icon(Icons.check_box,color: tdBlue,),
        title: Text('Check mail',
          style: TextStyle(
              fontSize: 16,
              color: tdBlack,
              decoration: TextDecoration.lineThrough),
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
                onPressed: (){},
          ),
        ),
      )

    );
  }
}
