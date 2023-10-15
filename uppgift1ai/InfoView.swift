//
//  InfoView.swift
//  uppgift1ai
//
//  Created by oscar gynning on 2023-10-15.
//

import SwiftUI

struct InfoView: View {
    var frukten : String
    var body: some View {
        Text(frukten)
    }
}

#Preview {
    InfoView(frukten:"")
}
