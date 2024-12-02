import 'package:call_log/call_log.dart';

class CallLogs{


static Future<Iterable<CallLogEntry>>fetchAllCallLogs()async{
  try {
     return
  await CallLog.get();
  
  } catch (e) {
    throw e.toString();
  }
 
}

 static String?getTile(CallLogEntry entry){
  if (entry.name!=null) {
    return entry.name;    
  } else{
    return entry.number;
  }
}
}
