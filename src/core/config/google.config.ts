/**
 * Google authentication configuration
 * Replace with your actual Google OAuth credentials
 */

export const GOOGLE_CONFIG = {
  webClientId: process.env.GOOGLE_WEB_CLIENT_ID || '',
  iosClientId: process.env.GOOGLE_IOS_CLIENT_ID || '',
  androidClientId: process.env.GOOGLE_ANDROID_CLIENT_ID || '',
} as const;
