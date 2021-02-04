//
//  GetCountryCaseStatsRepository.swift
//  
//
//  Created by Ari Supriatna on 03/02/21.
//

import Foundation
import Combine
import Covid19StatsCore

public struct GetCountryCaseStatsRepository<
  GetCountryCaseStatsRemoteDataSource: DataSource,
  Transformer: Mapper
>: Repository
where GetCountryCaseStatsRemoteDataSource.Response == [CountryCaseStatsResponse],
      Transformer.Response == [CountryCaseStatsResponse],
      Transformer.Domain == [CountryCaseStatsModel] {
  
  public typealias Request = CovidEndpoints.CaseType
  public typealias Response = [CountryCaseStatsModel]
  
  private let _remoteDataSource: GetCountryCaseStatsRemoteDataSource
  private let _mapper: Transformer
  
  public init(remoteDataSource: GetCountryCaseStatsRemoteDataSource, mapper: Transformer) {
    _remoteDataSource = remoteDataSource
    _mapper = mapper
  }
  
  public func execute(request: CovidEndpoints.CaseType?) -> AnyPublisher<[CountryCaseStatsModel], Error> {
    _remoteDataSource.execute(request: request as? GetCountryCaseStatsRemoteDataSource.Request)
      .map { _mapper.transformResponseToDomain(response: $0) }
      .eraseToAnyPublisher()
  }
}
