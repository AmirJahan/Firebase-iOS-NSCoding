
import UIKit
import Firebase

class WriteViewController: UIViewController
{
    
    @IBOutlet weak var titleTextFld: UITextField!
    @IBOutlet weak var bodyTextViw: UITextView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    
    @IBAction func saveFunction(_ sender: Any)
    {
        
        let uniqueEntryId: String = AppData.sharedInstance.curUser!.uid +
            "|" +
            Convert.timeToString(inp:  Date());
        
        
        let newEntry: EntryClass = EntryClass (inpTitle: titleTextFld.text!,
                                               inpBody: bodyTextViw.text,
                                               inpTime: Date(),
                                               inpUid: uniqueEntryId)
        AppData.sharedInstance.curEntries.append(newEntry);
        
        titleTextFld.text = "";
        bodyTextViw.text = "";
      
        ReadWrite.writeData();
        SaveOnCloud.save(inpEntry: newEntry)

    }
}
