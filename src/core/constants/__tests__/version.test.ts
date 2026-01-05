/**
 * Version constants tests
 */

import { APP_VERSION, getVersionName, getVersionCode } from '../version';

describe('Version Constants', () => {
  it('should have valid version structure', () => {
    expect(APP_VERSION.major).toBeGreaterThanOrEqual(0);
    expect(APP_VERSION.minor).toBeGreaterThanOrEqual(0);
    expect(APP_VERSION.patch).toBeGreaterThanOrEqual(0);
    expect(APP_VERSION.build).toBeGreaterThan(0);
  });

  it('should return correct version name', () => {
    const versionName = getVersionName();
    expect(versionName).toMatch(/^\d+\.\d+\.\d+$/);
    expect(versionName).toBe('1.0.0');
  });

  it('should return correct version code', () => {
    const versionCode = getVersionCode();
    expect(versionCode).toBe(1);
    expect(typeof versionCode).toBe('number');
  });
});
