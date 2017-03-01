//
//  GlobalConstants.swift
//  ListenUp
//
//  Created by David Thurman on 2/28/17.
//  Copyright © 2017 David Thurman. All rights reserved.
//

struct Constants {
    static let categories: [String] = [
        "Movies",
        "Video Games",
        "Music"
    ]
    static var selectedCategories: [String] = []
    static var localAnswers: [String : [String : [String]]] = [
        "Movies" : [
            "Harry Potter" : ["Magic", "Lightning", "School", "You Know Who", "Ron", "Dumbledore", "Harry"],
            "Lord of the Rings" : ["Fantasy", "Swords", "Magic", "Mount Doom", "One Ring", "Sam Wise", "Frodo Baggins"]
        ],
        "Video Games" : [
            "Halo" : ["Shooter", "Sci-fi", "Super Soldier", "Rings", "Elites", "John", "Master Chief"],
            "Mario" : ["Whomp", "Koopa Troopa", "Shy Guy", "Goomba", "Italian", "Plumber", "Luigi"]
        ],
        "Music" : [
            "Queen" : ["Under Pressure", "The Show must go on", "Fat Bottomed Girls", "Somebody to Love", "We Will Rock You", "Freddie Mercury", "Bohemian Rhapsody"],
            "The Beatles" : ["Revolver", "George", "Ringo", "Paul", "John", "Penny Lane", "Hey Jude"]
        ]
    ]
}
