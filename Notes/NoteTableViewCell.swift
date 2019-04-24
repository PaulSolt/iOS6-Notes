//
//  NoteTableViewCell.swift
//  Notes
//
//  Created by Paul Solt on 4/24/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    @IBAction func shareButtonPressed(_ sender: Any) {
        
        print("Share pressed")
    }
    
    private func updateViews() {
        guard let note = note else { return }
        
        noteLabel.text = note.text
    }
    
    @IBOutlet var noteLabel: UILabel!
    
    var note: Note? {
        didSet {
            updateViews()
        }
    }
}
