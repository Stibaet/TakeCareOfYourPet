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
    
    //MARK: - properties
    var childCoordinators: [Coordinator] = []
    private let window: UIWindow
    private let dependency: DependencyAssembly
    
    var databaseService: DatabaseServiceProtocol { dependency.databaseService }
    var authService: AuthServiceProtocol { dependency.authService }
    
    //MARK: - init
    init(window: UIWindow, dependency: DependencyAssembly) {
        self.window = window
        self.dependency = dependency
        window.overrideUserInterfaceStyle = .light
    }
    
    //MARK: - public methods
    func start() {
        let tabBarController = UITabBarController()
        
        let petsNavVC = UINavigationController()
        let tasksNavVC = UINavigationController()
        let settingsNavVC = UINavigationController()
        
        let petsCoordinator = PetsCoordinator(navigationController: petsNavVC)
        let tasksCoordinator = TasksCoordinator(navigationController: tasksNavVC)
        let settingsCoordinator = SettingsCoordinator(navigationController: settingsNavVC)
        
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
    
    func showAuthFlow() {
        let authNavVC = UINavigationController()
        let authCoordinator = AuthCoordinator(navigationController: authNavVC, authService: authService, databaseService: databaseService)
        addChild(authCoordinator)
        window.rootViewController = authNavVC
        window.makeKeyAndVisible()
        authCoordinator.start()
    }
}

//MARK: - parent coordinator methods
extension AppCoordinator {
    func addChild(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeChild(_ coordinator: Coordinator) {
        childCoordinators.removeAll { $0 === coordinator }
    }
}

//MARK: - private methods
private extension AppCoordinator {
    func setupTabBarItems(for tabBarController: UITabBarController) {
        guard let items = tabBarController.tabBar.items else { return }
        
        items[0].title = "Питомцы"
        items[0].image = UIImage(systemName: "pawprint")
        
        items[1].title = "Задачи"
        items[1].image = UIImage(systemName: "list.bullet")
        
        items[2].title = "Настройки"
        items[2].image = UIImage(systemName: "gear")
        
    }
    
}
