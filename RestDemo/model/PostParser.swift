//
//  PostParser.swift
//  RestDemo
//
//  Created by mobapp10 on 29/01/2019.
//  Copyright © 2019 Ehb. All rights reserved.
//

import Foundation
class PostParser{
    
    static func getAllPosts() -> [UserPost]{
        //op welke adres staat de data?
        let url = URL.init(string: "https://jsonplaceholder.typicode.com/posts")!
        //starten met een lege Array
        var posts = [UserPost]()
        //indien iets faalt zoals geen verbinding, verkeerde data,...
        do{
            //ruwe data van url binnenhalen
            let data = try Data.init(contentsOf: url)
            //voorlopige test, kot er iets binnen
            print(data)
            //data start met een array, DATA LATEN OMZETTEN NAAR ARRAY VAN OBJECTEN
            let jsonArray = try JSONSerialization.jsonObject(with: data) as! [NSObject]
            // ARRAY OVERLOPEN
            for item in jsonArray {
                //value for key, geeft een generiek object terug, moeten we nog casten
                let id = item.value(forKey: "id") as! Int
                let userId = item.value(forKey: "userId") as! Int
                let title = item.value(forKey: "title") as! String
                let body = item.value(forKey: "body") as! String
                
                let currentPost = UserPost.init(id: id, userID: userId, title: title, body: body)
                
                posts.append(currentPost)
            }
        }catch{
            print("\'t werkt ni")
            
        }
        return posts
        
    }
}
