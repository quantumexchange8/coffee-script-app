import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:coffee_script_app/pages/universal/chat_with_rider_widgets/chat_bubble.dart';
import 'package:coffee_script_app/pages/universal/chat_with_rider_widgets/rider_profile_row.dart';
import 'package:coffee_script_app/pages/widgets/outside_appbar.dart';
import 'package:flutter/material.dart';

class ChatWithRiderPage extends StatefulWidget {
  const ChatWithRiderPage({super.key});

  @override
  State<ChatWithRiderPage> createState() => _ChatWithRiderPageState();
}

class _ChatWithRiderPageState extends State<ChatWithRiderPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: outsideAppBar(context,
          titleWidget: riderProfileRow(
              riderImage:
                  'https://i.pinimg.com/736x/ae/ec/c2/aeecc22a67dac7987a80ac0724658493.jpg',
              riderName: 'Mehboob ALi',
              isOnline: true),
          centerTitle: false,
          title: ''),
      body: Column(
        children: [
          ListView.builder(
            itemCount: _chatHistory.length,
            itemBuilder: (context, index) {
              final chat = _chatHistory[index];
              bool isSender = chat['sender'] == 'user';
              if (chat['chat_type'] == 'text') {
                return textChatBubble(
                    textChat: chat['chat_data'], isSender: isSender);
              } else {
                PlayerController controller = PlayerController();
                Future<void> preparePlayer() async =>
                    await controller.preparePlayer(
                      path: chat['chat_data'],
                      shouldExtractWaveform: true,
                      noOfSamples: 15,
                      volume: 1.0,
                    );
                return FutureBuilder(
                    future: preparePlayer(),
                    builder: (context, snap) {
                      return FutureBuilder(
                          future: controller.getDuration(),
                          builder: (context, snap) {
                            return voiceChatBubble(
                                onTapPlay: () {
                                  if (controller.playerState.isPlaying) {
                                    controller.stopPlayer();
                                  } else {
                                    controller.startPlayer();
                                  }
                                },
                                isSender: isSender,
                                playerController: controller,
                                audioDurationInMilliseconds: snap.data!);
                          });
                    });
              }
            },
          )
        ],
      ),
    );
  }
}

const List<Map<String, dynamic>> _chatHistory = [
  {
    'chat_data':
        'Lorem ipsum dolor sit amet consectetur. Cursus ornare nullam vel id ipsum sagittis euismod mattis amet. In consectetur enim mauris turpis dictum.',
    'chat_type': 'text',
    'sender': 'rider'
  },
  {
    'chat_data':
        'Lorem ipsum dolor sit amet consectetur. Cursus ornare nullam vel id ipsum sagittis euismod mattis amet. In consectetur enim mauris turpis dictum.',
    'chat_type': 'text',
    'sender': 'user'
  },
  {
    'chat_data':
        'Lorem ipsum dolor sit amet consectetur. Cursus ornare nullam vel id ipsum sagittis euismod mattis amet. In consectetur enim mauris turpis dictum.',
    'chat_type': 'text',
    'sender': 'rider'
  },
  {
    'chat_data':
        'https://freetestdata.com/wp-content/uploads/2021/09/Free_Test_Data_100KB_MP3.mp3',
    'chat_type': 'voice',
    'sender': 'user'
  },
  {
    'chat_data':
        'https://freetestdata.com/wp-content/uploads/2021/09/Free_Test_Data_500KB_MP3.mp3',
    'chat_type': 'voice',
    'sender': 'rider'
  },
  {
    'chat_data':
        'Lorem ipsum dolor sit amet consectetur. Cursus ornare nullam vel id ipsum sagittis euismod mattis amet. In consectetur enim mauris turpis dictum.',
    'chat_type': 'text',
    'sender': 'user'
  },
];
