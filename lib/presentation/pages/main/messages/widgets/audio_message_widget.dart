import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../../../../bloc/audio_player/audio_player_bloc.dart';
import 'duration_minutes_text.dart';
import 'seek_bar.dart';

class AudioMessageWidget extends StatefulWidget {
  const AudioMessageWidget({
    required this.message,
    required this.isSender,
    super.key,
  });

  final types.AudioMessage message;
  final bool isSender;

  @override
  State<AudioMessageWidget> createState() => _AudioMessageWidgetState();
}

class _AudioMessageWidgetState extends State<AudioMessageWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  void _handlePlayerAction(BuildContext context) {
    final message = widget.message;
    context
        .read<AudioPlayerBloc>()
        .add(AudioPlayerHandleActionRequested(message.id, message.uri));
  }

  void _handleSeek(BuildContext context, Duration duration) {
    context.read<AudioPlayerBloc>().add(AudioPlayerSeekRequested(duration));
  }

  Color _getProperOpaqueColor() {
    return widget.isSender ? Colors.white : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<AudioPlayerBloc, AudioPlayerState>(
      builder: (context, state) {
        final isInProgress = state is AudioPlayerInProgress &&
            state.playerId == widget.message.id;
        final isPlaying = isInProgress && state.state.playing;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            InkWell(
              onTap: () => _handlePlayerAction(context),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                color: _getProperOpaqueColor(),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SeekBar(
                  duration: widget.message.duration,
                  position: isInProgress ? state.position : Duration.zero,
                  onChanged: isInProgress ? (_) {} : null,
                  onChangeEnd: isInProgress
                      ? (value) => _handleSeek(context, value)
                      : null,
                ),
                const SizedBox(height: 4),
                if (isInProgress)
                  DurationMinutesText(
                    state.position,
                    color: _getProperOpaqueColor(),
                  )
                else
                  DurationMinutesText(
                    widget.message.duration,
                    color: _getProperOpaqueColor(),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
