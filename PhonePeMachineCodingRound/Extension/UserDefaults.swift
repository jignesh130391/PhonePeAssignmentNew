//
//  Utility.swift
//  PhonePeMachineCodingRound
//
//  Created by Jignesh Patel on 23/09/23.
//

import UIKit


extension UserDefaults {
    
    func getPlayLists() -> [String]{
        return UserDefaults.standard.object(forKey: "PlayLists") as? [String] ?? []
    }
    
    func getMoviesInPlayList(key: String) -> [Int]{
        return UserDefaults.standard.object(forKey: key) as? [Int] ?? []
    }
}

