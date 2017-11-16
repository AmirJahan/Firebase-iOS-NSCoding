
import UIKit

class WriteViewController: UIViewController {
    
    @IBOutlet weak var titleTextFld: UITextField!
    @IBOutlet weak var bodyTextViw: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveFunction(_ sender: Any) {
        
        let newEntry: EntryClass = EntryClass (inpTitle: titleTextFld.text!,
                                               inpBody: bodyTextViw.text);
        
        AppData.sharedInstance.curEntries.append(newEntry);
        ReadWrite.writeData();
        SaveOnCloud.save(inpEntry: newEntry);
        
        titleTextFld.text = "";
        bodyTextViw.text = "";
    }
}
