//
//  File.swift
//  FINAL Project
//
//  Created by Мариям on 27.04.2022.
//

import Foundation
import RealmSwift

class MovieRealm: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var popularity : Double = 0
    @objc dynamic var overview = ""
    @objc dynamic var id: Int = 0
    @objc dynamic var backdropPath = ""
    @objc dynamic var mediaType = ""
    @objc dynamic var posterPath = ""

    override class func primaryKey() -> String? {
        return "id"
    }
}

