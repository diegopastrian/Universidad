#!/bin/bash

# Mensaje de commit por defecto
mensaje="Actualización automática"

# Si el usuario proporciona un mensaje, usar ese en su lugar
if [ ! -z "$1" ]; then
    mensaje="$1"
fi

echo "🚀 Iniciando proceso de commit y push..."

# Agregar todos los cambios
git add .

# Hacer commit con el mensaje proporcionado
git commit -m "$mensaje"

# Forzar el push a la rama main
git push origin main --force

echo "✅ Código subido exitosamente con mensaje: '$mensaje'"
