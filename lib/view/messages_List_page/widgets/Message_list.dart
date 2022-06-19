import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pelerin/configuration/Message.dart';
import 'package:pelerin/configuration/message_list.dart';
import 'package:pelerin/view/home_page/components/size_config.dart';
import 'package:pelerin/view/messages_List_page/widgets/message_list_widget/Message_image.dart';
import 'package:pelerin/view/messages_List_page/widgets/message_list_widget/message_text.dart';

class MessageListWidget extends StatefulWidget {
  const MessageListWidget({Key? key}) : super(key: key);

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "قائمة رسائل ",
          style: TextStyle(color: Colors.white),
        ),leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 0, 0, 0)),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 10, 81, 161),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth! / 20),
        child: FutureBuilder<List<Message>>(
            future: bringTheMessagesList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var MessageList = snapshot.data;
                return ListView.builder(
                    itemCount: MessageList!.length,
                    itemBuilder: (context, index) {
                      var Message = MessageList[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.screenHeight! / 68.3),

                        /// 10.0
                        child: Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            setState(() {});
                          },
                          background: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.screenWidth! / 20.55),

                            /// 20.0
                            decoration: BoxDecoration(
                              color: Color(0xFFFFE6E6),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [Spacer(), Icon(Icons.delete_outline)],
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(4, 6),
                                    blurRadius: 4,
                                    color: Colors.black.withOpacity(0.1),
                                  )
                                ]),
                            child: Row(
                              children: [
                                SizedBox(
                                    width: SizeConfig.screenWidth! / 20.55),
                                Spacer(),
                                /// 20.0
                                MessageText(
                                    description: Message.description ,
                                    reponseDescription: Message.reponseDescription ),
                                
                                MessageImage(),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return SizedBox(
                    child: Center(
                  child: Lottie.network(
                      "https://assets10.lottiefiles.com/packages/lf20_peztuj79.json",
                      height: SizeConfig.screenHeight! / 6.83,

                      /// 100.0
                      width: SizeConfig.screenWidth! / 4.11,

                      /// 100.0
                      repeat: false),
                ));
              }
            }),
      ),
    );
  }
}
