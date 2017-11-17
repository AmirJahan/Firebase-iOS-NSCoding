import UIKit

class EntryClass: NSObject , NSCoding
{
    var title: String!
    var body: String!
    var time: Date!
    var uid: String!

    
    init(inpTitle: String, inpBody: String, inpTime: Date, inpUid: String)
    {
        title = inpTitle
        body = inpBody
        time = inpTime
        uid = inpUid
    }
    
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(self.title, forKey: "titleKey")
        aCoder.encode(self.body, forKey: "bodyKey")
        aCoder.encode(self.uid, forKey: "uidKey")
        aCoder.encode(Convert.timeToString(inp: self.time), forKey: "timeKey")
    }
    
    required convenience init?(coder aDecoder: NSCoder)
    {
        let readTitle = aDecoder.decodeObject(forKey: "titleKey") as! String
        let readBody = aDecoder.decodeObject(forKey: "bodyKey") as! String
        let readTime = aDecoder.decodeObject(forKey: "timeKey") as! String
        
        
        let readUid = aDecoder.decodeObject(forKey: "uidKey") as! String

        
        self.init(inpTitle: readTitle,
                  inpBody: readBody,
                  inpTime: Convert.stringToTime(inp: readTime),
                  inpUid: readUid)
    }
}
