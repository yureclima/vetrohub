#!/bin/sh

# Default values present in the compiled dist files
DEFAULT_UAZAPI_URL="https://proagency.uazapi.com"
DEFAULT_UAZAPI_TOKEN="cd5316aa-3b30-49a0-a75e-1ee55e9b8658"
DEFAULT_UAZAPI_INSTANCE="Vetro"
DEFAULT_SUPABASE_URL="https://ftrqlahdxbslftemdbmb.supabase.co"
DEFAULT_SUPABASE_ANON_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0cnFsYWhkeGJzbGZ0ZW1kYm1iIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM0MzgwMzIsImV4cCI6MjA3OTAxNDAzMn0.tPawU0LMLp2ms1LU63Ky3Wtmpt1l9-w22aH_O6L-gqk"

echo "Replacing environment variables in JS files..."

TARGET_DIR="/usr/share/nginx/html"

if [ -n "$VITE_UAZAPI_URL" ]; then
  echo "Replacing UAZAPI_URL with $VITE_UAZAPI_URL"
  find "$TARGET_DIR" -type f -name "*.js" -exec sed -i "s|$DEFAULT_UAZAPI_URL|$VITE_UAZAPI_URL|g" {} +
fi

if [ -n "$VITE_UAZAPI_TOKEN" ]; then
  echo "Replacing UAZAPI_TOKEN with $VITE_UAZAPI_TOKEN"
  find "$TARGET_DIR" -type f -name "*.js" -exec sed -i "s|$DEFAULT_UAZAPI_TOKEN|$VITE_UAZAPI_TOKEN|g" {} +
fi

if [ -n "$VITE_UAZAPI_INSTANCE" ]; then
  echo "Replacing UAZAPI_INSTANCE with $VITE_UAZAPI_INSTANCE"
  find "$TARGET_DIR" -type f -name "*.js" -exec sed -i "s|$DEFAULT_UAZAPI_INSTANCE|$VITE_UAZAPI_INSTANCE|g" {} +
fi

if [ -n "$VITE_SUPABASE_URL" ]; then
  echo "Replacing SUPABASE_URL with $VITE_SUPABASE_URL"
  find "$TARGET_DIR" -type f -name "*.js" -exec sed -i "s|$DEFAULT_SUPABASE_URL|$VITE_SUPABASE_URL|g" {} +
fi

if [ -n "$VITE_SUPABASE_ANON_KEY" ]; then
  echo "Replacing SUPABASE_ANON_KEY"
  find "$TARGET_DIR" -type f -name "*.js" -exec sed -i "s|$DEFAULT_SUPABASE_ANON_KEY|$VITE_SUPABASE_ANON_KEY|g" {} +
fi

# Execute Nginx
exec "$@"
