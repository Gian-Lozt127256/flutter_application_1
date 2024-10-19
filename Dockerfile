# Usar la imagen oficial de Flutter
FROM ghcr.io/cirruslabs/flutter:stable

# Crear un usuario no root
RUN useradd -ms /bin/bash flutteruser

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Cambiar los permisos del SDK de Flutter para que el usuario no root tenga acceso
RUN chown -R flutteruser:flutteruser /sdks/flutter

# Copiar todos los archivos del proyecto a /app
COPY . .

# Cambiar los permisos de los archivos del proyecto para el usuario no root
RUN chown -R flutteruser:flutteruser /app

# Cambiar al usuario no root
USER flutteruser

# Descargar las dependencias de Flutter
RUN flutter pub get

# Crear una build release de la aplicación web de Flutter
RUN flutter build web

# Volver al usuario root para instalar nginx
USER root

# Instalar nginx para servir la aplicación web
RUN apt-get update && apt-get install -y nginx
COPY ./build/web /var/www/html

# Exponer el puerto para la aplicación
EXPOSE 80

# Configurar nginx para servir la aplicación
CMD ["nginx", "-g", "daemon off;"]





