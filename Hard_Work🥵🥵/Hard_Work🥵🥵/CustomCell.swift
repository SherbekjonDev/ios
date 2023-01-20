//
//  CustomCell.swift
//  Hard_Work🥵🥵
//
//  Created by Sherbekjon Rustamov on 24/10/22.
//

import UIKit

class CustomCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    var index: Int!
    var delegate: CellDelegate?
    
    var remove: (() -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
    }
    
    func uptadeCell(img : NewImage) {
        image.image = img.image
    }
    
    
    @IBAction func Xbtn(_ sender: Any) {
        delegate?.delegate(index: index)
        
      
        
    }
    
    
    
    
}
