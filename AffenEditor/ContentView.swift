//
//  ContentView.swift
//  AffenEditor
//
//  Created by Alex Seifert on 24.09.24.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: AffenEditorDocument

    var body: some View {
        NavigationView {
            SidebarView()
//            TextEditor(text: $document.text)
            ScintillaView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    ContentView(document: .constant(AffenEditorDocument()))
}
