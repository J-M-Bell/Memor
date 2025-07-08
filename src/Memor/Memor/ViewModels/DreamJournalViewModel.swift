//
//  DreamJournalViewModel.swift
//  Memor
//
//  Created by Justin Bell on 7/7/25.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

/// A view model that handles the data tasks of the journal view.
class DreamJournalViewModel : ObservableObject {
    
    ///list of dreams
    @Published var dreams = [DreamJournalModel]()
    
    ///database variable
    let db = Firestore.firestore()
    
    
    /// A method that retrieves dream journal entry data from database
    func fetchData() {
        self.dreams.removeAll()
        db.collection("dreams").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    do {
                        self.dreams.append(try document.data(as: DreamJournalModel.self))
                    } catch {
                        print(error)
                    }
                }
            }
        }
          
    }
    
    
    /// A method that saves dream journal entry data from end user to the database.
    /// - Parameter dream: DreamJournalModel - class containing dream journal entry data
    func saveData(dream: DreamJournalModel) {
        if let id = dream.id { //for editing entries
            if !dream.isEmpty() { //check that journal exists
                //retrieve document through id
                let docRef = db.collection("dreams").document(id)
                
                //update journal entry in database
                docRef.updateData([
                    "title": dream.title,
                    "story": dream.story,
                    "emotions": dream.emotions,
                    "people": dream.people,
                    "places": dream.places,
                    "objects": dream.objects,
                    "themes": dream.themes
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    }
                    else {
                        print("Document successfully updated")
                    }
                }
            }
            
        }
        else {//for adding journal entries
            if !dream.isEmpty() {
                //add journal entry to database
                var ref: DocumentReference? = nil
                ref = db.collection("dreams").addDocument(data: [
                    "title": dream.title,
                    "story": dream.story,
                    "emotions": dream.emotions,
                    "people": dream.people,
                    "places": dream.places,
                    "objects": dream.objects,
                    "themes": dream.themes
                ]) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document added with ID: \(ref!.documentID)")
                    }
                }
            }
        }
    }
}

