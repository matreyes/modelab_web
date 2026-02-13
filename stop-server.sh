#!/bin/bash
cd "$(dirname "$0")"

if [ ! -f zola.pid ]; then
  echo "⚠️  No hay servidor corriendo."
  exit 1
fi

PID=$(cat zola.pid)
kill "$PID" 2>/dev/null && echo "🛑 Servidor detenido (PID $PID)" || echo "⚠️  PID $PID no encontrado"
rm -f zola.pid
