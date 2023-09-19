import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint_core/mint_bloc.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/fonts.gen.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../bloc/audio_record/audio_record_bloc.dart';
import '../../../../widgets/svg_icon_widget.dart';

class ChatBottomBar extends StatefulWidget {
  const ChatBottomBar({
    required this.controller,
    required this.focusNode,
    required this.onSend,
    required this.onEmoji,
    required this.onAttach,
    required this.onAudioStop,
    super.key,
    this.isEmojiSelected = false,
    this.onTextFieldTap,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onSend;
  final VoidCallback onEmoji;
  final void Function(GlobalKey) onAttach;
  final void Function(String audioPath, Duration duration) onAudioStop;
  final bool isEmojiSelected;
  final VoidCallback? onTextFieldTap;

  @override
  State<ChatBottomBar> createState() => _ChatBottomBarState();
}

class _ChatBottomBarState extends State<ChatBottomBar> {
  late final TextEditingController _textController;
  bool _isSendButtonVisible = false;

  @override
  void initState() {
    super.initState();
    _textController = widget.controller;
    _isSendButtonVisible = _textController.text.trim() != '';
    _textController.addListener(_handleSendVisibility);
  }

  void _audioRecordBlocListener(BuildContext context, AudioRecordState state) {
    if (state is AudioRecordCompleteSuccess) {
      context
          .read<ChatBloc>()
          .add(ChatSaveAudioRequested(state.audioPath, state.duration));
    }
  }

  void _handleSendVisibility() {
    setState(() {
      _isSendButtonVisible = _textController.text.trim() != '';
    });
  }

  void _startRecord() {
    context.read<AudioRecordBloc>().add(AudioRecordStartRequested());
  }

  void _stopRecord() {
    context.read<AudioRecordBloc>().add(AudioRecordStopRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AudioRecordBloc, AudioRecordState>(
      listener: _audioRecordBlocListener,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Row(
            children: <Widget>[
              if (state is! AudioRecordInProgress)
                Expanded(
                  child: _ChatToolbar(
                    messageController: _textController,
                    messageFocusNode: widget.focusNode,
                    onAttachTap: widget.onAttach,
                    onSendTap: widget.onSend,
                    onEmojiTap: widget.onEmoji,
                    onTextFieldTap: widget.onTextFieldTap,
                    isEmojiSelected: widget.isEmojiSelected,
                    isSendButtonVisible: _isSendButtonVisible,
                  ),
                )
              else ...[
                const Spacer(),
                _DurationMinutesText(
                  state.progress,
                  color: Colors.black,
                ),
              ],
              Offstage(
                offstage: state is! AudioRecordInProgress,
                child: IconButton(
                  onPressed: _stopRecord,
                  icon: Icon(
                    Icons.stop_circle_rounded,
                    color: Theme.of(context).colorScheme.primary,
                    size: 24,
                  ),
                ),
              ),
              Offstage(
                // TODO(wuffeel): switch on audio record
                offstage: state is AudioRecordInProgress,
                child: IconButton(
                  onPressed: _startRecord,
                  icon: SvgIconWidget(
                    Assets.svg.microphoneIcon,
                    color: Theme.of(context).hintColor.withOpacity(0.6),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ChatToolbar extends StatefulWidget {
  const _ChatToolbar({
    required this.messageController,
    required this.messageFocusNode,
    required this.onAttachTap,
    required this.onSendTap,
    required this.onEmojiTap,
    required this.isEmojiSelected,
    required this.isSendButtonVisible,
    this.onTextFieldTap,
  });

  final TextEditingController messageController;
  final FocusNode messageFocusNode;
  final void Function(GlobalKey) onAttachTap;
  final VoidCallback onSendTap;
  final VoidCallback onEmojiTap;
  final bool isEmojiSelected;
  final bool isSendButtonVisible;
  final VoidCallback? onTextFieldTap;

  @override
  State<_ChatToolbar> createState() => _ChatToolbarState();
}

class _ChatToolbarState extends State<_ChatToolbar> {
  final _attachKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          key: _attachKey,
          onPressed: () => widget.onAttachTap(_attachKey),
          icon: SvgIconWidget(
            Assets.svg.attachIcon,
            color: Theme.of(context).hintColor.withOpacity(0.6),
          ),
        ),
        Expanded(
          child: TextFormField(
            onFieldSubmitted: (text) {
              if (text.isNotEmpty) widget.onSendTap();
            },
            onTap: widget.onTextFieldTap,
            controller: widget.messageController,
            focusNode: widget.messageFocusNode,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(40),
              ),
              filled: true,
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              hoverColor: Colors.transparent,
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: IconButton(
                      onPressed: widget.onEmojiTap,
                      constraints: const BoxConstraints(),
                      icon: SvgIconWidget(
                        Assets.svg.emojiIcon,
                        color: widget.isEmojiSelected
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).hintColor.withOpacity(0.6),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.isSendButtonVisible,
                    maintainAnimation: true,
                    maintainState: true,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: widget.isSendButtonVisible ? 1 : 0,
                      child: IconButton(
                        constraints: const BoxConstraints(),
                        onPressed: widget.onSendTap,
                        icon: Icon(
                          Icons.send,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              hintText: context.l10n.message,
            ),
            style: const TextStyle(
              fontFamilyFallback: [MintFontFamily.notoColorEmoji],
            ),
          ),
        ),
      ],
    );
  }
}

class _DurationMinutesText extends StatelessWidget {
  const _DurationMinutesText(
    this.duration, {
    required this.color,
  });

  final Duration duration;
  final Color color;

  String _getTimeDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _getTimeDuration(duration),
      style: TextStyle(fontSize: 14, color: color),
    );
  }
}
