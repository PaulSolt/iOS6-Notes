//
//  NoteController.swift
//  Notes
//
//  Created by Paul Solt on 4/24/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import Foundation

class NoteController {
    
    init() {
        // Create test data
        createNote(withText: "Walk the dog")
        createNote(withText: "Eat lunch!")
        createNote(withText: "In a storyboard-based application, you will often want to do a little preparation before navigation")
    }
    
    func createNote(withText text: String) {
        let note = Note(text: text)
        
        notes.append(note)
    }
    
    var notes: [Note] = []      // Array of notes
}
