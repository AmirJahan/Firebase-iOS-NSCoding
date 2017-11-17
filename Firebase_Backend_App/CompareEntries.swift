import UIKit

class CompareEntries: NSObject {
    
    class func compare(inpA:Array<EntryClass>, inpB: Array<EntryClass>) -> Array<EntryClass>
    {
        var combinedArray: Array<EntryClass> = Array<EntryClass>();
        
        var listA: Array<EntryClass> = inpA;
        var listB: Array<EntryClass> = inpB;
        
 
        
        // first, if there is a list in one that is not in other, just copy it
        for a : EntryClass in listA {
            var aIsUnique: Bool = true;
            for anyList : EntryClass in listB
            {
                if(a.title == anyList.title)
                {
                    aIsUnique = false;
                }
            }
            // if a is still unique
            if ( aIsUnique)
            {
                combinedArray.append(a);
            }
        }
        
        // do the same for list B
        for b : EntryClass in listB {
            var bIsUnique: Bool = true;
            for anyList : EntryClass in listA
            {
                if(b.title == anyList.title)
                {
                    bIsUnique = false;
                }
            }
            // if b is still unique
            if ( bIsUnique)
            {
                combinedArray.append(b);
            }
        }
        

        
        
        // now remove the unique ones and those added from each of the two lists
        for any: EntryClass in combinedArray
        {
            if let ind = listA.index ( where:
                { (item:EntryClass) -> Bool in
                item.title == any.title
            })
            {
                listA.remove(at: ind);
            }
            
            if let ind = listB.index(where: { (item:EntryClass) -> Bool in
                item.title == any.title
            })
            {
                listB.remove(at: ind);
            }
        }
        
   
        
        
        // then let's find the entries with the same name
        for anyEntryA:EntryClass in listA
        {
            for anyEntryB : EntryClass in listB
            {
                if ( anyEntryA.title == anyEntryB.title)
                {
                    if ( anyEntryA.time > anyEntryB.time)
                    {
                        combinedArray.append(anyEntryA)
                    }
                    else
                    {
                        combinedArray.append(anyEntryB)
                    }
                }
            }
        }

        return combinedArray;
    }
}
