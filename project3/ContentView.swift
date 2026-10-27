//
//  ContentView.swift
//  project3
//
//  Created by Gabriel Matos on 27/10/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isEditing: Bool = false
    // TODO: Add an @State property to hold a RemindersPage struct
    @State private var page: RemindersPage = RemindersPage(title: "Reminders", items: [Reminder(title: "Buy stuff"), Reminder(title: "Do stuff")], color: Color.blue)
    
    var body: some View {
        VStack {
            // TODO: Add header view
            HStack {
                Text(page.title)
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(page.color)
                    
                Spacer()
                    
                    Button {
                        isEditing = true
                    } label: {
                        Image(systemName: "elblipsis.circle")
                            .font(.title2)
                    }
                    .tint(page.color)
                }
                .padding(.horizontal)
                
                List {
                    ForEach($page.items) { $reminder in
                        HStack {
                            Button {
                                reminder.isCompleted.toggle()
                            } label: {
                                Image(systemName: reminder.isCompleted ? "largecircle.fill.circle" : "circle")
                                    .font(.title2)
                                    .foregroundStyle(page.color)
                            }
                            .buttonStyle(.plain)
                            
                            TextField("New Reminder", text: $reminder.title)
                                .foregroundStyle(reminder.isCompleted ? Color.secondary : Color.primary)
                        }
                    }
                    .onDelete { indexSet in
                        page.items.remove(atOffsets: indexSet)
                    }
                }
                .listStyle(.plain)
        
            // TODO: Add footer view

        }
        .sheet(isPresented: $isEditing) {
            // TODO: Add remaining binding
            EditSheet(title: $page.title, selectedColor: $page.color)
                .presentationDetents([.medium])
        }
    }
}

#Preview {
    ContentView()
}
