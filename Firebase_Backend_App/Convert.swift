import UIKit

class Convert: NSObject {
    
    
    class func stringToTime (inp: String ) -> Date
    {
        let dateFormatter = DateFormatter ()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
        let time : Date = dateFormatter.date(from: inp)!
        return time
    }
    
    class func timeToString (inp: Date) -> String
    {
        return String(describing: inp)
    }
}
