//
//  protocol Coordinator.swift
//  Coord_Test
//
//  Created by admin on 7/13/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {   //func free is '!=='
    var childCoordinators: [Coordinator] {get set}
    func start()
}

extension Coordinator {
    //Only extensions can have bodies inside function
    func store(coordinator: Coordinator){childCoordinators.append(coordinator)}
    func free(coordinator: Coordinator) {childCoordinators = childCoordinators.filter { $0 !== coordinator }}
}

class BaseCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var isCompleted: (()->())?  //      (()->Void)?
    func start() {fatalError("Children should implement 'start'")}
}

class AppCoordinator: BaseCoordinator {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        super.init()
    }
    
    override func start() {
        let navigationController = UINavigationController()
        let myCoordinator = MyCoordinator(navigationController: navigationController)
        self.store(coordinator: myCoordinator)
        myCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        myCoordinator.isCompleted =  {[weak self] in
            self?.free(coordinator: myCoordinator)
            
        }
    }
}


class MyCoordinator: BaseCoordinator {
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        
    }
    
    
    
}

