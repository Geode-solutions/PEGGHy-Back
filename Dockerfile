FROM python:3.12-slim

WORKDIR /server

COPY . .

# Installation des dépendances Python et système
RUN pip3 install --no-cache-dir -r requirements.txt && \
    pip3 install . && \
    apt-get update && \
    apt-get install -y libgomp1 git

# RUN --mount=type=secret,id=token \
#     TOKEN=/run/secrets/token \
#     git clone https://x-access-token:${TOKEN}@github.com/Geode-solutions/PEGGHy-Data.git

# Commande de démarrage
CMD ["pegghy-back", "--data_folder_path", "/data", "--allowed_origins", "['https://next.pegghy.geode-solutions.com', 'https://pegghy.geode-solutions.com']", "--timeout", "5", "--upload_folder_path", "/server/PEGGHy-Data"]

EXPOSE 5000
