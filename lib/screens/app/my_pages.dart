// Core Flutter imports
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Screen and widget imports
import 'package:tellioo/screens/chat/chat_screen.dart';

// Bloc and state management imports
import 'package:tellioo/bloc/chat/chat_bloc.dart';
import 'package:tellioo/bloc/chat/chat_state.dart';

/// The main page view of the app that displays  the Chat screen.
class MyPages extends StatefulWidget {
  const MyPages({Key? key,}) : super(key: key);

  // Global key used to allow navigation control from outside this widget
  static final GlobalKey<_MyPagesState> globalKey = GlobalKey<_MyPagesState>();

  @override
  _MyPagesState createState() => _MyPagesState();
}

class _MyPagesState extends State<MyPages> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, chatState) {
        return const Scaffold(
          body: ChatScreen(),
        );
      },
    );
  }
}