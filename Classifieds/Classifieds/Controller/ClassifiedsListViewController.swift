//
//  ClassifiedsListViewController.swift
//  Classifieds
//
//  Created by Faraz Haider on 07/02/2021.
//

import UIKit
import JGProgressHUD

class ClassifiedsListViewController: UIViewController,Storyboarded,UITableViewDelegate,UITableViewDataSource {
    var coordinator: MainCoordinator?
    let hud = JGProgressHUD()
    
    @IBOutlet weak var listTableView:UITableView!
    var classifiedListViewModel = ClassifiedListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.isHidden = true
        if let navigationController = navigationController {
              coordinator = MainCoordinator(navigationController: navigationController)
          }
        
        populateClassifiedList()
    }
    
    func populateClassifiedList(){
        hud.textLabel.text = "Loading"
        hud.show(in: self.view)
        
        Webservice().load(resource: Classified.classifiedList) { [weak self] result in
    
            self?.hud.dismiss()
            listTableView.isHidden = false
            switch result{
            
            case .success(let classifiedResult):
                self?.classifiedListViewModel.classifiedViewModel = classifiedResult.results.map(ClassifiedViewModel.init)
                self?.listTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.classifiedListViewModel.classifiedViewModel.count
     }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vm = self.classifiedListViewModel.classifiedViewModel(at: indexPath.row)
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ClassifiedsListTableViewCell", for: indexPath) as? ClassifiedTableViewCell{
            cell.nameLabel?.text = vm.name
            cell.priceLabel?.text = vm.price
            cell.iconImageView.cacheImage(urlString: vm.imageUrl)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vm = self.classifiedListViewModel.classifiedViewModel(at: indexPath.row)
        coordinator?.classifiedDetail(with: vm)
    }
}

