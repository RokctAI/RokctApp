# API Reference: chat_notifier

Source file: `lib/core/application/chat/chat_notifier.dart`

## Classes

### class `ChatNotifier`

## Whitelisted API Endpoints

### `build() => ChatState(textController: TextEditingController()); String roleId = ""; Future<void> fetchChats(BuildContext context, String roleId) async { state = state.copyWith(isLoading: true); roleId = roleId; final userId = LocalStorage.getUser()?.id; QuerySnapshot? query; try { query = await _fireStore .collection('chats') .where('user.id', isEqualTo: userId) .where("roleId", isEqualTo: roleId) .get(); } catch (e)`
*No documentation provided (generation failed).*

### `sendMessage() async { if (state.textController?.text.trim().isNotEmpty ?? false)`
*No documentation provided (generation failed).*
