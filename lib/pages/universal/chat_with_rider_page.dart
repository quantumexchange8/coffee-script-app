import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/pages/universal/chat_with_rider_widgets/chat_bubble.dart';
import 'package:coffee_script_app/pages/universal/chat_with_rider_widgets/rider_profile_row.dart';
import 'package:coffee_script_app/pages/universal/chat_with_rider_widgets/send_message_row.dart';
import 'package:coffee_script_app/pages/widgets/outside_appbar.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ChatWithRiderPage extends StatefulWidget {
  const ChatWithRiderPage({super.key});

  @override
  State<ChatWithRiderPage> createState() => _ChatWithRiderPageState();
}

class _ChatWithRiderPageState extends State<ChatWithRiderPage> {
  List<Map<String, dynamic>> chatHistory = _chatHistory;
  List<PlayerController?> playerControllers = [];
  final RecorderController recorderController = RecorderController();
  bool isRecording = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (var element in chatHistory) {
      if (element['chat_type'] == 'voice') {
        playerControllers.add(PlayerController());
      } else {
        playerControllers.add(null);
      }
    }
  }

  Future<void> preparePlayer(
          {required PlayerController controller,
          required Map<String, dynamic> chat}) async =>
      await controller.preparePlayer(
        path: chat['chat_data'],
        shouldExtractWaveform: true,
        noOfSamples: 15,
        volume: 1.0,
      );

  @override
  void dispose() {
    recorderController.dispose();
    for (var element in playerControllers) {
      if (element != null) {
        element.dispose();
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      appBar: outsideAppBar(context,
          titleWidget: riderProfileRow(
              riderImage:
                  'https://i.pinimg.com/736x/ae/ec/c2/aeecc22a67dac7987a80ac0724658493.jpg',
              riderName: 'Mehboob Ali',
              isOnline: true),
          centerTitle: false,
          title: ''),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding:
                  EdgeInsets.symmetric(horizontal: width20, vertical: height24),
              itemCount: chatHistory.length,
              itemBuilder: (context, index) {
                final chat = chatHistory[index];
                bool isSender = chat['sender'] == 'user';
                if (chat['chat_type'] == 'text') {
                  return Padding(
                    padding: EdgeInsets.only(bottom: height24),
                    child: textChatBubble(
                        textChat: chat['chat_data'], isSender: isSender),
                  );
                } else {
                  final playerController = playerControllers[index]!;
                  return FutureBuilder(
                      future: Permission.storage.status,
                      builder: (context, snapPermission) {
                        if (snapPermission.data != null) {
                          // if (snapPermission.data!.isDenied) {
                          //   return ErrorWidget(Exception('Permission Denied'));
                          // } else {
                          return FutureBuilder(
                              future: preparePlayer(
                                  controller: playerController, chat: chat),
                              builder: (context, snapVoid) {
                                return FutureBuilder(
                                    future: playerController.getDuration(),
                                    builder: (context, snapInt) {
                                      return Padding(
                                        padding:
                                            EdgeInsets.only(bottom: height24),
                                        child: voiceChatBubble(
                                            onTapPlay: () {
                                              if (playerController
                                                  .playerState.isPlaying) {
                                                playerController.stopPlayer();
                                              } else {
                                                playerController.startPlayer();
                                              }
                                            },
                                            isSender: isSender,
                                            playerController: playerController,
                                            audioDurationInMilliseconds:
                                                snapInt.data),
                                      );
                                    });
                              });
                          // }
                        } else {
                          return const CircularProgressIndicator();
                        }
                      });
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(width20, 0, width20, height24),
            child: sendMessageRow(
                onTapRecord: () async {
                  try {
                    if (isRecording) {
                      recorderController.reset();

                      final path = await recorderController.stop(false);

                      if (path != null) {
                        debugPrint(path);
                        debugPrint(
                            "Recorded file size: ${File(path).lengthSync()}");
                        setState(() {
                          chatHistory.add({
                            'chat_data': path,
                            'chat_type': 'voice',
                            'sender': 'user'
                          });
                        });
                      }
                    } else {
                      await recorderController.record(); // Path is optional
                    }
                  } catch (e) {
                    debugPrint(e.toString());
                  } finally {
                    setState(() {
                      isRecording = !isRecording;
                    });
                  }
                },
                recorderController: recorderController,
                isRecording: isRecording),
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
        '/data/user/0/com.example.coffee_script_app/cache/25-04-24-02-55-123001130625537671610.m4a',
    'chat_type': 'voice',
    'sender': 'user'
  },
  {
    'chat_data':
        '/data/user/0/com.example.coffee_script_app/cache/25-04-24-02-55-123001130625537671610.m4a',
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
