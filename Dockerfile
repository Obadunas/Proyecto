# Usamos una imagen ligera para minimizar la superficie de ataque
FROM python:3.9-alpine

# Crear un usuario de sistema para no ejecutar como root (Principio de menor privilegio)
RUN adduser -D devopsuser

# Definir el directorio de trabajo
WORKDIR /home/devopsuser/app

# Instalar dependencias primero para aprovechar la caché de capas de Docker
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el código de la aplicación
COPY . .

# Cambiar la propiedad de los archivos al usuario no-root
RUN chown -R devopsuser:devopsuser /home/devopsuser/app

# Cambiar al usuario no-root
USER devopsuser

# Exponer el puerto de Flask
EXPOSE 5000

# Comando para ejecutar la aplicación
CMD ["python", "app.py"]
