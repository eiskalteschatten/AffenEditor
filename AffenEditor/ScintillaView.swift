//
//  ScintillaView.swift
//  AffenEditor
//
//  Created by Alex Seifert on 24.09.24.
//

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
    var sci: ScintillaNSView!

    override func loadView() {
        self.view = NSView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        sci = ScintillaNSView(frame: self.view.bounds)
        sci.autoresizingMask = [.width, .height]
        self.view.addSubview(sci)
        setupScintilla()
    }

    func setupScintilla() {
        // Initialize and configure Scintilla
        sci.sci_setLexer(SCLEX_CPP)
        sci.sci_setKeyWords(0, "int float if else for while return")
        sci.sci_setStyleBits(5)
        sci.sci_setMarginWidthN(0, 40)
        sci.sci_setCodePage(SC_CP_UTF8)
        sci.sci_setText("int main() {\n    return 0;\n}")
    }
}

class ScintillaNSView: NSView {
    var sci: Scintilla!

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        sci = Scintilla()
        self.addSubview(sci)
        sci.frame = self.bounds
        sci.autoresizingMask = [.width, .height]
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func sci_setLexer(_ lexer: Int32) {
        sci.sci_setLexer(lexer)
    }

    func sci_setKeyWords(_ keywordSet: Int32, _ keywords: String) {
        sci.sci_setKeyWords(keywordSet, keywords)
    }

    func sci_setStyleBits(_ bits: Int32) {
        sci.sci_setStyleBits(bits)
    }

    func sci_setMarginWidthN(_ margin: Int32, _ pixelWidth: Int32) {
        sci.sci_setMarginWidthN(margin, pixelWidth)
    }

    func sci_setCodePage(_ codePage: Int32) {
        sci.sci_setCodePage(codePage)
    }

    func sci_setText(_ text: String) {
        sci.sci_setText(text)
    }
}
