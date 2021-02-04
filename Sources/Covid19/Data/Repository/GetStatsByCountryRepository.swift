//
//  GetStatsByCountryRepository.swift
//  
//
//  Created by Ari Supriatna on 03/02/21.
//

import Foundation
import Combine
import Covid19StatsCore

public struct GetStatsByCountryRepository<
  GetStatsByCountryRemoteDataSource: DataSource,
  Transformer: Mapper
>: Repository
where GetStatsByCountryRemoteDataSource.Response == GlobalCaseStatsResponse,
Transformer.Response == GlobalCaseStatsResponse,
Transformer.Domain == GlobalCaseStatsModel {
  
  public typealias Request = String
  public typealias Response = GlobalCaseStatsModel
  
  private let _remoteDataSource: GetStatsByCountryRemoteDataSource
  private let _mapper: Transformer
  
  public init(remoteDataSource: GetStatsByCountryRemoteDataSource, mapper: Transformer) {
    _remoteDataSource = remoteDataSource
    _mapper = mapper
  }
  
  public func execute(request: String?) -> AnyPublisher<GlobalCaseStatsModel, Error> {
    _remoteDataSource.execute(request: request as? GetStatsByCountryRemoteDataSource.Request)
      .map { _mapper.transformResponseToDomain(response: $0) }
      .eraseToAnyPublisher()
  }
  
}
