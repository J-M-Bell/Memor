//
//  WelcomeView.swift
//  Memor
//
//  Created by Justin Bell on 7/7/25.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {

        NavigationStack {
            Image(.image)
            Text("Welcome to Memor!")
                .padding(.bottom)
            Text("The Journaling App of Your Dreams!")
            NavigationLink(destination: DreamJournalView(), label: { Text("Dream Journal") })
                .foregroundColor(.white)
                .frame(width: 250, height: 75)
                .background(Color.blue)
                .padding(5)
        }
    }
}

#Preview {
    WelcomeView()
}

