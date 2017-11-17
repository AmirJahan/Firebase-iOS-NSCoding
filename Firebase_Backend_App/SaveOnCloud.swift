
import UIKit
import Firebase

class SaveOnCloud: NSObject
{
    class func save (inpEntry: EntryClass)
    {
        if ( Auth.auth().currentUser == nil )
        {
            return
        }
        
        
       
        
        let entryDict = ["titleKey": inpEntry.title,
                         "bodyKey": inpEntry.body,
                         "timeKey": Convert.timeToString(inp:  inpEntry.time),
                         "uidKey" : inpEntry.uid]
        
        
        AppData.sharedInstance.dataNode
            .child(AppData.sharedInstance.curUser!.uid)
            .child(inpEntry.uid)
            .setValue(entryDict)
    }
}
