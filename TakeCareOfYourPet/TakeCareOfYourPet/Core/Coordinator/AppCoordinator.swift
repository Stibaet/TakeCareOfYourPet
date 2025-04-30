//
//  AppCoordinator.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 30.04.2025.
//

import UIKit

protocol Coordinator: AnyObject {
    func start()
}

protocol NavigationCoordinator: Coordinator {
    var navigationController: UINavigationController { get set }
}

protocol ParentCoordinator: Coordinator {
    var childCoordinators: [Coordinator] { get set }
    func addChild(_ coordinator: Coordinator)
    func removeChild(_ coordinator: Coordinator)
}

class AppCoordinator: ParentCoordinator {
    func addChild(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeChild(_ coordinator: Coordinator) {
        childCoordinators.removeAll { $0 === coordinator }
    }
    
    var childCoordinators: [Coordinator] = []
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let tabBarController = UITabBarController()
        
        let petsCoordinator = PetsCoordinator()
        let tasksCoordinator = TasksCoordinator()
        let settingsCoordinator = SettingsCoordinator()
        
        childCoordinators = [petsCoordinator, tasksCoordinator, settingsCoordinator]
        childCoordinators.forEach { $0.start() }
        
        tabBarController.viewControllers = [
            petsCoordinator.navigationController,
            tasksCoordinator.navigationController,
            settingsCoordinator.navigationController
        ]
        
        setupTabBarItems(for: tabBarController)
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
    
    private func setupTabBarItems(for tabBarController: UITabBarController) {
        guard let items = tabBarController.tabBar.items else { return }
        
        items[0].title = "Питомцы"
        items[0].image = UIImage(systemName: "pawprint")
        
        items[1].title = "Задачи"
        items[1].image = UIImage(systemName: "list.bullet")
        
        items[2].title = "Настройки"
        items[2].image = UIImage(systemName: "gear")
        
    }
    
}
