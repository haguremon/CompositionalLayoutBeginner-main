//
//  Account.swift
//  CompositionalLayoutUbereats
//
//  Created by IwasakIYuta on 2021/08/06.
//https://api.github.com/users/haguremonこれを使うー

import Foundation

struct User: Codable {
    
    let login: String
    
    let id: Int
    
    let avatarurl: String
    
    let createdat: String
    
    let bio: String
    
    enum CodingKeys
    : String, CodingKey {
        case login
        case id
        case avatarurl = "avatar_url"
        case createdat = "created_at"
        case bio
    }
}
