//
//  AppDelegate.swift
//  XPSQ8Kit-Test
//
//  Created by Owen Hildreth on 1/27/20.
//  Copyright © 2020 Hildreth Research Group. All rights reserved.
//

import Cocoa
import XPSQ8Kit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    @IBOutlet weak var runTest: NSButton!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


    @IBAction func runTest(_ sender: Any) {
        
        let controller = XPSQ8Controller(address: "192.168.0.254", port: 5001)
        
        
        let stageGroup = StageGroup(controller: controller, stageGroupName: "M")
        let stage = Stage(stageGroup: stageGroup, stageName: "X")
        

        // Expanded stage so that you can call moveRelative directly on the Stages
        do {
            try stage.moveRelative(targetDisplacement: -5)
        } catch {
            print(error)
        }
        
        
        
        do {
            try controller?.gathering.reset()
        } catch {print(error)}

    }
}

