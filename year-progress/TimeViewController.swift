//
//  TimeViewController.swift
//  year-progress
//
//  Created by André on 09/02/20.
//  Copyright © 2020 André. All rights reserved.
//

import Cocoa

class TimeViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}

extension TimeViewController {
  // MARK: Storyboard instantiation
  static func freshController() -> TimeViewController {
    //1.
    let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
    //2.
    let identifier = NSStoryboard.SceneIdentifier("TimeViewController")
    //3.
    guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? TimeViewController else {
      fatalError("Unable to find TimeViewController in Main.storyboard")
    }
    return viewcontroller
  }
}
