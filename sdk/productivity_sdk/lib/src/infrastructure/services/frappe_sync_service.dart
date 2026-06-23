/// A placeholder service indicating where the Frappe backend synchronization
/// logic should be implemented.
///
/// Once the [auth_sdk] or [users_sdk] provides a valid session, this service
/// can be used to synchronize the local SharedPreferences tasks with the Frappe
/// backend (e.g., via REST or GraphQL).
abstract class FrappeSyncService {
  /// Fetches the latest tasks from the Frappe backend and merges them with
  /// the local state.
  Future<void> syncDown();

  /// Pushes any pending local changes (creations, updates, deletions) to the
  /// Frappe backend.
  Future<void> syncUp(List<Map<String, dynamic>> localTasks);

  /// Helper to determine if a full bi-directional sync is needed.
  Future<void> performFullSync(List<Map<String, dynamic>> localTasks) async {
    await syncDown();
    await syncUp(localTasks);
  }
}
