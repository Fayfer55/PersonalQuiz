//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 31.08.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet var resultLogoLabel: UILabel!
    @IBOutlet var resultTextLabel: UILabel!
    
    var results: [Answer]!
    
    private var counts: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        textEdditing()
    }
    
    private func textEdditing () {
        for result in results {
            counts.append(result.type.rawValue)
        }
        
        let sortedCounts = counts.reduce(into: [:], { counts, character in counts[character, default: 0] += 1 })
        
        guard let yourDestiny = sortedCounts.sorted( by: {$0.value > $1.value} ).first?.key else { return }
        
        resultLogoLabel.text = "Вы - \(yourDestiny)"
        resultTextLabel.text = AnimalType.init(rawValue: yourDestiny)?.definition
    }
}

