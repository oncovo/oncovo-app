/**
 * Application configuration
 * Centralized configuration for the app
 */

export const APP_CONFIG = {
  name: 'OncovoApp',
  displayName: 'Oncovo',
  bundleId: {
    android: 'com.oncovoapp',
    ios: 'com.oncovoapp',
  },
  environment: __DEV__ ? 'development' : 'production',
} as const;
