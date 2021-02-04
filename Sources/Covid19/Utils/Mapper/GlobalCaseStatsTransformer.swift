//
//  GlobalCaseStatsTransformer.swift
//  
//
//  Created by Ari Supriatna on 03/02/21.
//

import Foundation
import Covid19StatsCore

public struct GlobalCaseStatsTransformer: Mapper {
  
  public typealias Response = GlobalCaseStatsResponse
  public typealias Domain = GlobalCaseStatsModel
  
  public init() { }
  
  public func transformResponseToDomain(response: GlobalCaseStatsResponse) -> GlobalCaseStatsModel {
    
    let confirmed = GlobalCaseStatsModel.ValueModel(value: response.confirmed.value)
    let recoverd = GlobalCaseStatsModel.ValueModel(value: response.recovered.value)
    let deaths = GlobalCaseStatsModel.ValueModel(value: response.deaths.value)
    
    return GlobalCaseStatsModel(confirmed: confirmed, recovered: recoverd, deaths: deaths)
  }
  
}
