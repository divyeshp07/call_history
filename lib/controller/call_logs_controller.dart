import 'package:call_log/call_log.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logs/services/call_log_fetching_services.dart';

final callLogsProvider = FutureProvider<Iterable<CallLogEntry>>((ref) async {
  return CallLogs.fetchAllCallLogs();
});