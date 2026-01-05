/**
 * Notification service
 * This will be configured when we add notification dependencies
 */

// Placeholder for notification service
// Will be implemented when adding notification integration

export class NotificationService {
  static async requestPermission(): Promise<boolean> {
    // TODO: Request notification permission
    return false;
  }

  static async getToken(): Promise<string | null> {
    // TODO: Get FCM/APNS token
    return null;
  }

  static async sendNotification(): Promise<void> {
    // TODO: Send notification
  }
}
