// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content) sendMessage,
    required TResult Function(String prompt) executePrompt,
    required TResult Function(bool keepSession) resetConversation,
    required TResult Function() stopGeneration,
    required TResult Function(Either<Failure, ChatMessage> result) streamUpdate,
    required TResult Function() streamCompleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content)? sendMessage,
    TResult? Function(String prompt)? executePrompt,
    TResult? Function(bool keepSession)? resetConversation,
    TResult? Function()? stopGeneration,
    TResult? Function(Either<Failure, ChatMessage> result)? streamUpdate,
    TResult? Function()? streamCompleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content)? sendMessage,
    TResult Function(String prompt)? executePrompt,
    TResult Function(bool keepSession)? resetConversation,
    TResult Function()? stopGeneration,
    TResult Function(Either<Failure, ChatMessage> result)? streamUpdate,
    TResult Function()? streamCompleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_ExecutePrompt value) executePrompt,
    required TResult Function(_ResetConversation value) resetConversation,
    required TResult Function(_StopGeneration value) stopGeneration,
    required TResult Function(_StreamUpdate value) streamUpdate,
    required TResult Function(_StreamCompleted value) streamCompleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_ExecutePrompt value)? executePrompt,
    TResult? Function(_ResetConversation value)? resetConversation,
    TResult? Function(_StopGeneration value)? stopGeneration,
    TResult? Function(_StreamUpdate value)? streamUpdate,
    TResult? Function(_StreamCompleted value)? streamCompleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_ExecutePrompt value)? executePrompt,
    TResult Function(_ResetConversation value)? resetConversation,
    TResult Function(_StopGeneration value)? stopGeneration,
    TResult Function(_StreamUpdate value)? streamUpdate,
    TResult Function(_StreamCompleted value)? streamCompleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatEventCopyWith<$Res> {
  factory $ChatEventCopyWith(ChatEvent value, $Res Function(ChatEvent) then) =
      _$ChatEventCopyWithImpl<$Res, ChatEvent>;
}

/// @nodoc
class _$ChatEventCopyWithImpl<$Res, $Val extends ChatEvent>
    implements $ChatEventCopyWith<$Res> {
  _$ChatEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SendMessageImplCopyWith<$Res> {
  factory _$$SendMessageImplCopyWith(
          _$SendMessageImpl value, $Res Function(_$SendMessageImpl) then) =
      __$$SendMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String content});
}

/// @nodoc
class __$$SendMessageImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$SendMessageImpl>
    implements _$$SendMessageImplCopyWith<$Res> {
  __$$SendMessageImplCopyWithImpl(
      _$SendMessageImpl _value, $Res Function(_$SendMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_$SendMessageImpl(
      null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendMessageImpl implements _SendMessage {
  const _$SendMessageImpl(this.content);

  @override
  final String content;

  @override
  String toString() {
    return 'ChatEvent.sendMessage(content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageImpl &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, content);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMessageImplCopyWith<_$SendMessageImpl> get copyWith =>
      __$$SendMessageImplCopyWithImpl<_$SendMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content) sendMessage,
    required TResult Function(String prompt) executePrompt,
    required TResult Function(bool keepSession) resetConversation,
    required TResult Function() stopGeneration,
    required TResult Function(Either<Failure, ChatMessage> result) streamUpdate,
    required TResult Function() streamCompleted,
  }) {
    return sendMessage(content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content)? sendMessage,
    TResult? Function(String prompt)? executePrompt,
    TResult? Function(bool keepSession)? resetConversation,
    TResult? Function()? stopGeneration,
    TResult? Function(Either<Failure, ChatMessage> result)? streamUpdate,
    TResult? Function()? streamCompleted,
  }) {
    return sendMessage?.call(content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content)? sendMessage,
    TResult Function(String prompt)? executePrompt,
    TResult Function(bool keepSession)? resetConversation,
    TResult Function()? stopGeneration,
    TResult Function(Either<Failure, ChatMessage> result)? streamUpdate,
    TResult Function()? streamCompleted,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_ExecutePrompt value) executePrompt,
    required TResult Function(_ResetConversation value) resetConversation,
    required TResult Function(_StopGeneration value) stopGeneration,
    required TResult Function(_StreamUpdate value) streamUpdate,
    required TResult Function(_StreamCompleted value) streamCompleted,
  }) {
    return sendMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_ExecutePrompt value)? executePrompt,
    TResult? Function(_ResetConversation value)? resetConversation,
    TResult? Function(_StopGeneration value)? stopGeneration,
    TResult? Function(_StreamUpdate value)? streamUpdate,
    TResult? Function(_StreamCompleted value)? streamCompleted,
  }) {
    return sendMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_ExecutePrompt value)? executePrompt,
    TResult Function(_ResetConversation value)? resetConversation,
    TResult Function(_StopGeneration value)? stopGeneration,
    TResult Function(_StreamUpdate value)? streamUpdate,
    TResult Function(_StreamCompleted value)? streamCompleted,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(this);
    }
    return orElse();
  }
}

