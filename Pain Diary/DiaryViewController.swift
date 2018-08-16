//
//  DiaryViewController.swift
//  Pain Diary
//
//  Created by Michael Large on 8/16/18.
//  Copyright © 2018 Codethebeard. All rights reserved.
//

import UIKit

class DiaryViewController: UIViewController {

    @IBOutlet weak var addEntryButton: UIButton!
    @IBOutlet weak var buttonStackView: UIStackView!

    var moodsConfigurable: PainConfigurable!

    var painLevels: [PainIntensity] = [] {
        didSet {
            painLevelButtons = painLevels.map { mood in
                let painLevelButton = UIButton()
                painLevelButton.setImage(mood.image, for: .normal)
                painLevelButton.imageView?.contentMode = .scaleAspectFit
                painLevelButton.adjustsImageWhenHighlighted = false
                painLevelButton.addTarget(self, action: #selector(moodButtonSelected(_:)), for: .touchUpInside)
                return painLevelButton
            }
        }
    }

    var painLevelButtons: [UIButton] = [] {
        didSet {
            oldValue.forEach { $0.removeFromSuperview() }
            painLevelButtons.forEach { buttonStackView.addArrangedSubview($0) }
        }
    }

    var currentPainLevel: PainIntensity? {
        didSet {
            guard let currentPainLevel = currentPainLevel else {
                addEntryButton?.setTitle(nil, for: .normal)
                addEntryButton?.backgroundColor = nil
                return
            }

            addEntryButton?.setTitle("I feel \(currentPainLevel.name)", for: .normal)
            addEntryButton?.backgroundColor = currentPainLevel.color
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        painLevels = [.great, .meh, .bad, .terrible]
        addEntryButton.layer.cornerRadius = addEntryButton.bounds.height / 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func moodButtonSelected(_ sender: UIButton) {
        guard let selectedIndex = painLevelButtons.index(of: sender) else {
            preconditionFailure("Unable to find the tapped buton in the buttons array.")
        }
        currentPainLevel = painLevels[selectedIndex]
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "embedContainerViewController"?:
            guard let painConfigurable = segue.destination as? PainConfigurable else {
                preconditionFailure("Embedded view controller expected to confirm to MoodsConfigurable")
            }
            self.moodsConfigurable = painConfigurable
            segue.destination.additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 0, bottom: 160, right: 0)
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
    @IBAction func addEntryTapped(_ sender: UIButton) {
        guard let currentPainLevel = currentPainLevel else {
            return
        }

        let newMoodEntry = PainEntry(intensity: currentPainLevel, notes: nil, timestamp: Date())
        moodsConfigurable.add(newMoodEntry)
    }
}
