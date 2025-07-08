//
//  DreamEntryView.swift
//  Memor
//
//  Created by Justin Bell on 7/7/25.
//

import SwiftUI

/// A view that display the data of a dream entry
struct DreamEntryView: View {
    @Binding var dream : DreamJournalModel
    @StateObject var dreamVM = DreamJournalViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {//show journal entry data
                VStack {
                    Text("Dream Journal Entry")
                        .font(.title)
                        .fontWeight(.bold)
                    TextField("Entry Title", text: $dream.title)
                        .frame(width: 403, height: 30)
                        .border(Color.gray)
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("Story")
                    TextEditor(text: $dream.story)
                        .frame(width: 403, height: 150)
                        .border(Color.gray)
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("People")
                    TextEditor(text: $dream.people)
                        .frame(width: 403, height: 50)
                        .border(Color.gray)
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("Places")
                    TextEditor(text: $dream.places)
                        .frame(width: 403, height: 50)
                        .border(Color.gray)
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("Objects")
                    TextEditor(text: $dream.objects)
                        .frame(width: 403, height: 50)
                        .border(Color.gray)
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("Emotions")
                    TextEditor(text: $dream.emotions)
                        .frame(width: 403, height: 50)
                        .border(Color.gray)
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("Themes")
                    TextEditor(text: $dream.themes)
                        .frame(width: 403, height: 50)
                        .border(Color.gray)
                }
                .padding()
            }
            .padding()
            .toolbar {//show save data button
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dreamVM.saveData(dream: dream)
                    } label: {
                        Text("Save")
                    }
                }
            }
        }
    }
}

#Preview {
    DreamEntryView(dream: .constant(DreamJournalModel(title: "", story: "", people: "", places: "", objects: "", emotions: "", themes: "")))
}

