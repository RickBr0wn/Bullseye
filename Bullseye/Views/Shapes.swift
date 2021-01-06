//
//  Shapes.swift
//  Bullseye
//
//  Created by Rick Brown on 06/01/2021.
//

import SwiftUI

struct Shapes: View {
  @State private var wideShape = true
  
  var body: some View {
    VStack {
      if !wideShape {
        Circle()
          .strokeBorder(Color.blue, lineWidth: Constants.General.wideStrokeWidth)
          .frame(width: 200, height: 100)
          .transition(.scale)
      }
      RoundedRectangle(cornerRadius: Constants.General.wideStrokeWidth)
        .fill(Color.blue)
        .frame(width: wideShape ? 200 : 100, height: 100)
      Capsule()
        .fill(Color.blue)
        .frame(width: wideShape ? 200 : 100, height: 100)
      Ellipse()
        .fill(Color.blue)
        .frame(width: wideShape ? 200 : 100, height: 100)
      
      Button(action: {
        withAnimation {
          wideShape.toggle()
        }
        
      }) {
        Text("TOGGLE")
      }
    }
    .background(Color.green)
  }
}

struct Shapes_Previews: PreviewProvider {
  static var previews: some View {
    Shapes()
  }
}
