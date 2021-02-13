//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Scott Obara on 12/2/21.
//

import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var singers: FetchedResults<T> { fetchRequest.wrappedValue }

    // this is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content

    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            self.content(singer)
        }
    }

    
    init(filterKey: String, filterValue: String, beginsContainsEnds: String, sortKeyPath: KeyPath<T, String>, sortAscending: Bool, @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Singer.lastName, ascending: sortAscending)], predicate: NSPredicate(format: "%K \(beginsContainsEnds) %@", filterKey, filterValue))
        self.content = content
    }
}
