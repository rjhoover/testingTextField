//
//  ViewController.swift
//  TestingTextFields
//
//  Created by Robert Hoover on 2023-04-11.
//

import UIKit

class ViewController: UITableViewController {

    var notes = [Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Notes"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewNote))
        
        notes = DataManager.load().sorted()
        print("notes.count = \(notes.count)")
    }


    @objc func addNewNote() {
        print("addNewNote clicked")
        let newNote = Note.newNoteDefault
        notes.append(newNote)
        DataManager.save(notes)
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "NoteDetail") as? NoteViewController {
            vc.notes = notes
            vc.index = notes.firstIndex(where: { $0.id == newNote.id })
            navigationController?.pushViewController(vc, animated: true)
        }

        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        let note = notes[indexPath.row]
        content.text = note.noteTitle
//        content.secondaryText = note.dateString
        content.secondaryText = note.noteBody
        cell.contentConfiguration = content

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "NoteDetail") as? NoteViewController {
            vc.notes = notes
            vc.index = indexPath.row

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.notes = DataManager.load().sorted()
            self.tableView.reloadData()
        }
    }
}

