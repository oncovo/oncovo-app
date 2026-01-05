/**
 * Version constants for the application
 * Centralized version management for Android and iOS
 */

export const APP_VERSION = {
  major: 1,
  minor: 0,
  patch: 0,
  build: 1,
} as const;

export const getVersionName = (): string => {
  return `${APP_VERSION.major}.${APP_VERSION.minor}.${APP_VERSION.patch}`;
};

export const getVersionCode = (): number => {
  return APP_VERSION.build;
};
