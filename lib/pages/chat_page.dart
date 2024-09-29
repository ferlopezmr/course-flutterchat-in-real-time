import 'dart:io';

import 'package:chat/utils/colors.dart';
import 'package:chat/widgets/messages/chat_messages.dart';
import 'package:chat/widgets/profile_circle_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin{
  ColorsTheme colorsTheme = ColorsTheme();
  final _textMessageController = TextEditingController();
  final _focusNode = new FocusNode();

  List<ChatMessages> messages = [
/*     ChatMessages(text: "text lorem impsun i dont know what happen with this i only going to try", isTheirMessage: true,),
    ChatMessages(text: "hola", isTheirMessage: true,),
    ChatMessages(text: "text lorem impsun i dont know what happen with this i only going to try", isTheirMessage: false,), */
  ];

  @override
  void dispose() {
    for(ChatMessages message in messages){
      message.animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorsTheme.primaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UserCircleAvatar(username: "Fe"),
            const SizedBox(
              height: 3,
            ),
            Text(
              "Fernando Lopez",
              style:
                  TextStyle(color: colorsTheme.lightPrimaryColor, fontSize: 14),
            )
          ],
        ),
        elevation: 1,
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
                child: ListView.builder(
                  reverse: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: messages.length,
                  itemBuilder: (BuildContext c, int i) => messages[i]
                )
            ),
            const Divider(height: 15,),
            
            Container(
              color: Colors.white,
              height: 100,
              child: _inputChat(),
            )
          ],
        ),
      ),
    );
  }

  Widget _inputChat(){
    return SafeArea(  
    child: Container(
      margin:const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Flexible(
            child: TextField( 
              controller: _textMessageController,
              /* onSubmitted:(text)=> _handleSubmit(), */
              onChanged: (String text){
                setState(() {});
              },
              decoration: const InputDecoration.collapsed(
                hintText: "Enviar mensaje"
              ),
              focusNode: _focusNode,
            )
          ),
          Container(
            margin:const EdgeInsets.symmetric(horizontal: 4.0),
            child: Platform.isIOS?
            CupertinoButton(
              child: const Text("Enviar"),
              onPressed: ()=>{},
            ): 
            Container(
              margin:const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconTheme(
                data: IconThemeData(
                  color: colorsTheme.primaryColor
                ),
                child: IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  icon: const Icon(Icons.send), 
                  onPressed: _textMessageController.text.trim().isNotEmpty?  () => _handleSubmit():null,
                ),                                
              ),
            ),  
          )
        ],
      )
    )
    );
  }

  void _handleSubmit (){
    debugPrint(_textMessageController.text);
    ChatMessages message = ChatMessages(text: _textMessageController.text, isTheirMessage: true, animationController: AnimationController(vsync: this, duration: Duration(seconds: 1)),);
    messages.insert(0, message);
    message.animationController.forward();
    _textMessageController.clear();
    setState(() { });
  }
}
