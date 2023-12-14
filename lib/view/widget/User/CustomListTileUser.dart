import 'package:flutter/material.dart';

class CustomListTileUser extends StatelessWidget {
      final String firstName;
      final String lastname;
      final String leading_;


  final void Function()? onEdit;
  final void Function()? onDelete;
  final IconData? iconDelete;


  const CustomListTileUser({super.key, 
  required this.firstName,
  required this.lastname,
   required this.leading_,
  required this.onEdit,
  required this.onDelete, 
  required  this.iconDelete
      });

  @override
  Widget build(BuildContext context) {
    return     InkWell(
                    onTap: onEdit,
      
      
        child: Card(
                  child: ListTile(
                                
                       leading: Container(padding: const EdgeInsets.only(top: 5.0),child: Text(leading_)),
      
                       title: Row(
                         children: [
                           Text(firstName),
                           const SizedBox(width: 30.0,),
                           Text(lastname),
                         ],
                       ),
      
                              
                              
                        trailing: 
                                 IconButton(onPressed: onDelete,
                                  icon:  Icon(iconDelete, color: Colors.red,)
                                  ),
                              
                                                  ),
                            ),
      
    );
  }
}