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

    let popover = NSPopover()
    
    @objc func printQuote(_ sender: Any?) {
      let quoteText = "Never put off until tomorrow what you can do the day after tomorrow."
      let quoteAuthor = "Mark Twain"
      
      print("\(quoteText) — \(quoteAuthor)")
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
//
//        guard let button = statusItem?.button else {
//            print("status bar item failed. Try removing some menu bar item.")
//            NSApp.terminate(nil)
//            return
//        }
//
//        button.image = NSImage(named: "hourglass")
//
//        constructMenu()
        if let button = statusItem?.button {
          button.image = NSImage(named:NSImage.Name("hourglass"))
          button.action = #selector(togglePopover(_:))
        }
        popover.contentViewController = TimeViewController.freshController()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func constructMenu() {
      let menu = NSMenu()

      menu.addItem(NSMenuItem(title: "Print Quote", action: #selector(AppDelegate.printQuote(_:)), keyEquivalent: "P"))
      menu.addItem(NSMenuItem.separator())
      menu.addItem(NSMenuItem(title: "Quit Quotes", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))

      statusItem?.menu = menu
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

