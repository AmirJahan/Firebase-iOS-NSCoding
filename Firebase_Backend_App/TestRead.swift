import UIKit
import Firebase

class TestRead: NSObject
{
    class func read()
    {
        if ( Auth.auth().currentUser == nil)
        {
            return
        }
        
        AppData.sharedInstance.onlineEntries = Array<EntryClass>()
        
        let userID = Auth.auth().currentUser?.uid;
        
        var handle: UInt = 0
        
        handle = AppData.sharedInstance.dataNode.child(userID!).observe(DataEventType.value, with: { (snapshot) in
            
            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            
            dump (postDict);
            // ...
        })
        
        AppData.sharedInstance.dataNode.child(userID!).removeObserver(withHandle: handle)
        
        
    }

}
