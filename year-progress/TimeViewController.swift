//
//  TimeViewController.swift
//  year-progress
//
//  Created by André on 09/02/20.
//  Copyright © 2020 André. All rights reserved.
//

import Cocoa

class TimeViewController: NSViewController {

    @IBOutlet weak var dayProgress: NSProgressIndicator!
    @IBOutlet weak var monthProgress: NSProgressIndicator!
    @IBOutlet weak var yearProgress: NSProgressIndicator!
    
    @IBOutlet weak var labelDayProgress: NSTextField!
    @IBOutlet weak var labelMonthProgress: NSTextField!
    @IBOutlet weak var labelYearProgress: NSTextField!
    
    @IBAction func quitACtion(_ sender: Any) {
        NSApplication.shared.terminate(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        dayProgress.doubleValue = calculateProgress(period: acceptablePeriods.day)
    }
    
}

extension TimeViewController {
  static func freshController() -> TimeViewController {
    let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
    let identifier = NSStoryboard.SceneIdentifier("TimeViewController")
    guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? TimeViewController else {
      fatalError("Unable to find TimeViewController in Main.storyboard")
    }
    return viewcontroller
  }
}
