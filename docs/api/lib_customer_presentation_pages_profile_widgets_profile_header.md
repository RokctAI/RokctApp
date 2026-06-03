# API Reference: profile_header

Source file: `lib/customer/presentation/pages/profile/widgets/profile_header.dart`

## Classes

### class `ProfileHeader`

## Whitelisted API Endpoints

### `ProfileHeader({ super.key, required this.userData, required this.onLogout, required this.colors, }); bool get _isAuthenticated => LocalStorage.getToken().isNotEmpty; @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `CommonAppBar(child: Row( crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ Expanded( child: GestureDetector( onTap: !_isAuthenticated ? () => context.pushRoute(const LoginRoute()) : null, child: Row( crossAxisAlignment: CrossAxisAlignment.end, children: [ _buildAvatar(), 12.horizontalSpace, Expanded(child: _buildUserInfo()), ], ), ), ), _buildActionButton(context), ], ), ); } Widget _buildAvatar()`
*No documentation provided (generation failed).*

### `SizedBox(height: 40.r, width: 40.r, child: _isAuthenticated ? CustomNetworkImage( profile: true, url: userData?.img ?? "", height: 40.r, width: 40.r, radius: 30.r, ) : Container( decoration: BoxDecoration( color: AppStyle.bgGrey, shape: BoxShape.circle, ), child: Icon( FlutterRemix.user_line, color: AppStyle.textGrey, size: 24.r, ), ), ); } Widget _buildUserInfo()`
*No documentation provided (generation failed).*

### `Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.end, children: [ Text( _isAuthenticated ? "${userData?.firstname ?? ""} ${userData?.lastname ?? ""}" : AppHelpers.getTranslation(TrKeys.guest), style: AppStyle.interNormal(size: 14, color: colors.textBlack), maxLines: 1, ), Text( _isAuthenticated ? (userData?.email ?? " ") : AppHelpers.getTranslation(TrKeys.tapToSignIn), style: AppStyle.interRegular(size: 12, color: AppStyle.textGrey), maxLines: 1, overflow: TextOverflow.ellipsis, ), ], ); } Widget _buildActionButton(BuildContext context)`
*No documentation provided (generation failed).*

### `IconButton(onPressed: ()`
*No documentation provided (generation failed).*
