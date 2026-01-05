/**
 * Common types and interfaces
 */

export type Environment = 'development' | 'staging' | 'production';

export interface ApiResponse<T> {
  data: T;
  error?: string;
  message?: string;
}

export interface PaginatedResponse<T> {
  data: T[];
  total: number;
  page: number;
  limit: number;
}
