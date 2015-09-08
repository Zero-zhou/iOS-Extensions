//
//  UITextView+Additions.swift
//  iBBS
//
//  Created by Augus on 9/8/15.
//  Copyright © 2015 iAugus. All rights reserved.
//

import Foundation

extension UITextView {
    
    /**
    Methods to allow using HTML code with CoreText
    
    */

    func ausAttributedText(data: String) {
        do {
            let text = try NSAttributedString(data: data.dataUsingEncoding(NSUnicodeStringEncoding,allowLossyConversion: false)!,
                options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
                documentAttributes: nil)
            self.attributedText = text
        }catch{
            print("something error with NSAttributedString")
        }
    }
    
    /**
    calculate size of text view
    
    :returns: CGSize
    */
    func ausTextViewFrameSize() -> CGSize{
        let fixedWidth = self.frame.size.width
        self.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
        let newSize = self.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
        var newFrame = self.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        self.frame = newFrame
        return self.frame.size
    }

}