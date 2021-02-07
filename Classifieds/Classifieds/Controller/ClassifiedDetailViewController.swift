//
//  ClassifiedDetailViewController.swift
//  Classifieds
//
//  Created by Faraz Haider on 08/02/2021.
//

import UIKit

class ClassifiedDetailViewController: UIViewController,Storyboarded {
    weak var coordinator: MainCoordinator?
    var vm: ClassifiedViewModel?
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let selectedVm = vm{
            self.iconImageView.cacheImage(urlString: selectedVm.imageUrl)
            self.nameLabel.text = selectedVm.name
            self.priceLabel.text = selectedVm.price
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
