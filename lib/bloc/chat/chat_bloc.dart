// Bloc package for managing state and events
import 'package:bloc/bloc.dart';

// Importing the chat repository and AI service for handling data and responses
import '../../services/chat_ai_service.dart';

// Chat event and state definitions
import 'chat_event.dart';
import 'chat_state.dart';

// This mixin contains all the event handler methods (modularized)
import 'chat_bloc_handlers.dart';

/// BLoC class that handles chat-related state and events.
/// It reacts to events like sending a message, executing a prompt,
/// loading past conversations, stopping generation, and more.
class ChatBloc extends Bloc<ChatEvent, ChatState> with ChatBlocHandlers {
  final ChatAIService _chatAIService;

  // Flag used to signal when response generation should be stopped
  bool _cancelTyping = false;

  // Key of the current Hive conversation session
  int? _currentSessionKey;

  // Getters and setters for the current session key
  int? get currentSessionKey => _currentSessionKey;
  set currentSessionKey(int? key) => _currentSessionKey = key;

  /// Constructor initializes dependencies and sets the initial state.
  /// It also registers handlers for each supported ChatEvent.
  ChatBloc({
    required ChatAIService chatAIService,
  })  :_chatAIService = chatAIService,
  // Initial state starts with empty conversation and message history
        super(const ChatLoaded(messages: [], currentConversation: [])) {

    // Register all chat-related event handlers defined in ChatBlocHandlers
    on<SendMessage>(onSendMessage);
    on<ExecutePrompt>(onExecutePrompt);
    on<ResetCurrentConversation>(onResetCurrentConversation);
    on<StopGenerating>(onStopGenerating);
  }


  /// Getter to expose ChatAIService to other handlers
  ChatAIService get chatAIService => _chatAIService;

  /// Flag indicating if response generation should be canceled mid-stream
  bool get cancelTyping => _cancelTyping;
  set cancelTyping(bool value) => _cancelTyping = value;
}