import UIKit
import Firebase

class ReadOnlineData: NSObject
{
    
    class func readContinues ()
    {
        if ( Auth.auth().currentUser == nil)
        {
            return
        }
        
        let userID = Auth.auth().currentUser?.uid;
        
        var myHandle : UInt = 0;
        
       myHandle =  AppData.sharedInstance.dataNode
            .child(userID!).observe(DataEventType.value) { (snapshot) in
                
                
                
                AppData.sharedInstance.dataNode
                    .child(userID!)
                    .removeObserver(withHandle: myHandle)
                
        }
    }
    
    
    // Games in UIVIEW
    // Games in Sprite Kit
    
    
    
    class func read()
    {
        if ( Auth.auth().currentUser == nil)
        {
            return
        }
        
        AppData.sharedInstance.onlineEntries = Array<EntryClass>()
        
        let userID = Auth.auth().currentUser?.uid;
        
        AppData.sharedInstance.dataNode
            .child(userID!)
            .observeSingleEvent(of: .value, with: { (snapshot) in
                
                let value = snapshot.value as? NSDictionary;
                
                if ( value == nil) {
                    return
                }
                
                
                
                for any in (value?.allValues)!
                {
                    let entry : [String : String] = any as! Dictionary <String, String>;
                    
                    let readTitle : String = entry["titleKey"]!;
                    let readBody : String = entry["bodyKey"]!;
                    let readTime : String = entry["timeKey"]!;
                    let readUid : String = entry["uidKey"]!;
                    
                    let readEntry = EntryClass (inpTitle: readTitle,
                                                inpBody: readBody,
                                                inpTime: Convert.stringToTime(inp:  readTime),
                                                inpUid: readUid);
                    
                    AppData.sharedInstance.onlineEntries.append(readEntry)
                    
                    print (AppData.sharedInstance.onlineEntries)
                }
            })
    }
}
