//
//  OrderView.swift
//  iDine
//
//  Created by Michael Schmidt on 12/2/22.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }//: HSTACK
                    } //: LOOP
                    .onDelete(perform: deleteItems)
                } //: SECTION
                Section {
                    NavigationLink("Place Order") {
                        CheckoutView()
                    }
                }
                .disabled(order.items.isEmpty)
            } //: LIST
            .navigationTitle("Order")
            .toolbar {
                EditButton()
            }
        } //: NAVSTACK
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
