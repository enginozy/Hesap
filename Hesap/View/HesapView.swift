//
//  HesapView.swift
//  Hesap
//
//  Created by Engin Özyılmaz on 3.01.2026.
//

import SwiftUI

struct HesapView: View {
    
    @State var selectedTab: Int = 0
    @State var tutar: String = ""
    @State var kdvOran: Bool = true
    @State var stopajOran: Bool = true
    @State var tevkifatOran: Bool = false
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
                Tab("Fatura", systemImage: "pencil.line", value: 0) {
                    VStack{
                        TextField("Tutar", text: $tutar)
                            .textFieldStyle(.roundedBorder)
                        ButtonView()
                        groupView
                        
                        Spacer()
                    }
                }
            }
            .navigationTitle("Fatura".uppercased())
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    // var extracted codes
    
    var groupView: some View {
        GroupBox {
            Toggle("KDV (%20)", isOn: $kdvOran)
            Toggle("STOPAJ (%15)", isOn: $stopajOran)
                .tint(Color.red)
            HStack {
                Toggle("TEVKİFAT (%30)", isOn: $tevkifatOran)
                    .toggleStyle(.button)
                Spacer()
                Text(tevkifatOran ? "VAR" : "YOK" )
            }
        }
        .font(.headline)
    }
}

// subView extract codes

struct ButtonView : View {
    var body: some View {
        Button {
            
        } label: {
            Text("Hesapla")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
        }
    }
}

#Preview {
    HesapView()
}
