import os
from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    # Simulamos obtener una variable de entorno (ConfigMap/Secret de K8s)
    version = os.getenv('APP_VERSION', '1.0.0')
    return {
        "status": "success",
        "message": "Bienvenido a TechWave Solutions",
        "version": version,
        "environment": os.getenv('FLASK_ENV', 'production')
    }

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
