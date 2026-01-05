/**
 * Supabase configuration
 * Replace with your actual Supabase credentials
 */

export const SUPABASE_CONFIG = {
  url: process.env.SUPABASE_URL || '',
  anonKey: process.env.SUPABASE_ANON_KEY || '',
} as const;
