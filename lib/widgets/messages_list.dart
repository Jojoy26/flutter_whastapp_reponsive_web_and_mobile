import 'package:flutter/material.dart';

import 'package:flutter_watsapp_clone/models/contact_model.dart';

class MessagesList extends StatefulWidget {
  final ContactModel model;
  const MessagesList({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<MessagesList> createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {

  

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.model.messagesList.length,
      itemBuilder: (contetx, index){
  
        Message message = widget.model.messagesList[index];
  
        return Align(
          alignment: message.isMine ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.only(top: 5, bottom: 5),
            padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: message.isMine ? Color(0xFFDCF8C6) : Colors.white
            ),
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 80 / 100 - 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: message.isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: message.isMine ? CrossAxisAlignment.end : CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 34),
                        child: Text(message.message, style: TextStyle(fontSize: 17), overflow: TextOverflow.clip,),
                      ),
                      Text(message.hour, style: TextStyle(color: Colors.grey, fontSize: 12),)
                    ],
                  ),
                ),
                Visibility(
                  visible: message.isMine,
                  child: SizedBox(width: 3,)
                ),
                Visibility(
                  visible: message.isMine,
                  child: Icon(Icons.done_all, size: 17, color: Colors.grey,)
                )
              ],
            ),
          ),
        );
      }
    );
  }
}