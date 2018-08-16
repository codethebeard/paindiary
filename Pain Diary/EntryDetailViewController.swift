//
//  EntryDetailViewController.swift
//  Pain Diary
//
//  Created by Michael Large on 8/16/18.
//  Copyright © 2018 Codethebeard. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {

    var painEntry: PainEntry!

    @IBOutlet weak var painIntensityImage: UIImageView!
    @IBOutlet weak var painEntryNotes: UITextView!
    @IBOutlet weak var timeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        painEntryNotes.delegate = self

        title = "I feel \(painEntry.intensity.name)"
        bindUI()
    }

    func bindUI() {
        let date = DateFormatter.localizedString(from: painEntry.timestamp, dateStyle: .medium, timeStyle: .short)
        painIntensityImage.image = painEntry.intensity.image
        painEntryNotes.text = painEntry.notes
        timeLabel.text = "Feeling \(painEntry.intensity.name) on \(date)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func trashButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension EntryDetailViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text as NSString).rangeOfCharacter(from: CharacterSet.newlines).location == NSNotFound {
            return true
        }

        textView.resignFirstResponder()
        return false
    }
}
