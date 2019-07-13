//
//  Setup .swift
//  Coord_Test
//
//  Created by admin on 7/13/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

//protocol Coordinator: AnyObject {   //func free is '!=='
//    var childCoordinators: [Coordinator] {get set}
//    func start()
//}
//
//extension Coordinator {
//    //Only extensions can have bodies inside function
//    func store(coordinator: Coordinator){childCoordinators.append(coordinator)}
//    func free(coordinator: Coordinator) {childCoordinators = childCoordinators.filter { $0 !== coordinator }}
//}
//
//class BaseCoordinator: Coordinator {
//    var childCoordinators: [Coordinator] = []
//    var isCompleted: (()->())?  //      (()->Void)?
//    func start() {fatalError("Children should implement 'start'")}
//}
