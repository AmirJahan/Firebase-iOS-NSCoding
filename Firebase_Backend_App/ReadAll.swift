import UIKit
import Firebase

class ReadAll: NSObject {
    
    class func readData (inpView: UIViewController)
    {
        ReadWrite.readUser();

        if ( AppData.sharedInstance.curUser == nil)
        {
            RegisterClass.registerAlert(inpView: inpView);
        }
        else
        {
            ReadWrite.readData();
            AppData.sharedInstance.curEntries = AppData.sharedInstance.offlineEntries;
        }

        // up until here, it's all offline
        

        
        // online stuff
        if ( Auth.auth().currentUser != nil)
        {
            ReadOnlineData.read() // this takes a whi;e
            
            // combine
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1),
                                          execute:
            {
                AppData.sharedInstance.curEntries =
                    CompareEntries.compare(inpA: AppData.sharedInstance.offlineEntries,
                                           inpB: AppData.sharedInstance.onlineEntries)
                
                ReadWrite.writeData()
                
                for any : EntryClass in AppData.sharedInstance.curEntries
                {
                    SaveOnCloud.save(inpEntry: any)
                }
            });
        }
    }
}
