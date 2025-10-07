// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<ChatMessage> messages, List<ChatMessage> currentConversation)
        loading,
    required TResult Function(List<ChatMessage> messages,
            List<ChatMessage> currentConversation, bool isStreaming)
        success,
    required TResult Function(Failure failure, List<ChatMessage> messages,
            List<ChatMessage> currentConversation)
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<ChatMessage> messages, List<ChatMessage> currentConversation)?
        loading,
    TResult? Function(List<ChatMessage> messages,
            List<ChatMessage> currentConversation, bool isStreaming)?
        success,
    TResult? Function(Failure failure, List<ChatMessage> messages,
            List<ChatMessage> currentConversation)?
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<ChatMessage> messages, List<ChatMessage> currentConversation)?
        loading,
    TResult Function(List<ChatMessage> messages,
            List<ChatMessage> currentConversation, bool isStreaming)?
        success,
    TResult Function(Failure failure, List<ChatMessage> messages,
            List<ChatMessage> currentConversation)?
        failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ChatState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<ChatMessage> messages, List<ChatMessage> currentConversation)
        loading,
    required TResult Function(List<ChatMessage> messages,
            List<ChatMessage> currentConversation, bool isStreaming)
        success,
    required TResult Function(Failure failure, List<ChatMessage> messages,
            List<ChatMessage> currentConversation)
        failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<ChatMessage> messages, List<ChatMessage> currentConversation)?
        loading,
    TResult? Function(List<ChatMessage> messages,
            List<ChatMessage> currentConversation, bool isStreaming)?
        success,
    TResult? Function(Failure failure, List<ChatMessage> messages,
            List<ChatMessage> currentConversation)?
        failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<ChatMessage> messages, List<ChatMessage> currentConversation)?
        loading,
    TResult Function(List<ChatMessage> messages,
            List<ChatMessage> currentConversation, bool isStreaming)?
        success,
    TResult Function(Failure failure, List<ChatMessage> messages,
            List<ChatMessage> currentConversation)?
        failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ChatState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<ChatMessage> messages, List<ChatMessage> currentConversation});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? currentConversation = null,
  }) {
    return _then(_$LoadingImpl(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      currentConversation: null == currentConversation
          ? _value._currentConversation
          : currentConversation // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(
      {final List<ChatMessage> messages = const <ChatMessage>[],
      final List<ChatMessage> currentConversation = const <ChatMessage>[]})
      : _messages = messages,
        _currentConversation = currentConversation;

  final List<ChatMessage> _messages;
  @override
  @JsonKey()
  List<ChatMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  final List<ChatMessage> _currentConversation;
  @override
  @JsonKey()
  List<ChatMessage> get currentConversation {
    if (_currentConversation is EqualUnmodifiableListView)
      return _currentConversation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currentConversation);
  }

  @override
  String toString() {
    return 'ChatState.loading(messages: $messages, currentConversation: $currentConversation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            const DeepCollectionEquality()
                .equals(other._currentConversation, _currentConversation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_messages),
      const DeepCollectionEquality().hash(_currentConversation));

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<ChatMessage> messages, List<ChatMessage> currentConversation)
        loading,
    required TResult Function(List<ChatMessage> messages,
            List<ChatMessage> currentConversation, bool isStreaming)
        success,
    required TResult Function(Failure failure, List<ChatMessage> messages,
            List<ChatMessage> currentConversation)
        failure,
  }) {
    return loading(messages, currentConversation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<ChatMessage> messages, List<ChatMessage> currentConversation)?
        loading,
    TResult? Function(List<ChatMessage> messages,
            List<ChatMessage> currentConversation, bool isStreaming)?
        success,
    TResult? Function(Failure failure, List<ChatMessage> messages,
            List<ChatMessage> currentConversation)?
        failure,
  }) {
    return loading?.call(messages, currentConversation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<ChatMessage> messages, List<ChatMessage> currentConversation)?
        loading,
    TResult Function(List<ChatMessage> messages,
            List<ChatMessage> currentConversation, bool isStreaming)?
        success,
    TResult Function(Failure failure, List<ChatMessage> messages,
            List<ChatMessage> currentConversation)?
        failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(messages, currentConversation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ChatState {
  const factory _Loading(
      {final List<ChatMessage> messages,
      final List<ChatMessage> currentConversation}) = _$LoadingImpl;

  List<ChatMessage> get messages;
  List<ChatMessage> get currentConversation;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<ChatMessage> messages,
      List<ChatMessage> currentConversation,
      bool isStreaming});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? currentConversation = null,
    Object? isStreaming = null,
  }) {
    return _then(_$SuccessImpl(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      currentConversation: null == currentConversation
          ? _value._currentConversation
          : currentConversation // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      isStreaming: null == isStreaming
          ? _value.isStreaming
          : isStreaming // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(
      {required final List<ChatMessage> messages,
      required final List<ChatMessage> currentConversation,
      this.isStreaming = false})
      : _messages = messages,
        _currentConversation = currentConversation;

  final List<ChatMessage> _messages;
  @override
  List<ChatMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  final List<ChatMessage> _currentConversation;
  @override
  List<ChatMessage> get currentConversation {
    if (_currentConversation is EqualUnmodifiableListView)
      return _currentConversation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currentConversation);
  }

  @override
  @JsonKey()
  final bool isStreaming;

  @override
  String toString() {
    return 'ChatState.success(messages: $messages, currentConversation: $currentConversation, isStreaming: $isStreaming)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            const DeepCollectionEquality()
                .equals(other._currentConversation, _currentConversation) &&
            (identical(other.isStreaming, isStreaming) ||
                other.isStreaming == isStreaming));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_messages),
      const DeepCollectionEquality().hash(_currentConversation),
      isStreaming);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<ChatMessage> messages, List<ChatMessage> currentConversation)
        loading,
    required TResult Function(List<ChatMessage> messages,
            List<ChatMessage> currentConversation, bool isStreaming)
        success,
    required TResult Function(Failure failure, List<ChatMessage> messages,
            List<ChatMessage> currentConversation)
        failure,
  }) {
    return success(messages, currentConversation, isStreaming);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<ChatMessage> messages, List<ChatMessage> currentConversation)?
        loading,
    TResult? Function(List<ChatMessage> messages,
            List<ChatMessage> currentConversation, bool isStreaming)?
        success,
    TResult? Function(Failure failure, List<ChatMessage> messages,
            List<ChatMessage> currentConversation)?
        failure,
  }) {
    return success?.call(messages, currentConversation, isStreaming);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<ChatMessage> messages, List<ChatMessage> currentConversation)?
        loading,
    TResult Function(List<ChatMessage> messages,
            List<ChatMessage> currentConversation, bool isStreaming)?
        success,
    TResult Function(Failure failure, List<ChatMessage> messages,
            List<ChatMessage> currentConversation)?
        failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(messages, currentConversation, isStreaming);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements ChatState {
  const factory _Success(
      {required final List<ChatMessage> messages,
      required final List<ChatMessage> currentConversation,
      final bool isStreaming}) = _$SuccessImpl;

  List<ChatMessage> get messages;
  List<ChatMessage> get currentConversation;
  bool get isStreaming;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Failure failure,
      List<ChatMessage> messages,
      List<ChatMessage> currentConversation});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
    Object? messages = null,
    Object? currentConversation = null,
  }) {
    return _then(_$FailureImpl(
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      currentConversation: null == currentConversation
          ? _value._currentConversation
          : currentConversation // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl(
      {required this.failure,
      final List<ChatMessage> messages = const <ChatMessage>[],
      final List<ChatMessage> currentConversation = const <ChatMessage>[]})
      : _messages = messages,
        _currentConversation = currentConversation;

  @override
  final Failure failure;
  final List<ChatMessage> _messages;
  @override
  @JsonKey()
  List<ChatMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  final List<ChatMessage> _currentConversation;
  @override
  @JsonKey()
  List<ChatMessage> get currentConversation {
    if (_currentConversation is EqualUnmodifiableListView)
      return _currentConversation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currentConversation);
  }

  @override
  String toString() {
    return 'ChatState.failure(failure: $failure, messages: $messages, currentConversation: $currentConversation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.failure, failure) || other.failure == failure) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            const DeepCollectionEquality()
                .equals(other._currentConversation, _currentConversation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      failure,
      const DeepCollectionEquality().hash(_messages),
      const DeepCollectionEquality().hash(_currentConversation));

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<ChatMessage> messages, List<ChatMessage> currentConversation)
        loading,
    required TResult Function(List<ChatMessage> messages,
            List<ChatMessage> currentConversation, bool isStreaming)
        success,
    required TResult Function(Failure failure, List<ChatMessage> messages,
            List<ChatMessage> currentConversation)
        failure,
  }) {
    return failure(this.failure, messages, currentConversation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<ChatMessage> messages, List<ChatMessage> currentConversation)?
        loading,
    TResult? Function(List<ChatMessage> messages,
            List<ChatMessage> currentConversation, bool isStreaming)?
        success,
    TResult? Function(Failure failure, List<ChatMessage> messages,
            List<ChatMessage> currentConversation)?
        failure,
  }) {
    return failure?.call(this.failure, messages, currentConversation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<ChatMessage> messages, List<ChatMessage> currentConversation)?
        loading,
    TResult Function(List<ChatMessage> messages,
            List<ChatMessage> currentConversation, bool isStreaming)?
        success,
    TResult Function(Failure failure, List<ChatMessage> messages,
            List<ChatMessage> currentConversation)?
        failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this.failure, messages, currentConversation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements ChatState {
  const factory _Failure(
      {required final Failure failure,
      final List<ChatMessage> messages,
      final List<ChatMessage> currentConversation}) = _$FailureImpl;

  Failure get failure;
  List<ChatMessage> get messages;
  List<ChatMessage> get currentConversation;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
