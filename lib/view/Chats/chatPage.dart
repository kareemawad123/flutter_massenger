import 'package:first_day/model/model.dart';
import 'package:first_day/view/ChatData/ChatData.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<SimpleChatMassage> users = [
      SimpleChatMassage('Kareem Smile', 'Hello', "10:05",true),
      SimpleChatMassage('Ayman Noah', 'Holla', "13:33",false),
      SimpleChatMassage('Reem Reda', 'Namaste', "22:15",false),
      SimpleChatMassage('Kareem Smile', 'Hello', "10:05",true),
      SimpleChatMassage('Ayman Noah', 'Holla', "13:33",false),
      SimpleChatMassage('Reem Reda', 'Namaste', "22:15",false),
      SimpleChatMassage('Kareem Smile', 'Hello', "10:05",true),
      SimpleChatMassage('Ayman Noah', 'Holla', "13:33",false),
      SimpleChatMassage('Reem Reda', 'Namaste', "22:15",false),
      SimpleChatMassage('Kareem Smile', 'Hello', "10:05",true),
      SimpleChatMassage('Ayman Noah', 'Holla', "13:33",false),
      SimpleChatMassage('Reem Reda', 'Namaste', "22:15",false),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/02.jpeg'),
              radius: 22,
            ),
            SizedBox(
              width: size.width * 0.02,
            ),
            const Text('Chats'),
          ],
        ),
        actions: [
          CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: IconButton(
                  color: Colors.black,
                  onPressed: () {},
                  icon: const Icon(Icons.camera_alt))),
          SizedBox(
            width: size.width * 0.015,
          ),
          CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: IconButton(
                  color: Colors.black,
                  onPressed: () {},
                  icon: const Icon(Icons.edit))),
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                onTap: () {
                  // print('Search');
                },
                focusColor: Colors.white,
                hoverColor: Colors.white,
                highlightColor: Colors.white,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: <Widget>[
                      const Icon(Icons.search_rounded),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      const Text('Search'),
                    ],
                  ),
                ),
              ),
              // Active User Builder
              Container(
                height: 80,
                padding: const EdgeInsets.only(top: 10, bottom: 0),
                child: ListView.builder(
                  itemBuilder: (contect, index) {
                    return activeUser(name: "name", context: context);
                  },
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              // Chat Builder
              ListView.separated(
                itemBuilder: (content, index) {
                  return userMessage(
                      context: context, status: true, chatMassage: users[index]);
                },
                separatorBuilder: (content, index) {
                  return SizedBox(
                    height: size.height * 0.01,
                  );
                },
                itemCount: users.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget activeUser({required String name, required BuildContext context}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.16,
    height: MediaQuery.of(context).size.height * 0.12,
    // color: Colors.grey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundColor: Colors.blue,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          name,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}

Widget userMessage(
    {required SimpleChatMassage chatMassage,
    required bool status,
    required BuildContext context}) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ChatData(chatName: chatMassage.userName),
          settings: RouteSettings(arguments: chatMassage.userName)));
    },
    child: Row(
      children: <Widget>[
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            const SizedBox(
              width: 50,
              // color: Colors.grey,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/02.jpeg'),
                radius: 30,
              ),
            ),
            (status)
                ? const Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Icon(
                        Icons.circle,
                        size: 25,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.circle,
                        size: 17,
                        color: Colors.green,
                      ),
                    ],
                  )
                : Container()
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                chatMassage.userName,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Row(
                children: [
                  Expanded(child: Text(chatMassage.massage)),
                  Text(
                    chatMassage.isAm?"${chatMassage.time} AM":"${chatMassage.time} PM",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}
