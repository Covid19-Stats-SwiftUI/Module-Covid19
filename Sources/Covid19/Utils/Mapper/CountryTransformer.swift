//
//  CountryTransformer.swift
//  
//
//  Created by Ari Supriatna on 03/02/21.
//

import Foundation
import Covid19StatsCore

public struct CountryTransformer: Mapper {

  public typealias Response = [CountryResponse]
  public typealias Domain = [CountryModel]
  
  public init() { }
  
  public func transformResponseToDomain(response: [CountryResponse]) -> [CountryModel] {
    return response.map {
      return CountryModel(name: $0.name, iso2: $0.iso2 ?? "")
    }
  }
}
