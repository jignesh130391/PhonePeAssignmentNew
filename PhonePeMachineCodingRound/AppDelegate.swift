//
//  AppDelegate.swift
//  PhonePeMachineCodingRound
//
//  Created by Jignesh Patel on 23/09/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UserDefaults.standard.set(["PlayList 1"], forKey: "PlayLists")
        UserDefaults.standard.synchronize()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let movieListVC = storyboard.instantiateViewController(withIdentifier: MovieListVC.id) as! MovieListVC
        let navigationController = UINavigationController(rootViewController: movieListVC)
        navigationController.view.backgroundColor = .white
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.barTintColor = .white
        navigationController.navigationBar.isTranslucent = false
        window!.rootViewController = navigationController
        window!.makeKeyAndVisible()
        return true
    }


}

