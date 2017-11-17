import Foundation
import Firebase
import FirebaseDatabase

class AppData: NSObject {
    
    static let sharedInstance = AppData();
    
    public var curUser: UserClass!
    
    
    public var curEntries : Array <EntryClass> = Array <EntryClass> ()
    

    
    public var offlineEntries : Array <EntryClass> = Array <EntryClass> ()
    public var onlineEntries : Array <EntryClass> = Array <EntryClass> ()



    public var dataNode: DatabaseReference;
    public var usersNode: DatabaseReference;
    

    public override init()
    {
        FirebaseApp.configure();
        

        dataNode = Database.database().reference().child("data");
        usersNode = Database.database().reference().child("users");
    }
    
    
    

}
