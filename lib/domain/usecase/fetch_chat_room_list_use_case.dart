import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_module.dart';

@injectable
class FetchChatRoomListUseCase {
  FetchChatRoomListUseCase(this._service);

  final ChatService _service;

  Future<Stream<List<Room>>> call(String userId) =>
      _service.fetchRoomList(userId);
}
