//
//  UILabel+Additions.swift
//  iAugus
//
//  Created by Augus on 6/7/15.
//  Copyright (c) 2015 Augus. All rights reserved.
//

import UIKit

// calculate size of UILabel with string
func ausFrameSizeForText(text: NSString, maximumSize: CGSize) -> CGRect{
    let attrString = NSAttributedString(string: text as String)
    return attrString.boundingRectWithSize(maximumSize, options: NSStringDrawingOptions.UsesLineFragmentOrigin, context: nil)
    
}

func ausFrameSizeForText(text: NSString, font: UIFont, maximumSize: CGSize) -> CGRect{
    return text.boundingRectWithSize(maximumSize, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
}

func ausFrameSizeForText(label: UILabel, text: NSString, maximum: CGSize) -> CGRect{
    label.attributedText = NSAttributedString(string: text as String)
    let requireSize = label.sizeThatFits(maximum)
    var labelFrame = label.frame
    labelFrame.size.height = requireSize.height
    label.frame = labelFrame
    return label.frame
}


extension UILabel {
    
    /**
    Methods to allow using HTML code with CoreText
    
    */
    func ausAttributedText(data: String) {
        do {
            let formatedData = data.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
            let text = try NSAttributedString(data: formatedData.dataUsingEncoding(NSUnicodeStringEncoding,allowLossyConversion: false)!,
                options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
                documentAttributes: nil)
            self.attributedText = text
        }catch{
            print("something error with NSAttributedString")
        }
    }
    
    func ausGetLabelSize() -> CGSize {
        let constraint = CGSizeMake(self.frame.width, CGFloat.max)
        
        let context = NSStringDrawingContext()
        let boundingBox = self.text?.boundingRectWithSize(constraint, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: self.font], context: context).size
        let size = CGSizeMake(ceil(boundingBox!.width), ceil(boundingBox!.height))
        
        return size
    }
    
    func ausGetLabelNumberOfLines() -> Int {
        let textStorage = NSTextStorage(string: self.text!, attributes: [NSFontAttributeName: self.font])
        
        let textContainer = NSTextContainer(size: self.ausGetLabelSize())
        textContainer.lineBreakMode = .ByWordWrapping
        textContainer.maximumNumberOfLines = 0
        textContainer.lineFragmentPadding = 0
        
        let layoutManager = NSLayoutManager()
        layoutManager.textStorage = textStorage
        layoutManager.addTextContainer(textContainer)
        
        var numberOfLines = 0
        var index = 0
        var lineRange : NSRange = NSMakeRange(0, 0)
        for (; index < layoutManager.numberOfGlyphs; numberOfLines++) {
            layoutManager.lineFragmentRectForGlyphAtIndex(index, effectiveRange: &lineRange)
            index = NSMaxRange(lineRange)
        }
        
        return numberOfLines
    }
    
    func ausCalculateLabelSizeToFit() {

        let constraint = CGSizeMake(self.frame.width, CGFloat.max)
        
        let context = NSStringDrawingContext()
        let boundingBox = self.text?.boundingRectWithSize(constraint, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: self.font], context: context).size
        let size = CGSizeMake(ceil(boundingBox!.width), ceil(boundingBox!.height))
        
        var frame = self.frame
        frame.size.height = size.height
        self.frame = frame
        
    }
    
    
}
