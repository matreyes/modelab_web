#!/bin/bash
cd "$(dirname "$0")"

if [ -f zola.pid ]; then
  echo "⚠️  Server ya corriendo (PID $(cat zola.pid)). Usa stop-server.sh primero."
  exit 1
fi

# Compilar CSS
echo "🎨 Compilando CSS..."
npm run css:build

# Iniciar Zola
echo "🚀 Iniciando servidor en http://pot:1112"
setsid nohup zola serve --port 1112 --interface 0.0.0.0 > zola.log 2>&1 &
echo $! > zola.pid
echo "✅ Servidor iniciado (PID $!)"
echo "📋 Log: tail -f $(pwd)/zola.log"
