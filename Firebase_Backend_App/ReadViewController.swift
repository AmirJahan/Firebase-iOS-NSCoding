import UIKit

class ReadViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var entriesTableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        entriesTableView.delegate = self;
        entriesTableView.dataSource = self;
        
        dump(AppData.sharedInstance.curEntries)
        
        entriesTableView.refreshControl = UIRefreshControl();
        entriesTableView.refreshControl?.backgroundColor = UIColor.orange;
       
        entriesTableView.refreshControl?.addTarget(self,
                                                   action:#selector(refresh),
                                                   for: UIControlEvents.valueChanged)
    }
    
    @objc func refresh ()
    {
        ReadAll.readData(inpView: self)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1),
                                      execute:
            {
                self.entriesTableView.reloadData();
                
                self.entriesTableView.refreshControl?.endRefreshing();
        });
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
         return AppData.sharedInstance.curEntries.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath);
        
        cell.textLabel?.text = AppData.sharedInstance.curEntries[indexPath.row].title;
        
        return cell;
        
    }
    
    
    
    
    
    
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        titleLabel.text = AppData.sharedInstance.curEntries[indexPath.row].title;
        bodyTextView.text = AppData.sharedInstance.curEntries[indexPath.row].body;
    }
    
    
    
    
    
    
    

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true;
    }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCellEditingStyle,
                   forRowAt indexPath: IndexPath)
    {
        let thisEntry: EntryClass = AppData.sharedInstance.curEntries[indexPath.row];
        
        AppData.sharedInstance.curEntries.remove(at: indexPath.row);
        DeleteFromCloud.deleteEntry(inpEntry: thisEntry);
        ReadWrite.writeData()
        
        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
    }

}
