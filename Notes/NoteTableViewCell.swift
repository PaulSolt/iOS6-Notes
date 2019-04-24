//
//  NoteTableViewCell.swift
//  Notes
//
//  Created by Paul Solt on 4/24/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit

protocol NoteTableViewCellDelegate: AnyObject {
    func shareNote(for cell: NoteTableViewCell)
}

class NoteTableViewCell: UITableViewCell {

    @IBAction func shareButtonPressed(_ sender: Any) {
        delegate?.shareNote(for: self)
    }
    
    private func updateViews() {
        guard let note = note else { return }
        
        noteLabel.text = note.text
    }
    
    @IBOutlet var noteLabel: UILabel!
    
    weak var delegate: NoteTableViewCellDelegate?
    
    var note: Note? {
        didSet {
            updateViews()
        }
    }
}
