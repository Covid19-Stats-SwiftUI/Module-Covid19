//
//  File.swift
//  
//
//  Created by Ari Supriatna on 03/02/21.
//

import Foundation
import Covid19StatsCore

public struct CountryModel: Equatable, Identifiable {
  
  public let id = UUID()
  public let name: String
  public let iso2: String
  
  public init(name: String, iso2: String) {
    self.name = name
    self.iso2 = iso2
  }
  
  public var displayName: String {
    return "\(iso2.flag) \(name)"
  }
  
  public var titleHeader: String {
    return "\(name) \(iso2.flag)"
  }
  
  public var url: URL {
    let string = "stats://search?id=\(id)&name=\(name)&iso=\(iso2)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    return URL(string: string)!
  }
  
}
