import Foundation

// Decodable structs for parsing the GPT response
struct GPTResponse: Decodable {
    let choices: [Choice]
}

struct Choice: Decodable {
    let message: Message
}

struct Message: Decodable {
    let content: String
}

// Define the GPTNetwork actor
actor GPTNetwork {

    private let APIKey = "your api key"
    private let url = "https://api.openai.com/v1/chat/completions"
    private let basePrompt = "I need 100 words about this subject in Swift formatted array"
    var request: URLRequest?

    // MARK: - Initializers
    init() {
        setupRequest()
    }

    // MARK: - Private Methods
    private func setupRequest() {
        guard let apiUrl = URL(string: url) else { return }
        self.request = URLRequest(url: apiUrl)
        self.request?.httpMethod = "POST"
        self.request?.setValue("application/json", forHTTPHeaderField: "Content-Type")
        self.request?.setValue("Bearer \(APIKey)", forHTTPHeaderField: "Authorization")
    }

    // Public method to get GPT response
    public func getGPTResponse(subject: String) async throws -> String {
        LoadingManager.shared.isLoading = true

        guard var request else {
            LoadingManager.shared.isLoading = false
            return "Invalid request"
        }
        request.httpBody = try JSONSerialization.data(withJSONObject: setupRequestData(with: subject))

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let gptResponse = try JSONDecoder().decode(GPTResponse.self, from: data)
            LoadingManager.shared.isLoading = false

            return gptResponse.choices.first?.message.content ?? "No response"
        } catch {
            LoadingManager.shared.isLoading = false
            throw error
        }
    }

    private func setupRequestData(with subject: String) -> [String: Any] {
        return [
            "model": "gpt-4o-mini",
            "messages": [
                ["role": "system", "content": "You are interacting with a language model."],
                ["role": "user", "content": "Subject: \(subject)."]
            ]
        ]
    }
}

//// Dummy LoadingManager for demonstration
//class LoadingManager {
//    static let shared = LoadingManager()
//    var isLoading: Bool = false
//}
