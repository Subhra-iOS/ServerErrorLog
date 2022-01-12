
import Foundation

public struct ServerErrorLog: ServiceErrorAPIProtocol {
    
    private var webApiManager: WebAPIManager?
    
    public init(url: URL,
                header: [String : String],
                payload: ServicePayload){
        let errorBody = self.generate(body: payload)
        self.webApiManager = WebAPIManager(url: url, header: header, parameter: ["body": errorBody.param], method: errorBody.method)
    }
    
    private func generate(body: ServicePayload) -> (param: String, method: String){
        let response = body.response
        guard let error = body.error else{ return (param: "", method: "") }
        
        let errorBody = String(format: "Issue date: %@ \n\n Response: %@ \n\n Error: %@", arguments: [self.currentDate(), response.allHeaderFields, error.localizedDescription])
        
        return (param: errorBody, method: body.method)
    }
    
    private func currentDate() -> String{
        let dateFormate = DateFormatter()
        dateFormate.dateStyle = .full
        dateFormate.locale = Locale(identifier: "UTC")
        dateFormate.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        return dateFormate.string(from: Date())
    }
    
    public  func sendErrorLog(){
        
        guard let apiManager: WebAPIManager = self.webApiManager else { return }
        
        apiManager.sendError { (result) in
            switch result{
                case .success(_): print("Success")
                case .failure(let error): print("Error Log Service error description:\(error.localizedDescription)")
            }
        }
    }
}
