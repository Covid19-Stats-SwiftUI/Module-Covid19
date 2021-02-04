//
//  GetGlobalCaseStatsRepository.swift
//  
//
//  Created by Ari Supriatna on 03/02/21.
//

import Foundation
import Combine
import Covid19StatsCore

public struct GetGlobalCaseStatsRepository<
  GetGlobalCaseStatsRemoteDataSource: DataSource,
  Transformer: Mapper
>: Repository
where GetGlobalCaseStatsRemoteDataSource.Response == GlobalCaseStatsResponse,
      Transformer.Response == GlobalCaseStatsResponse,
      Transformer.Domain == GlobalCaseStatsModel {
  
  public typealias Request = Any
  public typealias Response = GlobalCaseStatsModel
  
  private let _remoteDataSource: GetGlobalCaseStatsRemoteDataSource
  private let _mapper: Transformer
  
  public init(remoteDataSource: GetGlobalCaseStatsRemoteDataSource, mapper: Transformer) {
    _remoteDataSource = remoteDataSource
    _mapper = mapper
  }
  
  public func execute(request: Any?) -> AnyPublisher<GlobalCaseStatsModel, Error> {
    _remoteDataSource.execute(request: nil)
      .map { _mapper.transformResponseToDomain(response: $0) }
      .eraseToAnyPublisher()
  }
  
}
