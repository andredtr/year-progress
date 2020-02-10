//
//  ProgressLabelGenerator.swift
//  year-progress
//
//  Created by André on 09/02/20.
//  Copyright © 2020 André. All rights reserved.
//

import Foundation

func ProgresslabelGenerator(period: acceptablePeriods) -> String {
    return String(format: "%.1f", calculateProgress(period: period)) + " %"
}
