//
//  EmojiArtDocumentChooser.swift
//  EmojiArt Self Study
//
//  Created by Garrick Henne on 2020-06-17.
//  Copyright © 2020 Garrick Henne. All rights reserved.
//

import SwiftUI

struct EmojiArtDocumentChooser: View {
    @EnvironmentObject var store: EmojiArtDocumentStore
    
    @State private var editMode: EditMode = .inactive
    var body: some View {
        NavigationView {
            List {
                ForEach(store.documents) { document in
                    NavigationLink(destination: EmojiArtDocumentView(document: document)
                        .navigationBarTitle(self.store.name(for: document))
                    ) {
                        EditableText(self.store.name(for: document), isEditing: self.editMode.isEditing) { name in
                            self.store.setName(name, for: document)
                        }
                    }
                }
                    // slide to delete
                .onDelete { indexSet in
                    indexSet.map { self.store.documents[$0] }.forEach { document in
                        self.store.removeDocument(document)
                    }
                }
            }
            .navigationBarTitle(self.store.name)
            .navigationBarItems(
                leading: Button(action: {
                    self.store.addDocument()
            }, label: {
                Image(systemName: "plus").imageScale(.large)
                }),
                    trailing: EditButton() // Adds edit button that lets you delete multiple, needs onDelete from above
            )
            .environment(\.editMode, $editMode)
        }
    }
}




struct EmojiArtDocumentChooser_Previews: PreviewProvider {
    static var previews: some View {
        EmojiArtDocumentChooser()
    }
}
