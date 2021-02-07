//
//  MainCoordinator.swift
//  Classifieds
//
//  Created by Faraz Haider on 08/02/2021.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = ClassifiedsListViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func classifiedDetail(with selectedVm: ClassifiedViewModel?) {
        let vc = ClassifiedDetailViewController.instantiate()
        vc.vm = selectedVm
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}


