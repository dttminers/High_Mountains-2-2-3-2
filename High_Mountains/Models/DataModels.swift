
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
    var followers_count : String?
    var relationship_status : String?
    var bio : String?
    var result_status : String?
    var status : String?
    var contact_no : String?
    var username : String?
    var id : String?
    var password : String?
    var referral_code : String?
    var time : String?
    var following_count : String?
    var dob : String?
    var post_count : String?
    
    func setDictionary(_ dictionary:[AnyHashable : Any]){
        lives_in = dictionary["lives_in"] as? String
        profile_pic = dictionary["profile_pic"] as? String
        email = dictionary["email"] as? String
        full_name = dictionary["full_name"] as? String
        fav_quote = dictionary["fav_quote"] as? String
        gender = dictionary["gender"] as? String
        from_des = dictionary["from_des"] as? String
        profile_type = dictionary["profile_type"] as? String
        followers_count = dictionary["followers_count"] as? String
        relationship_status = dictionary["relationship_status"] as? String
        bio = dictionary["bio"] as? String
        result_status = dictionary["result_status"] as? String
        status = dictionary["status"] as? String
        contact_no = dictionary["contact_no"] as? String
        username = dictionary["username"] as? String
        id = dictionary["id"] as? String
        password = dictionary["password"] as? String
        referral_code = dictionary["referral_code"] as? String
        time = dictionary["time"] as? String
        following_count = dictionary["following_count"] as? String
        dob = dictionary["dob"] as? String
        post_count = dictionary["post_count"] as? String
        
    }
}

class TimelineModel : NSObject {
    var activity : String?
    var id : String?
    var timeline_id : String?
    var like_count : String?
    var comment_count : String?
    var share_count : String?
    var time : String?
    var isliked : String?
    var image : String?
    var caption : String?
    var friend_like: String?
    
    func setDictionary(_ dictionary:[AnyHashable : Any]){
        activity = dictionary["activity"] as? String
        id = dictionary["id"] as? String
        timeline_id = dictionary["timeline_id"] as? String
        like_count = dictionary["like_count"] as? String
        comment_count = dictionary["comment_count"] as? String
        share_count = dictionary["share_count"] as? String
        time = dictionary["time"] as? String
        isliked = dictionary["isliked"] as? String
        image = dictionary["image"] as? String
        caption = dictionary["caption"] as? String
        friend_like = dictionary["friend_like"] as? String
    }
}

class PhotoModel : NSObject {
    var like_count : String?
    var id : String?
    var image_url : String?
    var share_count : String?
    var time : String?
    var username : String?
    var comment_count : String?
    var uid : String?
    var timeline_id : String?
    var caption : String?
    //var image : String?
    var friend_like: String?
     var isliked : String?
    
    func setDictionary(_ dictionary:[AnyHashable : Any]){
        like_count = dictionary["like_count"] as? String
        id = dictionary["id"] as? String
        image_url = dictionary["image_url"] as? String
        share_count = dictionary["share_count"] as? String
        time = dictionary["time"] as? String
        username = dictionary["username"] as? String
        comment_count = dictionary["comment_count"] as? String
        uid = dictionary["Uid"] as? String
        timeline_id = dictionary["timeline_id"] as? String
        caption = dictionary["caption"] as? String
       // image = dictionary["image"] as? String
        friend_like = dictionary["friend_like"] as? String
        isliked = dictionary["isliked"] as? String
    }
}

class AllDestination : NSObject{
    
    var id : Int?
    var title: String?
    var country: String?
    var state: String?
    var city: String?
    var details: String?
    var continent: String?
    var image_url: String?
    var status: Int?
    
    
    func setDictionary(_ dictionary:[AnyHashable : Any]){
        
        id = dictionary["id"] as? Int
        title = dictionary["title"]as? String
        country = dictionary["country"] as? String
        state = dictionary["state"] as? String
        city = dictionary["city"] as? String
        details = dictionary["details"] as? String
        continent = dictionary["continent"] as? String
        image_url = dictionary["image_url"] as? String
        status  = dictionary["status"] as? Int
    }
}

class TravelTheme : NSObject{
    
    var id: Int?
    var title: String?
    var theme_image: String?
    var status: Int?
    
    
    func setDictionary(_ dictionary:[AnyHashable : Any]){
        
        id = dictionary["id"] as? Int
        title = dictionary["title"] as? String
        theme_image = dictionary["theme_image"] as? String
        status = dictionary["status"] as? Int
        
    }
}

class FetchRequest : NSObject{
    var name : String?
    var uid : String?
    var profile_pic : String?
    var mutual_friend_count : Int?
    
    func setDictionary(_ dictionary:[AnyHashable : Any]){
        
        name = dictionary["name"] as? String
        uid = dictionary["uid"] as? String
        profile_pic = dictionary["profile_pic"] as? String
        mutual_friend_count = dictionary["mutual friend count"] as? Int
        
    }
}

class SendComment : NSObject{
    var id : String?
    var timeline_id : String?
    var uid : String?
    var comment : String?
    var like_count : String?
    var reply_count : String?
    var time : String?
    var username : String?
    var profile_pic : String?
    
    
    func setDictionary(_ dictionary:[AnyHashable : Any]){
        
        id = dictionary["id"] as? String
        timeline_id = dictionary["timeline_id"] as? String
        uid = dictionary["uid"] as? String
        comment = dictionary["comment"] as? String
        like_count = dictionary["like_count"] as? String
        reply_count = dictionary["reply_count"] as? String
        time = dictionary["time"] as? String
        username = dictionary["username"] as? String
        profile_pic = dictionary["profile_pic"] as? String
    }
    
}

class LikeDisplay : NSObject {
    var username = String()
    var full_name = String()
    var uid = String()
    var profile_pic = String()
    var requested = String()
    var following = String()
    
    func setDictionary(_ dictionary:[AnyHashable : Any]){
        
        if let full_name = dictionary["full_name"] as? String {
            self.full_name = full_name
        }
        
        if let username = dictionary["username"] as? String {
            self.username = username
        }
        
        if let uid = dictionary["uid"] as? String {
            self.uid = uid
        }
        if let profile_pic = dictionary["profile_pic"] as? String {
            self.profile_pic = profile_pic
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


