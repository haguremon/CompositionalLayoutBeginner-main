//
//  GetUserInfo.swift
//  CompositionalLayoutUbereats
//
//  Created by IwasakIYuta on 2021/08/06.
//https://api.github.com/users/haguremon

import Foundation

protocol GetUserInfo: AnyObject {
    func getUserInfo(user: [User])
}

class GetUserAPI {
    
    weak var delegate: GetUserInfo?
    
    func setUserInfo(){
        
        guard let url = URL(string: "https://api.github.com/users/haguremon") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [ weak self ] data, response, error in
            
            guard let data = data ,
                  let response = response as? HTTPURLResponse ,
                  error == nil,
                  response.statusCode == 200 else { return }
            do {
                
                let user = try JSONDecoder().decode(User.self, from: data)
                self?.delegate?.getUserInfo(user: [user])
            
            } catch {
                
                print(error)
                
            }
            
        }
        
        task.resume()
    }

    
}

