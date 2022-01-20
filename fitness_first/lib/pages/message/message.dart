import 'package:fitness_first/pages/screens.dart';
import 'package:intl/intl.dart';

class Message extends StatefulWidget {
  final String name;
  final String type;
  const Message({Key key, this.name, this.type = 'Yoga trainer'})
      : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final messageController = TextEditingController();
  String _currentMessage;
  String currentTime = DateFormat.jm().format(DateTime.now());

  final messageList = [
    {
      'message': 'Hey Shilpa',
      'time': '11:40 am',
      'isMe': true,
    },
    {
      'message': 'Hello Samantha\nHow may i help you?',
      'time': '11:42 am',
      'isMe': false,
    },
    {
      'message': 'Suggest some exercises for me',
      'time': '11:45 am',
      'isMe': true,
    },
    {
      'message': 'Sure, why not\njust give a minute i’ll text you',
      'time': '11:48 am',
      'isMe': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name,
              style: black18SemiBoldTextStyle,
            ),
            Text(
              widget.type,
              style: grey13RegularTextStyle,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          heightSpace,
          heightSpace,
          messagesList(),
          textField(),
        ],
      ),
    );
  }

  messagesList() {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        itemCount: messageList.length,
        itemBuilder: (context, index) {
          final item = messageList[index];
          return Row(
            mainAxisAlignment:
                item['isMe'] ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: fixPadding * 2.0),
                padding: const EdgeInsets.all(fixPadding / 2),
                decoration: BoxDecoration(
                  color:
                      item['isMe'] ? primaryColor : greyColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: item['isMe']
                          ? primaryColor.withOpacity(0.1)
                          : greyColor.withOpacity(0.1),
                      spreadRadius: 2.5,
                      blurRadius: 2.5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          item['message'],
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: item['isMe'] ? whiteColor : blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    heightSpace,
                    heightSpace,
                    Text(
                      item['time'].toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: item['isMe'] ? whiteColor : blackColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  textField() {
    var mes = {
      'message': _currentMessage,
      'isMe': true,
      'time': currentTime,
    };
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding,
      ),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _currentMessage = value;
                });
              },
              controller: messageController,
              cursorColor: whiteColor,
              style: white14MediumTextStyle,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.all(fixPadding),
                hintText: 'Write your message',
                hintStyle: white13MediumTextStyle,
                border: const OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          widthSpace,
          widthSpace,
          InkWell(
            onTap: () {
              messageController.clear();
              setState(() {
                messageList.add(mes);
              });
            },
            child: const Icon(
              Icons.send,
              size: 15,
              color: whiteColor,
            ),
          ),
          widthSpace,
          widthSpace,
        ],
      ),
    );
  }
}
