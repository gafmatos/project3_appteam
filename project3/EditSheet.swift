//
//  EditSheet.swift
//  project3
//
//  Created by Gabriel Matos on 27/10/26.
//
import SwiftUI

struct EditSheet: View {
    // TODO: Add title binding
    @Binding var title: String
    @Binding var selectedColor: Color
    
    
    var body: some View {
        VStack(spacing: 20) {
                // TODO: Add list.bullet.circle.fill icon and TextField
            Image(systemName: "list.bullet.circle.fill")
                           .font(.system(size: 80))
            
            TextField("List Name", text: $title)
                           .font(.title2)
                           .bold()
                           .multilineTextAlignment(.center)
                           .padding()
                           .background(Color.secondary.opacity(0.15), in: RoundedRectangle(cornerRadius: 16))
            
            ColorChooser(selectedColor: $selectedColor)
            
            Spacer()
        }
        .foregroundStyle(selectedColor)
        .padding()
    }
}

#Preview {
    @Previewable @State var title: String = "Reminders"
    @Previewable @State var selectedColor: Color = .red
    
    EditSheet(title: $title, selectedColor: $selectedColor)
        .preferredColorScheme(.dark)
}
