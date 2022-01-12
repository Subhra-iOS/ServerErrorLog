# ServerErrorLog

A description of this package.

We can plug in the service log package to application to track the error log in application. We just need to define Backend error track service API, headers and Error data like (response headers and error descriptions).

let service = ServerErrorLog(url: URL,
header: [String : String],
payload: ServicePayload)

service.sendErrorLog()
