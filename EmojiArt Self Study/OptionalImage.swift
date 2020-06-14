//
//  OptionalImage.swift
//  EmojiArt Self Study
//
//  Created by Garrick Henne on 2020-06-14.
//  Copyright © 2020 Garrick Henne. All rights reserved.
//

import SwiftUI

struct OptionalImage: View {
    var uiImage: UIImage?
    
    var body: some View {
        Group {
            if uiImage != nil {
                Image(uiImage: uiImage!)
            }
        }
    }
}

