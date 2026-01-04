//
//  HesapView.swift
//  Hesap
//
//  Created by Engin Özyılmaz on 3.01.2026.
//

import SwiftUI

struct HesapView: View {
    
    @State var tutar: String = ""
    @State var kdvOran: Bool = true
    @State var stopajOran: Bool = true
    @State var tevkifatOran: Bool = false
    
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
                        GroupBox {
                            Toggle("KDV (%20)", isOn: $kdvOran)
                            Toggle("STOPAJ (%15)", isOn: $stopajOran)
                            Toggle("TEVKİFAT (%30)", isOn: $tevkifatOran)
                        }
                        .font(.headline)
//                            List{
//                                ForEach(vergiler, id:\.self) { vergi in
//                                    HStack{
//                                        Text(vergi)
//                                            .font(.headline)
//                                        Spacer()
//                                        Text("%20")
//                                    }
//                                    
//                                }
//                            }
//                            .listStyle(.inset)
                     Spacer()
                    }
                }
            }
            .navigationTitle("Fatura".uppercased())
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

#Preview {
    HesapView()
}
