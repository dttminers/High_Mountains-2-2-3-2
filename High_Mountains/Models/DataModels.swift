
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

class UserInfoModel : NSObject {
     var lives_in : String?
     var profile_pic : String?
     var email : String?
     var full_name : String?
     var fav_quote : String?
     var gender : String?
     var from_des : String?
     var profile_type : String?
     var followers_count : Int?
     var relationship_status : String?
     var bio : String?
     var result_status : Int?
     var status : Int?
     var contact_no : Int?
     var username : String?
     var id : Int?
     var password : String?
     var referral_code : String?
     var time : String?
     var following_count : Int?
     var dob : String?
    
    func setDictionary(_ dictionary:[AnyHashable : Any]){
        lives_in = dictionary["lives_in"] as? String
        profile_pic = dictionary["profile_pic"] as? String
        email = dictionary["email"] as? String
        full_name = dictionary["full_name"] as? String
        fav_quote = dictionary["fav_quote"] as? String
        gender = dictionary["gender"] as? String
        from_des = dictionary["from_des"] as? String
        profile_type = dictionary["profile_type"] as? String
        followers_count = dictionary["followers_count"] as? Int
        relationship_status = dictionary["relationship_status"] as? String
        bio = dictionary["bio"] as? String
        result_status = dictionary["result_status"] as? Int
        status = dictionary["status"] as? Int
        contact_no = dictionary["contact_no"] as? Int
        username = dictionary["username"] as? String
        id = dictionary["id"] as? Int
        password = dictionary["password"] as? String
        referral_code = dictionary["referral_code"] as? String
        time = dictionary["time"] as? String
        following_count = dictionary["following_count"] as? Int
        dob = dictionary["dob"] as? String
    }
}
