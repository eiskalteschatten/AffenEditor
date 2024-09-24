//
//  AffenEditorApp.swift
//  AffenEditor
//
//  Created by Alex Seifert on 24.09.24.
//

import SwiftUI

@main
struct AffenEditorApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: AffenEditorDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
