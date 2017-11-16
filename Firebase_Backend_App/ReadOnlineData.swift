import UIKit
import Firebase

class ReadOnlineData: NSObject
{
    class func read()
    {
        if ( Auth.auth().currentUser == nil) {
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
//
//
                    let readTitle : String = entry["titleKey"]!;
                    let readBody : String = entry["bodyKey"]!;

                    let readEntry = EntryClass (inpTitle: readTitle, inpBody: readBody);

                    AppData.sharedInstance.onlineEntries.append(readEntry)

                    print (AppData.sharedInstance.onlineEntries)
                }
            })
    }
}
