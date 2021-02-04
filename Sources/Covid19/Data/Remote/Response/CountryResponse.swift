//
//  CountryResponse.swift
//  
//
//  Created by Ari Supriatna on 03/02/21.
//

import Foundation

public struct CountriesResponse: Decodable {
  
  public let countries: [CountryResponse]
  
}

public struct CountryResponse: Decodable {
  
  public let name: String
  public let iso2: String?
  
  public init(name: String, iso2: String?) {
    self.name = name
    self.iso2 = iso2
  }
  
}
