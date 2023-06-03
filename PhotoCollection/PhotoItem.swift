//
//  PhotoItem.swift
//  PhotoCollection
//
//  Created by 安部瞳 on 2023/06/03.
//

import Foundation
import RealmSwift

class PhotoItem: Object {
    @objc var cameraMakerNumber: Int = 0
    @objc var photoURL: String = ""
}
