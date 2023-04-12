//
//  NoteViewController.swift
//  TestingTextFields
//
//  Created by Robert Hoover on 2023-04-11.
//

import UIKit

class NoteViewController: UIViewController {

    /// FIXED - the titleTextField is not editable
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var bodyTextView: UITextView!
    
    var notes: [Note]!
    var index: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /// this next line fixes the text field problem
        navigationItem.largeTitleDisplayMode = .never
        
        guard let notes = notes else { return }
        
        if let index = index {
            titleTextField.text = notes[index].noteTitle
            bodyTextView.text = notes[index].noteBody
        } else {
            print("NoteViewController, index was nil")
            return
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if let title = titleTextField.text {
            notes[index].noteTitle = title
        }
        if let body = bodyTextView.text {
            notes[index].noteBody = body
        }

        DispatchQueue.global().async { [weak self] in
            if let notes = self?.notes {
                print("NoteViewController, saving all notes")
                DataManager.save(notes)
            }
        }
    }
}
