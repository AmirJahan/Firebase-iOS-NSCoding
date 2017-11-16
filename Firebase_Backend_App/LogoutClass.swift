import UIKit
import Firebase

class LogoutClass: NSObject
{
    class func logoutMethod (inpView: UIViewController)
    {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            
            AlertShow.show(inpView: inpView,
                           titleStr: "Logged Out",
                           messageStr: "You can still work offline")
            
            ReadAll.readData(inpView: inpView)
        }
        catch _ as NSError
        {
            
        }
    }
}