abstract class _SendMessage implements ChatEvent {
  const factory _SendMessage(final String content) = _$SendMessageImpl;

  String get content;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendMessageImplCopyWith<_$SendMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExecutePromptImplCopyWith<$Res> {
  factory _$$ExecutePromptImplCopyWith(
          _$ExecutePromptImpl value, $Res Function(_$ExecutePromptImpl) then) =
      __$$ExecutePromptImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String prompt});
}

/// @nodoc
class __$$ExecutePromptImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$ExecutePromptImpl>
    implements _$$ExecutePromptImplCopyWith<$Res> {
  __$$ExecutePromptImplCopyWithImpl(
      _$ExecutePromptImpl _value, $Res Function(_$ExecutePromptImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prompt = null,
  }) {
    return _then(_$ExecutePromptImpl(
      null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ExecutePromptImpl implements _ExecutePrompt {
  const _$ExecutePromptImpl(this.prompt);

  @override
  final String prompt;

  @override
  String toString() {
    return 'ChatEvent.executePrompt(prompt: $prompt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExecutePromptImpl &&
            (identical(other.prompt, prompt) || other.prompt == prompt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, prompt);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExecutePromptImplCopyWith<_$ExecutePromptImpl> get copyWith =>
      __$$ExecutePromptImplCopyWithImpl<_$ExecutePromptImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content) sendMessage,
    required TResult Function(String prompt) executePrompt,
    required TResult Function(bool keepSession) resetConversation,
    required TResult Function() stopGeneration,
    required TResult Function(Either<Failure, ChatMessage> result) streamUpdate,
    required TResult Function() streamCompleted,
  }) {
    return executePrompt(prompt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content)? sendMessage,
    TResult? Function(String prompt)? executePrompt,
    TResult? Function(bool keepSession)? resetConversation,
    TResult? Function()? stopGeneration,
    TResult? Function(Either<Failure, ChatMessage> result)? streamUpdate,
    TResult? Function()? streamCompleted,
  }) {
    return executePrompt?.call(prompt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content)? sendMessage,
    TResult Function(String prompt)? executePrompt,
    TResult Function(bool keepSession)? resetConversation,
    TResult Function()? stopGeneration,
    TResult Function(Either<Failure, ChatMessage> result)? streamUpdate,
    TResult Function()? streamCompleted,
    required TResult orElse(),
  }) {
    if (executePrompt != null) {
      return executePrompt(prompt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_ExecutePrompt value) executePrompt,
    required TResult Function(_ResetConversation value) resetConversation,
    required TResult Function(_StopGeneration value) stopGeneration,
    required TResult Function(_StreamUpdate value) streamUpdate,
    required TResult Function(_StreamCompleted value) streamCompleted,
  }) {
    return executePrompt(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_ExecutePrompt value)? executePrompt,
    TResult? Function(_ResetConversation value)? resetConversation,
    TResult? Function(_StopGeneration value)? stopGeneration,
    TResult? Function(_StreamUpdate value)? streamUpdate,
    TResult? Function(_StreamCompleted value)? streamCompleted,
  }) {
    return executePrompt?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_ExecutePrompt value)? executePrompt,
    TResult Function(_ResetConversation value)? resetConversation,
    TResult Function(_StopGeneration value)? stopGeneration,
    TResult Function(_StreamUpdate value)? streamUpdate,
    TResult Function(_StreamCompleted value)? streamCompleted,
    required TResult orElse(),
  }) {
    if (executePrompt != null) {
      return executePrompt(this);
    }
    return orElse();
  }
}

abstract class _ExecutePrompt implements ChatEvent {
  const factory _ExecutePrompt(final String prompt) = _$ExecutePromptImpl;

