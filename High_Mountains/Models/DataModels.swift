
import Foundation

class FollowModel : NSObject {
    
    var name = String()
    var uid = String()
    var profile_pic = String()
    var mutual_friend_count = String()
    var requested = String()
    var following = String()
    
    func setDictionary(_ dictionary:[AnyHashable : Any]){
        
        if let name = dictionary["name"] as? String {
            self.name = name
        }
        if let uid = dictionary["uid"] as? String {
            self.uid = uid
        }
        if let profile_pic = dictionary["profile_pic"] as? String {
            self.profile_pic = profile_pic
        }
        if let mutual_friend_count = dictionary["mutual friend count"] as? String {
            self.mutual_friend_count = mutual_friend_count
        }
        else {
            self.mutual_friend_count = "0"
        }
        if let requested = dictionary["Requested"] as? String {
            self.requested = requested
        }
        else {
            self.requested = "0"
        }
        if let following = dictionary["following"] as? String {
            self.following = following
        }
        else {
            self.following = "0"
        }
    }
    
}
