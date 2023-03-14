//
//  ContactsView.swift
//  MyairopsChallenge
//
//  Created by Stebin Alex on 13/03/23.
//

import SwiftUI

struct ContactsView: View {
     
    @Environment(\.colorScheme) var colorScheme
    @State private var path: Path = []
    
    var body: some View {
        Route.NavigationContainerView(path: $path) {
            ScrollView {
                VStack {
                    ForEach(contacts, id: \.id) { item in
                        contactItemView(item)
                            .onTapGesture {
                                path.push(to: .ContactDetail(item))
                            }
                    }
                }
            }
            .navigationTitle("Contacts")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}

extension ContactsView {
    private func contactItemView(_ item: Contact) -> some View {
        return ZStack {
            colorScheme == .light ? Color.white : Color.black
            HStack {
                Image(systemName: "person.crop.circle")
                    .font(.title)
                    .padding(5)
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.title3.bold())
                        .minimumScaleFactor(0.01)
                    Text(item.phone)
                        .font(.callout)
                        .minimumScaleFactor(0.01)
                }
                Spacer()
            }
            .padding(.horizontal)
        }
        .frame(height: 80)
        .cornerRadius(10)
        .shadow(color: colorScheme == .light ? Color.gray : Color.white.opacity(0.5), radius: 5)
        .padding()
    }
}
