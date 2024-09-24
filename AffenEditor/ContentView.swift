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
        TextEditor(text: $document.text)
    }
}

#Preview {
    ContentView(document: .constant(AffenEditorDocument()))
}
