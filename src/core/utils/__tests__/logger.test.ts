/**
 * Logger utility tests
 */

import { logger } from '../logger';

// Mock console methods
const consoleSpy = {
  log: jest.spyOn(console, 'log').mockImplementation(),
  info: jest.spyOn(console, 'info').mockImplementation(),
  warn: jest.spyOn(console, 'warn').mockImplementation(),
  error: jest.spyOn(console, 'error').mockImplementation(),
};

describe('Logger', () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  afterAll(() => {
    consoleSpy.log.mockRestore();
    consoleSpy.info.mockRestore();
    consoleSpy.warn.mockRestore();
    consoleSpy.error.mockRestore();
  });

  it('should log debug messages in development', () => {
    logger.debug('Test debug message', { data: 'test' });
    expect(consoleSpy.log).toHaveBeenCalled();
  });

  it('should log info messages', () => {
    logger.info('Test info message');
    expect(consoleSpy.info).toHaveBeenCalled();
  });

  it('should log warn messages', () => {
    logger.warn('Test warn message');
    expect(consoleSpy.warn).toHaveBeenCalled();
  });

  it('should log error messages', () => {
    logger.error('Test error message');
    expect(consoleSpy.error).toHaveBeenCalled();
  });
});
