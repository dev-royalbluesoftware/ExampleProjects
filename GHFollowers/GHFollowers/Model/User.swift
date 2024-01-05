//
//
// GHFollowers
// User.swift
//
// Created by jjbuell-dev
// Copyright © Royal Blue Software
// 


import Foundation

struct User: Codable {
    let login: String
    let avatarURL: String
    var name: String?
    var location: String?
    var bio: String?
    let publicRepos: Int
    let publicGists: Int
    let htmlURL: String
    let following: Int
    let followers: Int
    let createdAt: Date
}
