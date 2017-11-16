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

        // online stuff
        if ( Auth.auth().currentUser != nil)
        {
            ReadOnlineData.read()

            
            // combine
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1),
                                          execute:
                {
                    AppData.sharedInstance.curEntries = AppData.sharedInstance.onlineEntries;

            });
            
           

        }
    }

}
