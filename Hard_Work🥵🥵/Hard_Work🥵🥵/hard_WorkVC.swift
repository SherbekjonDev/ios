//
//  hard_WorkVC.swift
//  Hard_Work🥵🥵
//
//  Created by Sherbekjon Rustamov on 24/10/22.
//

import UIKit
import PhotosUI

class hard_WorkVC: UIViewController {

    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var textTF: UITextField!
    
    var arr:[UIImage] = []

    
    var data : [NewImage] = [
        NewImage(image: UIImage(systemName: "globe")!),
        NewImage(image: UIImage(systemName: "trash")!),
        NewImage(image: UIImage(systemName:  "pencil")!),
        NewImage(image: UIImage(systemName: "house")!),
        NewImage(image: UIImage(systemName: "person")!),
        NewImage(image: UIImage(systemName: "app")!),
        NewImage(image: UIImage(systemName: "app.fill")!),
        NewImage(image: UIImage(systemName:  "plus")!),
        NewImage(image: UIImage(systemName: "person")!),
        NewImage(image: UIImage(systemName: "person")!),

    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        BorderTF()
        setupCollectionView()
    }
    override func viewWillAppear(_ animated: Bool) {
                 
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.filter = .images
        config.selectionLimit = 0
        
        let photoPicker = PHPickerViewController(configuration: config)
        photoPicker.delegate = self
        present(photoPicker, animated: true)
        
    }
    func BorderTF() {
        textTF.layer.borderWidth = 2
        textTF.layer.borderColor = UIColor.green.cgColor
        textTF.placeholder = "Murojatnoma"
    }

    
    func setupCollectionView() {
        CollectionView.delegate = self
        CollectionView.dataSource = self
    
        CollectionView.register(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "CustomCell")
    }
    
    
    
    @IBAction func DoneBtnPressed(_ sender: Any) {
     
        navigationController?.popViewController(animated: true)
    }
}
//MARK: - extension
extension  hard_WorkVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let heigth = collectionView.frame.height
        
        return CGSize(width: width / 4 , height: heigth / 7 )
    }
}
extension hard_WorkVC: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.CollectionView.dequeueReusableCell(withReuseIdentifier:"CustomCell", for: indexPath) as! CustomCell
      return cell

        
    }
    
    
}

extension hard_WorkVC: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        let gruop = DispatchGroup()
        
        results.forEach{result in
            gruop.enter()
            result.itemProvider.loadObject(ofClass: UIImage.self ) { reading, error in
                defer {
                    gruop.leave()
                }
                guard let image = reading as? UIImage, error == nil else
                {
                    return
                }
                self.arr.append(image)
            }
        }

    }
}
