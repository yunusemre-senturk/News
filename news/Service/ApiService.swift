//
//  ApiService.swift
//  news
//
//  Created by Yunus Emre Şentürk on 1.03.2024.
//

import Foundation

class ApiService {
    let headers = [
        "content-type": "application/json",
        "authorization": "apikey 3Xi2HWV8J6PzNJJ441Nb8L:6NHDJ3fsnkXbnEHW5hDlI7"
    ]
    
    func fetchNews(tag: String?, completion: @escaping (Result<News, Error>) -> Void) {
        guard let url = URL(string: "https://api.collectapi.com/news/getNews?country=tr&tag=general") else { return }
        
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        let sessionConfig = URLSessionConfiguration.default // SSL Doğrulama Yapılandırmasını
        
        sessionConfig.waitsForConnectivity = false
        sessionConfig.tlsMinimumSupportedProtocolVersion = .TLSv12
        sessionConfig.tlsMaximumSupportedProtocolVersion = .TLSv12
        sessionConfig.timeoutIntervalForResource = 30
        sessionConfig.connectionProxyDictionary = [kCFProxyTypeKey: kCFProxyTypeNone]
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: OperationQueue.main)
        
        session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                // Veriyi işlemek için buraya kodlarınızı ekleyin
                do {
                    let decoder = JSONDecoder()
                    let news = try decoder.decode(News.self, from: data)
                    print(news)
                    completion(.success(news))
                    
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
