//
//  AppDelegate.swift
//  PDFViewer
//
//  Created by numan ayhan on 9.05.2022.
//

import UIKit
var rooter:Navigation?

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setNavigation()
        return true
    }
    func setNavigation(){
        //Window UI
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        //Root App
        rooter = Navigation(window: window!)
        rooter?.startApp()
    }
    
    
    
}

