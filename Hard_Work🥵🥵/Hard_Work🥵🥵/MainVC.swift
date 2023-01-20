//
//  MainVC.swift
//  Hard_Work🥵🥵
//
//  Created by Sherbekjon Rustamov on 24/10/22.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      setupMainVC()
        
    }
    func setupMainVC() {
    title = "Mening murojatnomalarim"
    navigationController?.navigationBar.prefersLargeTitles = true
        let item = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(addElementDefault))
        navigationItem.rightBarButtonItem = item
    }
    
    @objc func addElementDefault(){
        let vc2 = hard_WorkVC(nibName: "hard_WorkVC", bundle: nil)
        navigationController?.pushViewController(vc2, animated: true)
        
        }
    
    
}


