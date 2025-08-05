#!/bin/sh

set -e

echo "🚀 Entrypoint starting..."

if [ "$ENABLE_SUPERVISOR" = "true" ]; then
    echo "✅ ENABLE_SUPERVISOR=true — running supervisord"
    exec /usr/bin/supervisord -c /etc/supervisord.conf
else
    echo "⚙️ ENABLE_SUPERVISOR=false — running php-fpm directly"
    exec php-fpm
fi
