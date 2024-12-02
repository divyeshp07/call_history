
// import 'package:call_log/call_log.dart'; 
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:logs/controller/call_logs_controller.dart';

// class CallLogPage extends ConsumerWidget {
//   const CallLogPage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final data = ref.watch(callLogsProvider.future);

//     return Scaffold(
//       appBar: AppBar(title: const Text('Call Logs')),
//       body: FutureBuilder<Iterable<CallLogEntry>>(
//         future: data,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           } else if (snapshot.hasData) {
//             final entries = snapshot.data;

//             if (entries == null || entries.isEmpty) {
//               return const Center(
//                 child: Text('No call logs available.'),
//               );
//             }

//             return ListView.builder(
//               itemCount: entries.length,
//               itemBuilder: (context, index) {
//                 final entry = entries.elementAt(index);

//                 return ListTile(
//                   title: Text(
//                     entry.name?.isNotEmpty == true
//                         ? entry.name!
//                         : 'Unknown',
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   subtitle: Text(
//                     entry.number ?? 'No number',
//                   ),
//                   trailing: Text('${entry.duration} sec'),
//                 );
//               },
//             );
//           } else {
//             return const Center(
//               child: Text('No data found.'),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logs/controller/call_logs_controller.dart';
import 'details_page.dart';

class CallLogPage extends ConsumerWidget {
  const CallLogPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(callLogsProvider.future);

    return Scaffold(
      appBar: AppBar(title: const Text('Call Logs')),
      body: FutureBuilder<Iterable<CallLogEntry>>(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            final entries = snapshot.data;

            if (entries == null || entries.isEmpty) {
              return const Center(
                child: Text('No call logs available.'),
              );
            }

            return ListView.builder(
              itemCount: entries.length,
              itemBuilder: (context, index) {
                final entry = entries.elementAt(index);

                return ListTile(
                  title: Text(
                    entry.name?.isNotEmpty == true
                        ? entry.name!
                        : 'Unknown',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(entry.number ?? 'No number'),
                  trailing: Text('${entry.duration} sec'),
                  onTap: () {
                    // Navigate to details page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(entry: entry),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const Center(
              child: Text('No data found.'),
            );
          }
        },
      ),
    );
  }
}
