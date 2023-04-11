#  Challenge 07 from HWS [UIKit]

This is an attempt at doing the [Milestone Projects 19-21](https://www.hackingwithswift.com/guide/ios-classic/8/3/challenge) from HWS (the UIKit version).

The challenge is to recreate the Apple Notes app. I've got the basic setup working (the data model, extensions, a data manager).

The app basically works in that it can:
* add a new default note
* save notes to disk
* load saved notes from disk into a **UITableView**
* the user can click one of the rows and be taken to a screen where they can change the text of the note body -- but they can't edit the title text field
</br>

The **UITextField** in the **NoteViewController** (_titleTextField_), as far as I can tell, is set up correctly with a TextField object in the main storyboard and an IBOutlet from the storyboard to the NoteViewController.swift file. But, I'm not able to edit the title in the text field. The body **UITextView** works fine; it lets you change the text and will save it to disk, but for some reason it won't let you change the title text field.
</br>

I can't see anything wrong with the code or the storyboard, but I have limited  experience with storyboards and UIKit.
</br>


Can anyone see what the problem is? I've been fighting over this for more than a day and can't find anything online that talks about this problem.
</br>

