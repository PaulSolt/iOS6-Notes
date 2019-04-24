//
//  NotesViewController.swift
//  Notes
//
//  Created by Paul Solt on 4/24/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController { // , UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    

    @IBAction func saveButtonPressed(_ sender: Any) {
        print("save")
        
        // 1. get the text if it's present
        // 2. create a new note
        // 3. update the display
        
//        guard let text = notesTextView.text else { return }
        guard let text = notesTextView.text,
            !text.isEmpty else { return }

        noteController.createNote(withText: text)
        
        tableView.reloadData()
        
        notesTextView.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "NoteDetail" {
            guard let noteDetailVC = segue.destination as? NoteDetailViewController,
                let cell = sender as? NoteTableViewCell else { return }
            
            noteDetailVC.note = cell.note
        }
        
    }

    let noteController = NoteController()
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var notesTextView: UITextView!
}

extension NotesViewController: UITableViewDelegate {

}

extension NotesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteController.notes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        
        guard let noteCell = cell as? NoteTableViewCell else { return cell }
        
        // Get the note for row
        
        let note = noteController.notes[indexPath.row]
        noteCell.note = note
        
        return cell
    }
}
