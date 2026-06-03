# API Reference: chat_page

Source file: `lib/core/presentation/pages/chat/chat/chat_page.dart`

## Classes

### class `ChatPage`

## Whitelisted API Endpoints

### `ChatPage({super.key, required this.roleId, required this.name}); @override ConsumerState<ChatPage> createState() => _ChatPageState(); } class _ChatPageState extends ConsumerState<ChatPage> { final FirebaseFirestore _fireStore = FirebaseFirestore.instance; ScrollController scrollController = ScrollController(); @override void initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: CustomScaffold( appBar: (colors) => AppBar( elevation: 0, backgroundColor: colors.icon, leading: IconButton( splashRadius: 18.r, onPressed: context.maybePop, icon: Icon( isLtr ? FlutterRemix.arrow_left_s_line : FlutterRemix.arrow_right_s_line, size: 24.r, color: colors.textBlack, ), ), title: Text( widget.name, style: GoogleFonts.inter( fontWeight: FontWeight.w600, fontSize: 14, color: colors.textBlack, letterSpacing: -0.4, ), ), ), body: (colors) => Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Center(child: CircularProgressIndicator( strokeWidth: 3.r, color: colors.primary, ), ); } final List<DocumentSnapshot> docs = snapshot.data!.docs; final List<ChatMessageData> messages = docs.map(( doc,)`
*No documentation provided (generation failed).*

### `ChatMessageData(messageOwner: data['sender'] == 0 ? MessageOwner.partner : MessageOwner.you, message: data['chat_content'], time: '${date.hour}:${date.minute}', date: date, ); }).toList(); messages.sort((a, b) => b.date.compareTo(a.date)); return ListView.builder( itemCount: messages.length, reverse: true, controller: scrollController, padding: REdgeInsets.only( bottom: 87, top: 20, left: 15, right: 15, ), physics: const BouncingScrollPhysics(), itemBuilder: (context, index)`
*No documentation provided (generation failed).*
