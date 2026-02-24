import Foundation
import UserNotifications

final class ClipFixNotifier: Sendable {
    static func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) { _, _ in }
    }

    static func send(cleanedText: String) {
        let content = UNMutableNotificationContent()
        content.title = "ClipFix"
        content.body = String(cleanedText.prefix(60)) + (cleanedText.count > 60 ? "..." : "")
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request)
    }
}
