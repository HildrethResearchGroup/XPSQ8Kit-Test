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
        
        
        /*  original command
        do {
            try controller?.group.moveRelative(stageName: "M.X", targetDisplacement: 10)
            print("Move Tried")
        } catch {
            print(error)
        }
        */
        
        /* updated command that was moved to StageGroup
        do {
            try stageGroup.moveRelative(stage: stage, targetDisplacement: -5)
        } catch {
            print(error)
        }
        */
        

        // Expanded stage so that you can call moveRelative directly on the Stages
        do {
            try stage.moveRelative(targetDisplacement: -5)
        } catch {
            print(error)
        }
        

    }
}

