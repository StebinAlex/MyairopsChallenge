//
//  LastView.swift
//  MyairopsChallenge
//
//  Created by Stebin Alex on 14/03/23.
//

import SwiftUI

struct LastView: View {
    
    @Binding var path: Path
    
    var body: some View {
        Button {
            path.popToRoot()
        } label: {
            Text("Pop to root")
        }

    }
}

struct LastView_Previews: PreviewProvider {
    @State static var path = Path()
    static var previews: some View {
        LastView(path: $path)
    }
}



