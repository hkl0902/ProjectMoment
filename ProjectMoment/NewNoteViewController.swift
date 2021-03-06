//
//  NewNoteViewController.swift
//  ProjectMoment
//
//  Created by Hyunkyu Lee on 8/6/16.
//  Copyright © 2016 Hyunkyu Lee. All rights reserved.
//

import UIKit

class NewNoteViewController: UIViewController, UITextViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextViews()
        updateNavigationBar()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - UI
    
    private var titleTextView: UITextView? {
        didSet {
            titleTextView?.delegate = self
        }
    }
    private var noteTextView: UITextView? {
        didSet {
            noteTextView?.delegate = self
        }
    }
    
    private func setTextViews() {
        self.view.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(1) // Otherwise the background is black
        
        let navigationBarHeight = self.navigationController?.navigationBar.frame.height
        
        // Will act as a buffer view to hopefully line up titleTextView and its textInputView
        let bufferViewRect = CGRect(x: 0, y: 0, width: self.view.frame.width, height: navigationBarHeight!)
        let bufferView = UIView(frame: bufferViewRect)
        self.view.addSubview(bufferView)
        
        // Title Text View Setup
        
        let titleTextOrigin: CGPoint = {
            let x = self.view.frame.width*0.1
            let y = x + navigationBarHeight!
            return CGPoint(x: x, y: y)
        }()
        
        // TODO: - Change the way the placeholder is set, especially the text
        let titleTextViewRect = CGRect(origin: titleTextOrigin, size: CGSize(width: self.view.frame.width*0.8, height: 0))
        titleTextView = UITextView(frame: titleTextViewRect)
        titleTextView?.text = "Hello"
        titleTextView?.scrollEnabled = false
        fixSize(ofTextView: titleTextView!)
        
        // ================================================================== //
        
        // Note Text View Setup
        
        let noteTextOrigin: CGPoint = {
            let x = self.view.frame.width*0.1
            let y = (titleTextView?.frame.maxY)! + 8                              // TODO: - Change this arbitrary  number to a variable
           
            return CGPoint(x: x, y: y)
        }()
        
        let noteTextViewRect = CGRect(origin: noteTextOrigin, size: CGSize(width: titleTextView!.frame.width, height: 0))
        
        noteTextView = UITextView(frame: noteTextViewRect)
        noteTextView?.attributedText = NSAttributedString(string: "Note", attributes: [NSForegroundColorAttributeName: UIColor.grayColor()])
        fixSize(ofTextView: noteTextView!)
        
        titleTextView?.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.1)
        noteTextView?.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.1)
        
        // ================================================================== //
        
        self.view.addSubview(titleTextView!)
        self.view.addSubview(noteTextView!)
    }
    
    private var addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: nil, action: nil)
    
    private func updateNavigationBar() {
        // set the title of the notebook, default notebook if no notebook selected
        // add more complicated code later
        self.navigationItem.rightBarButtonItem = addButton
        if titleTextView?.text == nil || noteTextView?.text == nil {          // TODO: - Change the color of the bar button item
            addButton.enabled = false
        } else {
            addButton.enabled = true
        }
    }
    
    private func fixSize(ofTextView view: UITextView) {
        let width = view.frame.size.width
        let newSize = view.sizeThatFits(CGSize(width: width, height: CGFloat.max))
        var newFrame = view.frame
        newFrame.size = CGSize(width: max(newSize.width, width), height: newSize.height)
        view.frame = newFrame
    }
    
    private func fixPlacementOfViews() {
        guard let titleView = titleTextView, let newNoteView = noteTextView else { return }
        fixSize(ofTextView: titleView)
        fixSize(ofTextView: newNoteView)
        let newNoteTextViewOrigin: CGPoint = {
            let x = newNoteView.frame.origin.x
            let y = titleView.frame.maxY + 8                                    // TODO: - Change this arbitrary number to a variable
            return CGPoint(x: x, y: y)
        }()
        
        newNoteView.frame = CGRect(origin: newNoteTextViewOrigin, size: newNoteView.frame.size)
    }
    
    // MARK: - UITextView Delegation
    
    // Responding to Editing Notifications
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        return true
        
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        
    }
    
    func textViewShouldEndEditing(textView: UITextView) -> Bool {
        return true
        
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        
    }
    
    // Responding to Text Changes
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        fixSize(ofTextView: textView)
        fixPlacementOfViews()
        return true
        
    }
    
    func textViewDidChange(textView: UITextView) {
        
    }
    
    // Responding to Selection Changes
    
    func textViewDidChangeSelection(textView: UITextView) {
        
    }
    
    // Interacting with Text Data 
    
    func textView(textView: UITextView, shouldInteractWithTextAttachment textAttachment: NSTextAttachment, inRange characterRange: NSRange) -> Bool {
        return false
        
    }
    
    func textView(textView: UITextView, shouldInteractWithURL URL: NSURL, inRange characterRange: NSRange) -> Bool {
        return false
        
    }
}
