//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Rick Brown on 05/01/2021.
//

import SwiftUI

struct RoundedImageViewStroked: View {
  var systemName: String
  
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("TextColor"))
      .frame(width: 56, height: 56)
      .overlay(Circle()
                .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0)
      )
  }
}

struct RoundedImageViewFilled: View {
  var systemName: String
  
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("ButtonFilledTextColor"))
      .frame(width: 56, height: 56)
      .background(Circle()
                    .fill(Color("ButtonFilledBackgroundColor")))
  }
}

struct RoundRectTextView: View {
  var number: Int
  
  var body: some View {
    Text(String(number))
      .font(.title3)
      .kerning(-0.2)
      .bold()
      .frame(width: 68, height: 56)
      .foregroundColor(Color("TextColor"))
      .overlay(RoundedRectangle(cornerRadius: 21.0)
                .stroke(lineWidth: 2.0)
                .foregroundColor(Color("ButtonStrokeColor"))
                
      )
      
  }
}

struct PreviewView: View {
  var body: some View {
    VStack(spacing: 20.0) {
      RoundedImageViewStroked(systemName: "arrow.counterclockwise")
      
      RoundedImageViewFilled(systemName: "list.dash")
      
      RoundRectTextView(number: 15)
    }
  }
}

struct RoundedViews_Previews: PreviewProvider {
  static var previews: some View {
    PreviewView()
    
    PreviewView()
      .preferredColorScheme(.dark)
  }
}
