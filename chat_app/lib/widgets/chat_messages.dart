import 'package:chat_app/widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    
    final authenticatedUser = FirebaseAuth.instance.currentUser!;

    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('chat').orderBy('createdAt', descending: true).snapshots(),
      builder: (ctx, chatSnapshots) {
        if (chatSnapshots.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!chatSnapshots.hasData || chatSnapshots.data!.docs.isEmpty) {
          return const Center(
            child: Text('No messages yet.'),
          );
        }

        if (chatSnapshots.hasError) {
          return const Center(
            child: Text('An error occurred.'),
          );
        }

        final loadedMessages = chatSnapshots.data!.docs;

        return ListView.builder(
          padding: const EdgeInsets.only(
              left: 13,
              right: 13,
              bottom: 40,
            ),
          reverse: true, // Start from the bottom
          itemCount: loadedMessages.length,
          itemBuilder: (ctx, index){
            final chatMessage = loadedMessages[index].data();
            final nextMessage  = index+1 < loadedMessages.length ? loadedMessages[index+1].data() : null;

            final currentMessageUserId = chatMessage['userId'];
            final nexMessageUserId = nextMessage != null ? nextMessage['userId'] : null;
            final nextUserIsSame = currentMessageUserId == nexMessageUserId;

            if(nextUserIsSame){
              return MessageBubble.next(
                message: chatMessage['text'],
                isMe: authenticatedUser.uid == currentMessageUserId,
              );
            } else {
              return MessageBubble.first(
                userImage: chatMessage['userImage'],
                username: chatMessage['username'],
                message: chatMessage['text'],
                isMe: authenticatedUser.uid == currentMessageUserId,
              );
            }


          }
        );
      },
    );
  }
}
