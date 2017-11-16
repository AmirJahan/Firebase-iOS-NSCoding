import UIKit
import Firebase

class LoginClass: NSObject
{
    class func loginAlert (inpView: UIViewController)
    {
        let loginAlert = UIAlertController(title: "Login",
                                           message: "Please enter email and apssword",
                                           preferredStyle: UIAlertControllerStyle.alert)
        
        loginAlert.addTextField
            { (textFld) in
                textFld.placeholder = "email"
                textFld.textAlignment = NSTextAlignment.center
                textFld.font = UIFont.systemFont(ofSize: 22)
        }
        
        
        loginAlert.addTextField
            { (textFld) in
                textFld.placeholder = "password"
                textFld.isSecureTextEntry = true
                textFld.textAlignment = NSTextAlignment.center
                textFld.font = UIFont.systemFont(ofSize: 22)
        }
        
        
        loginAlert.addAction(UIAlertAction(title: "Login",
                                           style: UIAlertActionStyle.default,
                                           handler:
            { (alert) in
                
                self.loginMethod(inpView: inpView,
                                 inpEmail: (loginAlert.textFields?[0].text)!,
                                 inpPassword: (loginAlert.textFields?[1].text)!)
                
        }))
        
        loginAlert.addAction(UIAlertAction(title: "Cancel",
                                           style: UIAlertActionStyle.cancel,
                                           handler: nil))
        inpView.present(loginAlert, animated: true, completion: nil)
    }
    
    
    class func loginMethod (inpView: UIViewController, inpEmail: String, inpPassword: String)  {
        
        Auth.auth().signIn(withEmail: inpEmail,
                           password: inpPassword)
        { (user, error) in
            if (error == nil)
            {
                AppData.sharedInstance.curUser = UserClass(name: user!.displayName!,
                                                           email: user!.email!,
                                                           uid: user!.uid)
                
                AlertShow.show(inpView: inpView,
                               titleStr: "Success",
                               messageStr: "You have logged in sucessfully");
                
                ReadAll.readData(inpView: inpView);
            }
            else
            {
                AlertShow.show(inpView: inpView, titleStr: "Failed", messageStr: error.debugDescription);
            }
        }
    }
    
}
