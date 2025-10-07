import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_remote_data_source.dart';
import '../models/chat_message_model.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  const ChatRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Stream<Either<Failure, ChatMessage>> streamChatCompletion({
    required List<ChatMessage> messages,
    required String systemPrompt,
  }) async* {
    if (!await networkInfo.isConnected) {
      yield const Left(NetworkFailure());
      return;
    }

    final formattedHistory = [
      {
        'role': 'system',
        'content': systemPrompt,
      },
      ...messages
          .map(ChatMessageModel.fromEntity)
          .where((message) => message.content.trim().isNotEmpty)
          .map((message) => message.toRemotePayload()),
    ];

    try {
      final stream = remoteDataSource.streamChatCompletion(
        conversationHistory: formattedHistory,
      );

      var buffer = '';
      await for (final chunk in stream) {
        buffer += chunk;
        yield Right(ChatMessage(
          content: buffer,
          isUserMessage: false,
        ));
      }
    } on NetworkException catch (error) {
      yield Left(NetworkFailure(error.message));
    } on ServerException catch (error) {
      yield Left(ServerFailure(error.message));
    } on CacheException catch (error) {
      yield Left(CacheFailure(error.message));
    } on ValidationException catch (error) {
      yield Left(ValidationFailure(error.message));
    } catch (_) {
      yield const Left(UnknownFailure());
    }
  }
}
