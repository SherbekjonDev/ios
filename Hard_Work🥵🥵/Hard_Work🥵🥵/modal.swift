//
//  modal.swift
//  Hard_Work🥵🥵
//
//  Created by Sherbekjon Rustamov on 24/10/22.
//

import Foundation
import UIKit

struct NewImage {
    var image : UIImage
}

protocol CellDelegate{
    func delegate(index: Int)
    func editItem(index: Int)
}
