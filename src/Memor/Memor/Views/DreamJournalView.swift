//
//  DreamJournalView.swift
//  Memor
//
//  Created by Justin Bell on 7/7/25.
//

import SwiftUI

struct DreamJournalView: View {
    @StateObject var dreamsVM = DreamJournalViewModel()
    @State var dream = DreamJournalModel(title: "", story: "", people: "", places: "", objects: "", emotions: "", themes: "")

    var body: some View {
        NavigationStack {
            Text("Dream Journal")
                .font(.title)
                .fontWeight(.bold)
            List { // get and view past entries
                ForEach($dreamsVM.dreams) { $dream in
                    NavigationLink {
                        DreamEntryView(dream: $dream)
                    } label: {
                        Text(dream.title)
                    }
                }
                Section { //create new entry
                    NavigationLink {
                        DreamEntryView(dream: $dream)
                    } label: {
                        Text("New Entry")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 15))
                    }
                }
            }
            .onAppear {
                dreamsVM.fetchData()
                dream = DreamJournalModel(title: "", story: "", people: "", places: "", objects: "", emotions: "", themes: "")
            }
            .refreshable {
                dreamsVM.fetchData()
                dream = DreamJournalModel(title: "", story: "", people: "", places: "", objects: "", emotions: "", themes: "")
            }
        }
    }
}

#Preview {
    DreamJournalView()
}