  String get prompt;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExecutePromptImplCopyWith<_$ExecutePromptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetConversationImplCopyWith<$Res> {
  factory _$$ResetConversationImplCopyWith(_$ResetConversationImpl value,
          $Res Function(_$ResetConversationImpl) then) =
      __$$ResetConversationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool keepSession});
}

/// @nodoc
class __$$ResetConversationImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$ResetConversationImpl>
    implements _$$ResetConversationImplCopyWith<$Res> {
  __$$ResetConversationImplCopyWithImpl(_$ResetConversationImpl _value,
      $Res Function(_$ResetConversationImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keepSession = null,
  }) {
    return _then(_$ResetConversationImpl(
      keepSession: null == keepSession
          ? _value.keepSession
          : keepSession // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ResetConversationImpl implements _ResetConversation {
  const _$ResetConversationImpl({this.keepSession = false});

  @override
  @JsonKey()
  final bool keepSession;

  @override
  String toString() {
    return 'ChatEvent.resetConversation(keepSession: $keepSession)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetConversationImpl &&
            (identical(other.keepSession, keepSession) ||
                other.keepSession == keepSession));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keepSession);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetConversationImplCopyWith<_$ResetConversationImpl> get copyWith =>
      __$$ResetConversationImplCopyWithImpl<_$ResetConversationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content) sendMessage,
    required TResult Function(String prompt) executePrompt,
    required TResult Function(bool keepSession) resetConversation,
    required TResult Function() stopGeneration,
    required TResult Function(Either<Failure, ChatMessage> result) streamUpdate,
    required TResult Function() streamCompleted,
  }) {
    return resetConversation(keepSession);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content)? sendMessage,
    TResult? Function(String prompt)? executePrompt,
    TResult? Function(bool keepSession)? resetConversation,
    TResult? Function()? stopGeneration,
    TResult? Function(Either<Failure, ChatMessage> result)? streamUpdate,
    TResult? Function()? streamCompleted,
  }) {
    return resetConversation?.call(keepSession);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content)? sendMessage,
    TResult Function(String prompt)? executePrompt,
    TResult Function(bool keepSession)? resetConversation,
    TResult Function()? stopGeneration,
    TResult Function(Either<Failure, ChatMessage> result)? streamUpdate,
    TResult Function()? streamCompleted,
    required TResult orElse(),
  }) {
    if (resetConversation != null) {
      return resetConversation(keepSession);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_ExecutePrompt value) executePrompt,
    required TResult Function(_ResetConversation value) resetConversation,
    required TResult Function(_StopGeneration value) stopGeneration,
    required TResult Function(_StreamUpdate value) streamUpdate,
    required TResult Function(_StreamCompleted value) streamCompleted,
  }) {
    return resetConversation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_ExecutePrompt value)? executePrompt,
    TResult? Function(_ResetConversation value)? resetConversation,
    TResult? Function(_StopGeneration value)? stopGeneration,
    TResult? Function(_StreamUpdate value)? streamUpdate,
    TResult? Function(_StreamCompleted value)? streamCompleted,
  }) {
    return resetConversation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_ExecutePrompt value)? executePrompt,
    TResult Function(_ResetConversation value)? resetConversation,
    TResult Function(_StopGeneration value)? stopGeneration,
    TResult Function(_StreamUpdate value)? streamUpdate,
    TResult Function(_StreamCompleted value)? streamCompleted,
    required TResult orElse(),
  }) {
    if (resetConversation != null) {
      return resetConversation(this);
    }
    return orElse();
  }
}

abstract class _ResetConversation implements ChatEvent {
  const factory _ResetConversation({final bool keepSession}) =
      _$ResetConversationImpl;

