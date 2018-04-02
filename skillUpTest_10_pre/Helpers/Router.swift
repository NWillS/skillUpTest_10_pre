
import Alamofire

enum Router: URLRequestConvertible {
    
    static let baseURLString = "https://itunes.apple.com/"
    
    case search([String: Any])
        
    /// URLリクエストを作成する
    ///
    /// - Returns: URLリクエスト
    func asURLRequest() throws -> URLRequest {
        
        let (method, path, parameters): (HTTPMethod, String, [String: Any]) = {
            
            switch self {
            case .search(let params):
                return (.get, "search", params)
            }
            
        }()
        
        let url = URL(string: Router.baseURLString)
        var urlRequest = URLRequest(url: url!.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        return try Alamofire.URLEncoding.default.encode(urlRequest, with: parameters)
    }
}
