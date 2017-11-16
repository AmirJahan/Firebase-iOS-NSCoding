import UIKit
import Firebase

class DeleteFromCloud: NSObject
{
    class func deleteEntry (inpEntry: EntryClass)
    {
        if (Auth.auth().currentUser == nil)
        {
            return
        }
        
        let uid: String = Auth.auth().currentUser!.uid
        
        let deleteNode : DatabaseReference = AppData.sharedInstance.dataNode
            .child(uid)
            .child(inpEntry.title);
        
        deleteNode.removeValue();
    }
}
