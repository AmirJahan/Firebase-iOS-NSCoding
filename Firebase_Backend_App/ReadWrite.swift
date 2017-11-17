import UIKit

class ReadWrite: NSObject
{
    static let docsURL = try! FileManager.default.url(for: .documentDirectory,
                                                      in: .userDomainMask,
                                                      appropriateFor: nil,
                                                      create: true)
    // docsURL/data.plist
    static let dataPath = docsURL.appendingPathComponent("data.plist").path
    static let userPath = docsURL.appendingPathComponent("user.plist").path
    
    
    
    class func writeData ()
    {
        print(dataPath)
        
        NSKeyedArchiver.archiveRootObject(AppData.sharedInstance.curEntries,
                                          toFile: dataPath)
    }
    
    class func readData ()  {
        if let readData = NSKeyedUnarchiver.unarchiveObject(withFile: dataPath)
            as? Array <EntryClass>
        {
            AppData.sharedInstance.offlineEntries = readData;
        }
    }
    
    
    
    
    class func writeUser ()
    {
        print(userPath)
        NSKeyedArchiver.archiveRootObject(AppData.sharedInstance.curUser!,
                                          toFile: userPath)
    }
    
    class func readUser ()
    {
        if let readUser = NSKeyedUnarchiver.unarchiveObject(withFile: userPath)
            as? UserClass
        {
            AppData.sharedInstance.curUser = readUser
        }
    }
}
