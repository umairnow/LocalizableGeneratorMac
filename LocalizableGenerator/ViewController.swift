//
//  ViewController.swift
//  LocalizableGenerator
//
//  Created by Umair Aamir on 11/16/17.
//
//  MIT License

//  Copyright (c) 2017 umairnow

//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//ss

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var textView: NSTextView!
    @IBOutlet weak var lblMessage: NSTextField!
    @IBOutlet weak var secLangKey: NSTextField!
    @IBOutlet weak var firstLangKey: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func onGenerateFilesClicked(_ sender: Any) {
        guard firstLangKey.stringValue.isEmpty == false,
            secLangKey.stringValue.isEmpty == false else {
                showError("Please enter langauge keys")
                return
        }
        if let jsonString = textView.textStorage?.string {
            let parser: JsonParserProtocol = JsonParser()
            do {
                let dictionary = try parser.parseJson(jsonString)
                let generator: GeneratorProtocol = Generator()
                let path = generator.generateFiles(from: dictionary, with: firstLangKey.stringValue, and: secLangKey.stringValue)
                lblMessage.isHidden = false
                lblMessage.textColor = NSColor.black
                lblMessage.stringValue = "Saved At: \(path)"
                NSWorkspace.shared.openFile(path)
            } catch {
                showError(error.localizedDescription)
            }
        }
    }

    private func showError(_ message: String) {
        lblMessage.isHidden = false
        lblMessage.textColor = NSColor.red
        lblMessage.stringValue = message
    }
}

