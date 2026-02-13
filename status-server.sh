#!/bin/bash
cd "$(dirname "$0")"

if [ -f zola.pid ] && kill -0 "$(cat zola.pid)" 2>/dev/null; then
  echo "✅ Servidor corriendo (PID $(cat zola.pid)) → http://pot:1112"
else
  echo "🔴 Servidor detenido"
  rm -f zola.pid
fi