  bool get keepSession;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetConversationImplCopyWith<_$ResetConversationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StopGenerationImplCopyWith<$Res> {
  factory _$$StopGenerationImplCopyWith(_$StopGenerationImpl value,
          $Res Function(_$StopGenerationImpl) then) =
      __$$StopGenerationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StopGenerationImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$StopGenerationImpl>
    implements _$$StopGenerationImplCopyWith<$Res> {
  __$$StopGenerationImplCopyWithImpl(
      _$StopGenerationImpl _value, $Res Function(_$StopGenerationImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StopGenerationImpl implements _StopGeneration {
  const _$StopGenerationImpl();

  @override
  String toString() {
    return 'ChatEvent.stopGeneration()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StopGenerationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content) sendMessage,
    required TResult Function(String prompt) executePrompt,
    required TResult Function(bool keepSession) resetConversation,
    required TResult Function() stopGeneration,
    required TResult Function(Either<Failure, ChatMessage> result) streamUpdate,
    required TResult Function() streamCompleted,
  }) {
    return stopGeneration();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content)? sendMessage,
    TResult? Function(String prompt)? executePrompt,
    TResult? Function(bool keepSession)? resetConversation,
    TResult? Function()? stopGeneration,
    TResult? Function(Either<Failure, ChatMessage> result)? streamUpdate,
    TResult? Function()? streamCompleted,
  }) {
    return stopGeneration?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content)? sendMessage,
    TResult Function(String prompt)? executePrompt,
    TResult Function(bool keepSession)? resetConversation,
    TResult Function()? stopGeneration,
    TResult Function(Either<Failure, ChatMessage> result)? streamUpdate,
    TResult Function()? streamCompleted,
    required TResult orElse(),
  }) {
    if (stopGeneration != null) {
      return stopGeneration();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_ExecutePrompt value) executePrompt,
    required TResult Function(_ResetConversation value) resetConversation,
    required TResult Function(_StopGeneration value) stopGeneration,
    required TResult Function(_StreamUpdate value) streamUpdate,
    required TResult Function(_StreamCompleted value) streamCompleted,
  }) {
    return stopGeneration(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_ExecutePrompt value)? executePrompt,
    TResult? Function(_ResetConversation value)? resetConversation,
    TResult? Function(_StopGeneration value)? stopGeneration,
    TResult? Function(_StreamUpdate value)? streamUpdate,
    TResult? Function(_StreamCompleted value)? streamCompleted,
  }) {
    return stopGeneration?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_ExecutePrompt value)? executePrompt,
    TResult Function(_ResetConversation value)? resetConversation,
    TResult Function(_StopGeneration value)? stopGeneration,
    TResult Function(_StreamUpdate value)? streamUpdate,
    TResult Function(_StreamCompleted value)? streamCompleted,
    required TResult orElse(),
  }) {
    if (stopGeneration != null) {
      return stopGeneration(this);
    }
    return orElse();
  }
}

abstract class _StopGeneration implements ChatEvent {
  const factory _StopGeneration() = _$StopGenerationImpl;
}

/// @nodoc
abstract class _$$StreamUpdateImplCopyWith<$Res> {
  factory _$$StreamUpdateImplCopyWith(
          _$StreamUpdateImpl value, $Res Function(_$StreamUpdateImpl) then) =
      __$$StreamUpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Either<Failure, ChatMessage> result});
}

/// @nodoc
class __$$StreamUpdateImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$StreamUpdateImpl>
    implements _$$StreamUpdateImplCopyWith<$Res> {
  __$$StreamUpdateImplCopyWithImpl(
      _$StreamUpdateImpl _value, $Res Function(_$StreamUpdateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$StreamUpdateImpl(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Either<Failure, ChatMessage>,
    ));
  }
}

/// @nodoc

class _$StreamUpdateImpl implements _StreamUpdate {
  const _$StreamUpdateImpl(this.result);

  @override
  final Either<Failure, ChatMessage> result;

  @override
  String toString() {
    return 'ChatEvent.streamUpdate(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreamUpdateImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StreamUpdateImplCopyWith<_$StreamUpdateImpl> get copyWith =>
      __$$StreamUpdateImplCopyWithImpl<_$StreamUpdateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content) sendMessage,
    required TResult Function(String prompt) executePrompt,
    required TResult Function(bool keepSession) resetConversation,
    required TResult Function() stopGeneration,
    required TResult Function(Either<Failure, ChatMessage> result) streamUpdate,
    required TResult Function() streamCompleted,
  }) {
    return streamUpdate(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content)? sendMessage,
    TResult? Function(String prompt)? executePrompt,
    TResult? Function(bool keepSession)? resetConversation,
    TResult? Function()? stopGeneration,
    TResult? Function(Either<Failure, ChatMessage> result)? streamUpdate,
    TResult? Function()? streamCompleted,
  }) {
    return streamUpdate?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content)? sendMessage,
    TResult Function(String prompt)? executePrompt,
    TResult Function(bool keepSession)? resetConversation,
    TResult Function()? stopGeneration,
    TResult Function(Either<Failure, ChatMessage> result)? streamUpdate,
    TResult Function()? streamCompleted,
    required TResult orElse(),
  }) {
    if (streamUpdate != null) {
      return streamUpdate(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_ExecutePrompt value) executePrompt,
    required TResult Function(_ResetConversation value) resetConversation,
    required TResult Function(_StopGeneration value) stopGeneration,
    required TResult Function(_StreamUpdate value) streamUpdate,
    required TResult Function(_StreamCompleted value) streamCompleted,
  }) {
    return streamUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_ExecutePrompt value)? executePrompt,
    TResult? Function(_ResetConversation value)? resetConversation,
    TResult? Function(_StopGeneration value)? stopGeneration,
    TResult? Function(_StreamUpdate value)? streamUpdate,
    TResult? Function(_StreamCompleted value)? streamCompleted,
  }) {
    return streamUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_ExecutePrompt value)? executePrompt,
    TResult Function(_ResetConversation value)? resetConversation,
    TResult Function(_StopGeneration value)? stopGeneration,
    TResult Function(_StreamUpdate value)? streamUpdate,
    TResult Function(_StreamCompleted value)? streamCompleted,
    required TResult orElse(),
  }) {
    if (streamUpdate != null) {
      return streamUpdate(this);
    }
    return orElse();
  }
}

