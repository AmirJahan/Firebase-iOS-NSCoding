import UIKit

class EntryClass: NSObject , NSCoding
{
    var title: String!
    var body: String!
    
    init(inpTitle: String, inpBody: String)
    {
        
        title = inpTitle
        body = inpBody
    }
    
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(self.title, forKey: "titleKey")
        aCoder.encode(self.body, forKey: "bodyKey")
    }
    
    required convenience init?(coder aDecoder: NSCoder)
    {
        let readTitle = aDecoder.decodeObject(forKey: "titleKey") as! String
        let readBody = aDecoder.decodeObject(forKey: "bodyKey") as! String
        
        self.init(inpTitle: readTitle, inpBody: readBody)
    }
}
