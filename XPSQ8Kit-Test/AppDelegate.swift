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
        /*
        do {
            try stage.moveRelative(targetDisplacement: -5)
        } catch {
            print(error)
        }
        */
        
        
        /*
        do {
            try controller?.group.moveAbsolute(stage: "M.X", toLocation: 30)
            print("Moving stage to 30")
        } catch {
            print(error)
        }*/
        
        
        do {
            if let current = try controller?.group.jog.getCurrent(stage: "M.X") {
                let velocity = current.velocity
                let acceleration = current.acceleration
                print("Velocity = \(velocity)")
                print("Acceleartion = \(acceleration)")
            } else { print("current = nil") }
        } catch {
            print(error)
        }
        
        do {
            if let current = try stage.jogGetCurrent() {
                let velocity = current.velocity
                let acceleration = current.acceleration
                print("Velocity = \(velocity)")
                print("Acceleartion = \(acceleration)")
            } else { print("current = nil") }
        } catch {
            print(error)
        }
        
        /*
        do {
            try stage.moveAbsolute(toLocation: -10)
            print("Moving stage to -10")
        } catch {
            print(error)
        }
 */
        
        
        
            
    }
}