abstract class _StreamUpdate implements ChatEvent {
  const factory _StreamUpdate(final Either<Failure, ChatMessage> result) =
      _$StreamUpdateImpl;

  Either<Failure, ChatMessage> get result;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StreamUpdateImplCopyWith<_$StreamUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StreamCompletedImplCopyWith<$Res> {
  factory _$$StreamCompletedImplCopyWith(_$StreamCompletedImpl value,
          $Res Function(_$StreamCompletedImpl) then) =
      __$$StreamCompletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StreamCompletedImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$StreamCompletedImpl>
    implements _$$StreamCompletedImplCopyWith<$Res> {
  __$$StreamCompletedImplCopyWithImpl(
      _$StreamCompletedImpl _value, $Res Function(_$StreamCompletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StreamCompletedImpl implements _StreamCompleted {
  const _$StreamCompletedImpl();

  @override
  String toString() {
    return 'ChatEvent.streamCompleted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StreamCompletedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content) sendMessage,
    required TResult Function(String prompt) executePrompt,
    required TResult Function(bool keepSession) resetConversation,
    required TResult Function() stopGeneration,
    required TResult Function(Either<Failure, ChatMessage> result) streamUpdate,
    required TResult Function() streamCompleted,
  }) {
    return streamCompleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content)? sendMessage,
    TResult? Function(String prompt)? executePrompt,
    TResult? Function(bool keepSession)? resetConversation,
    TResult? Function()? stopGeneration,
    TResult? Function(Either<Failure, ChatMessage> result)? streamUpdate,
    TResult? Function()? streamCompleted,
  }) {
    return streamCompleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content)? sendMessage,
    TResult Function(String prompt)? executePrompt,
    TResult Function(bool keepSession)? resetConversation,
    TResult Function()? stopGeneration,
    TResult Function(Either<Failure, ChatMessage> result)? streamUpdate,
    TResult Function()? streamCompleted,
    required TResult orElse(),
  }) {
    if (streamCompleted != null) {
      return streamCompleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_ExecutePrompt value) executePrompt,
    required TResult Function(_ResetConversation value) resetConversation,
    required TResult Function(_StopGeneration value) stopGeneration,
    required TResult Function(_StreamUpdate value) streamUpdate,
    required TResult Function(_StreamCompleted value) streamCompleted,
  }) {
    return streamCompleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_ExecutePrompt value)? executePrompt,
    TResult? Function(_ResetConversation value)? resetConversation,
    TResult? Function(_StopGeneration value)? stopGeneration,
    TResult? Function(_StreamUpdate value)? streamUpdate,
    TResult? Function(_StreamCompleted value)? streamCompleted,
  }) {
    return streamCompleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_ExecutePrompt value)? executePrompt,
    TResult Function(_ResetConversation value)? resetConversation,
    TResult Function(_StopGeneration value)? stopGeneration,
    TResult Function(_StreamUpdate value)? streamUpdate,
    TResult Function(_StreamCompleted value)? streamCompleted,
    required TResult orElse(),
  }) {
    if (streamCompleted != null) {
      return streamCompleted(this);
    }
    return orElse();
  }
}

abstract class _StreamCompleted implements ChatEvent {
  const factory _StreamCompleted() = _$StreamCompletedImpl;
}
