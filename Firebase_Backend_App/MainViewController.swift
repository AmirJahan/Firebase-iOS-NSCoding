import UIKit
import Firebase
class MainViewController: UIViewController
{
    
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        ReadAll.readData(inpView: self);
        
       ReadOnlineData.readContinues()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        refreshView()
    }
    
    func refreshView ()
    {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1),
                                      execute:
            {
                if ( Auth.auth().currentUser == nil)
                {
                    self.logoutButton.backgroundColor = UIColor.darkGray;
                    self.logoutButton.isEnabled = false;
                    
                    self.loginButton.isEnabled = true;
                    self.loginButton.backgroundColor = UIColor.green;
                    
                    self.registerButton.isEnabled = true;
                    self.registerButton.backgroundColor = UIColor.green;
                    
                }
                else
                {
                    self.logoutButton.backgroundColor = UIColor.green;
                    self.logoutButton.isEnabled = true;
                    
                    self.loginButton.isEnabled = false;
                    self.loginButton.backgroundColor = UIColor.darkGray;
                    
                    self.registerButton.isEnabled = false;
                   self.registerButton.backgroundColor = UIColor.darkGray;
                }
        });
    }
    
    
    @IBAction func loginAction(_ sender: Any)
    {
        LoginClass.loginAlert(inpView: self);
    }
    
    @IBAction func registerAction(_ sender: Any)
    {
        RegisterClass.registerAlert(inpView: self);
    }
    
    
    @IBAction func logoutAction(_ sender: Any)
    {
        LogoutClass.logoutMethod(inpView: self);
    }
    
}
