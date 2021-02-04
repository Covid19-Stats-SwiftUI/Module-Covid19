//
//  File.swift
//  
//
//  Created by Ari Supriatna on 03/02/21.
//

import Foundation
import Covid19StatsCore

public struct CountryCaseStatsTransformer: Mapper {
  
  public typealias Response = [CountryCaseStatsResponse]
  public typealias Domain = [CountryCaseStatsModel]
  
  public init() { }
  
  public func transformResponseToDomain(response: [CountryCaseStatsResponse]) -> [CountryCaseStatsModel] {
    return response.map { result in
      return CountryCaseStatsModel(
        provinceState: result.provinceState ?? "Unknown",
        countryRegion: result.countryRegion ?? "Unknown",
        lastUpdate: result.lastUpdate ?? Date(),
        lat: result.lat ?? 0,
        long: result.long ?? 0,
        confirmed: result.confirmed ?? 0,
        recovered: result.recovered ?? 0,
        deaths: result.deaths ?? 0,
        active: result.active ?? 0,
        iso2: result.iso2 ?? ""
      )
    }
  }
  
}
