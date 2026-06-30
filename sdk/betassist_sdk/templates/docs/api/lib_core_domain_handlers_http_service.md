# API Reference: http_service

Source file: `lib/core/domain/handlers/http_service.dart`

## Classes

### class `HttpService`
Base URL loaded from dart-define environment — never hardcoded.
Pass at build time: --dart-define=BETASSIST_BASE_URL=https://your-backend.com
const String _baseUrl = String.fromEnvironment(
'BETASSIST_BASE_URL',
defaultValue: 'https://api.betassist.local',
);
