//
//  HerokuappClient.swift
//  EnglishNow
//
//  Created by GeniusDoan on 6/29/17.
//  Copyright © 2017 IceTeaViet. All rights reserved.
//

import Foundation
import AFNetworking

struct URLServer {
    static let base : String = "https://nodetok.herokuapp.com/"
    static let createSession : String = "session"
    static let createRoom: String = "room/"
}

class SessionSponse {
    var apiKey: String
    var session: String
    var token: String
    
    init(data : [String: AnyObject]) {
        apiKey = data["apiKey"] as! String
        session = data["sessionId"] as! String
        token = data["token"] as! String
    }
}

class HerokuappClient: AFHTTPSessionManager {
    static var shared = HerokuappClient(baseURL: URL(string: URLServer.base))
    
    func getSessionDeprecated(complete: @escaping ([String: String]?, Error?) -> Void) {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let url = baseURL?.appendingPathComponent(URLServer.createSession)
       
        let dataTask = session.dataTask(with: url!) {
            (data: Data?, response: URLResponse?, error: Error?) in
            
            guard error == nil, let data = data else {
                print(error!)
                complete(nil, error)
                return
            }
            
            let dict = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [AnyHashable: Any]
        
            Singleton.sharedInstance.tokBoxApiKey = dict?["apiKey"] as? String ?? ""
            let sessionId : String = dict?["sessionId"] as? String ?? ""
            let token : String = dict?["token"] as? String ?? ""
            complete([sessionId : token], nil)
        }
        dataTask.resume()
        session.finishTasksAndInvalidate()
    }
    
    func getSession(roomName: String, complete: @escaping ([String: String]?, Error?) -> Void) {
        var connectURL : String
        if roomName.isEmpty {
            connectURL = URLServer.createSession
        } else {
            connectURL = URLServer.createRoom + roomName
        }
        get(connectURL, parameters: nil, progress: nil, success: { (task, response) in
            if let tempDictionary = (response as? [String: String]) {
                //Get sessionId, apikey and speaker token sucessfully
                self.get(connectURL, parameters: nil, progress: nil, success: { (task, response) in
                    if let learnerDict = response as? [String: String] {
                        //Get sessionId, apikey and speaker token sucessfully
                        var dictionary : [String: String] = tempDictionary
                        dictionary["learner_token"] = learnerDict["token"]
                        complete(dictionary, nil)
                    }
                }) { (task, error) in
                    complete(nil, error)
                }
            }
        }) { (task, error) in
            complete(nil, error)
        }
    }
}
