
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
                         "bodyKey": inpEntry.body]
        
        AppData.sharedInstance.dataNode
            .child(AppData.sharedInstance.curUser!.uid)
            .child(inpEntry.title!)
            .setValue(entryDict)
    }
}
