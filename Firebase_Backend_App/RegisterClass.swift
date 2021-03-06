import UIKit
import Firebase

class RegisterClass: NSObject
{
    class func registerAlert (inpView: UIViewController)
    {
        let regAlert = UIAlertController(title: "Register",
                                         message: "Please enter name, email and apssword",
                                         preferredStyle: UIAlertControllerStyle.alert)
        
        regAlert.addTextField { (textFld) in
            textFld.placeholder = "name"
            textFld.textAlignment = NSTextAlignment.center
            textFld.font = UIFont.systemFont(ofSize: 22)
        }
        
        regAlert.addTextField { (textFld) in
            textFld.placeholder = "email"
            textFld.textAlignment = NSTextAlignment.center
            textFld.font = UIFont.systemFont(ofSize: 22)
        }
        
        regAlert.addTextField { (textFld) in
            textFld.placeholder = "password"
            textFld.isSecureTextEntry = true
            textFld.textAlignment = NSTextAlignment.center
            textFld.font = UIFont.systemFont(ofSize: 22)
        }
        
        regAlert.addAction(UIAlertAction(title: "Register",
                                         style: UIAlertActionStyle.default,
                                         handler:
            { (alert) in
                self.registerMethod(inpView: inpView,
                                    inpName: (regAlert.textFields?[0].text)!,
                                    inpEmail: (regAlert.textFields?[1].text)!,
                                    inpPassword: (regAlert.textFields?[2].text)!)
        }))
        
        regAlert.addAction(UIAlertAction(title: "Cancel",
                                         style: UIAlertActionStyle.cancel,
                                         handler: nil))
        
        inpView.present(regAlert, animated: true, completion: nil)
    }
    
    
    class func registerMethod(inpView: UIViewController, inpName: String, inpEmail: String, inpPassword: String)
    {
        Auth.auth().createUser   (withEmail: inpEmail,
                               password: inpPassword)
        { (onlineUser, error) in
            if ( error == nil)
            {
                let changeRequest = onlineUser?.createProfileChangeRequest()
                changeRequest?.displayName = inpName
                
                changeRequest?.commitChanges(completion:
                    { (profError) in
                        if ( profError == nil)
                        {
           
                            // setting local user
                            AppData.sharedInstance.curUser = UserClass(name: onlineUser!.displayName!,
                                                                       email: onlineUser!.email!,
                                                                       uid: onlineUser!.uid);
                            
                            
                            
                            
                            

                            let userDict : [String : String] = ["nameKey": onlineUser!.displayName!,
                                                                "emailKey": onlineUser!.email!,
                                                                "uidKey": onlineUser!.uid]
                            
                            AppData.sharedInstance.usersNode
                                .child(onlineUser!.uid)
                                .setValue(userDict)

                            ReadWrite.writeUser();
                            
                       
                            AppData.sharedInstance.offlineEntries = Array<EntryClass>();
                            AppData.sharedInstance.curEntries = Array<EntryClass>();
                            
                            AlertShow.show(inpView: inpView,
                                           titleStr: "Success",
                                           messageStr: "You are now registered on the server")
                        }
                })
            }
            else
            {
                AlertShow.show(inpView: inpView, titleStr: "Error", messageStr: error.debugDescription);
            }
        }
    }
}
