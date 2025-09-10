FROM python:3.12-slim
WORKDIR /server
COPY . .

# Installation des dépendances Python et système
RUN pip3 install --no-cache-dir -r requirements.txt && \
    pip3 install . && \
    apt-get update && \
    apt-get install -y libgomp1 curl wget

# Commande de démarrage
CMD ["pegghy-back", "--data_folder_path", "/data", "--allowed_origins", "['https://next.pegghy.geode-solutions.com', 'https://pegghy.geode-solutions.com']", "--timeout", "5"]

EXPOSE 5000
