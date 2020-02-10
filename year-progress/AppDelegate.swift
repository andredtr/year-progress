//
//  AppDelegate.swift
//  year-progress
//
//  Created by André on 08/02/20.
//  Copyright © 2020 André. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var statusItem: NSStatusItem?
    var barButton: NSStatusBarButton?

    let popover = NSPopover()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        barButton = statusItem?.button
        barButton?.action = #selector(togglePopover(_:))
        barButton?.title = ProgresslabelGenerator(period: .day)
        popover.contentViewController = TimeViewController.freshController()
        
        Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
            self.barButton?.title = ProgresslabelGenerator(period: .day)
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    

    @objc func togglePopover(_ sender: Any?) {
      if popover.isShown {
        closePopover(sender: sender)
      } else {
        showPopover(sender: sender)
      }
    }

    func showPopover(sender: Any?) {
      if let button = statusItem?.button {
        popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
      }
    }

    func closePopover(sender: Any?) {
      popover.performClose(sender)
    }

}

