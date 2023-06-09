import Foundation

enum Secrets {
    enum CI {
        static let githubId = Bundle.main.infoDictionary?["GITHUBID"] as! String
        static let githubSecret = Bundle.main.infoDictionary?["GITHUBSECRET"] as! String
    }

    enum GitHub {
        static let clientId = Secrets.environmentVariable(named: "GITHUB_CLIENT_ID") ?? CI.githubId
        static let clientSecret = Secrets.environmentVariable(named: "GITHUB_CLIENT_SECRET") ?? CI.githubSecret
    }

    private static func environmentVariable(named: String) -> String? {
        let processInfo = ProcessInfo.processInfo
        guard let value = processInfo.environment[named] else {
            print("Missing Environment Variabled : '\(named)'")
            return nil
        }
        return value
    }
}
