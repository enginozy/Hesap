//
//  HesapView.swift
//  Hesap
//
//  Created by Engin Özyılmaz on 3.01.2026.
//

import SwiftUI

struct HesapView: View {
    
    @State var tutar: String = ""
    @State var vergiler: [String] = [
        "KDV", "STOPAJ", "TEVKİFAT"
    ]
    
    var body: some View {
        NavigationStack {
            TabView {
                Tab("Fatura", systemImage: "pencil.line") {
                    VStack{
                        TextField("Tutar", text: $tutar)
                            .textFieldStyle(.roundedBorder)
                        Button {
                            
                        } label: {
                            Text("Hesapla")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.gray.opacity(0.3))
                                .cornerRadius(10)
                        }
                            List{
                                ForEach(vergiler, id:\.self) { vergi in
                                    HStack{
                                        Text(vergi)
                                        Spacer()
                                        Text("%20")
                                    }
                                    
                                }
                            }
                            .listStyle(.inset)
                        
                    }
                }
            }
            .navigationTitle("Fatura".uppercased())
            
        }
    }
}

#Preview {
    HesapView()
}
