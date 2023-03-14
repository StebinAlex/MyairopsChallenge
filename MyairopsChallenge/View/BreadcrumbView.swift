//
//  BreadcrumbView.swift
//  MyairopsChallenge
//
//  Created by Stebin Alex on 14/03/23.
//

import SwiftUI

struct BreadcrumbView: View {
    
    enum Position { case  previous, current, next }
    var onTapEnabled: Bool = true
    let allCases = FlightStatus.allCases
    let lightGray: Color = .gray.opacity(0.3)
    @Binding var flightStatus: FlightStatus
     
    
    var body: some View {
        
        GeometryReader { proxy in
            HStack(spacing: 0) {
                ForEach (allCases, id: \.id) { item in 
                    VStack {
                        HStack(spacing: 0) {
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(leftBarColorFor(item: item))
                            Text("\(item.index + 1)")
                                .foregroundColor(.white)
                                .font(.subheadline.bold())
                                .frame(width: 10)
                                .padding(12)
                                .background {
                                    Circle()
                                        .foregroundColor(color(for: item))
                                }
                                .onTapGesture {
                                    if onTapEnabled {
                                        flightStatus = item
                                    }
                                }
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(rightBarColorFor(item: item))
                        }
                        Text(item.rawValue)
                            .font(.system(size: 10))
                    }
                        .frame(width: (proxy.size.width) / CGFloat(allCases.count))
                    
                }
            }
            .frame(maxHeight: .infinity)
        }
        .padding(.horizontal)
        .animation(.default, value: UUID())
    }
        
}

struct BreadcrumbView_Previews: PreviewProvider {
    @State static var s: FlightStatus = .Fuel
    static var previews: some View {
        BreadcrumbView(flightStatus: $s)
            .frame(width: 500) 
            .previewLayout(.sizeThatFits)
    }
}

extension BreadcrumbView {
    
    private func isCovered(element: FlightStatus, position: Position = .current) -> Bool {
        switch position {
        case .previous:
            return  element.index <= flightStatus.index
        case .current:
            return element.index == flightStatus.index
        case .next:
            return  element.index < flightStatus.index
        }
    }
    
    private func color(for item: FlightStatus) -> Color {
        if item.index <= flightStatus.index {
            return .blue
        } else {
            return lightGray
        }
    }
    
    private func leftBarColorFor(item: FlightStatus) -> Color {
        return item.index == 0 ? .clear : isCovered(element: item, position: .previous) ? .blue : lightGray
    }
    private func rightBarColorFor(item: FlightStatus) -> Color {
        return item.index == allCases.count - 1 ? .clear : isCovered(element: item, position: .next) ? .blue : lightGray
    }
    
}
