//
//  ScintillaView.swift
//  AffenEditor
//
//  Created by Alex Seifert on 24.09.24.
//

import SwiftUI

import SwiftUI

struct ScintillaView: NSViewRepresentable {
    class Coordinator: NSObject {
        var parent: ScintillaView

        init(parent: ScintillaView) {
            self.parent = parent
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeNSView(context: Context) -> NSView {
        let view = NSView(frame: .zero)
        let sci = ScintillaViewController()
        sci.view.frame = view.bounds
        sci.view.autoresizingMask = [.width, .height]
        view.addSubview(sci.view)
        return view
    }

    func updateNSView(_ nsView: NSView, context: Context) {
        // Update the view if needed
    }
}

class ScintillaViewController: NSViewController {
    var sci: ScintillaView!

    override func viewDidLoad() {
        super.viewDidLoad()
//        sci = ScintillaView(frame: self.view.bounds)
//        sci.autoresizingMask = [.width, .height]
//        self.view.addSubview(sci)
//        setupScintilla()
    }

//    func setupScintilla() {
//        // Initialize and configure Scintilla
//        sci.sci_setLexer(SCLEX_CPP)
//        sci.sci_setKeyWords(0, "int float if else for while return")
//        sci.sci_setStyleBits(5)
//        sci.sci_setMarginWidthN(0, 40)
//        sci.sci_setCodePage(SC_CP_UTF8)
//        sci.sci_setText("int main() {\n    return 0;\n}")
//    }
}
