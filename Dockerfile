FROM python:3.12-slim
ARG TOKEN

WORKDIR /server

COPY . .

# Installation des dépendances Python et système
RUN pip3 install --no-cache-dir -r requirements.txt && \
    pip3 install . && \
    apt-get update && \
    apt-get install -y libgomp1 curl

RUN curl -L \
  -H "Accept: application/vnd.github.object" \
  -H "Authorization: token $TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/Geode-solutions/PEGGHy-Data

# Commande de démarrage
CMD ["pegghy-back", "--data_folder_path", "/data", "--allowed_origins", "['https://next.pegghy.geode-solutions.com', 'https://pegghy.geode-solutions.com']", "--timeout", "5"]

EXPOSE 5000


# FROM ubuntu:22.04 AS builder

# ARG SSH_PRIVATE_KEY

# RUN apt-get update && \
#     apt-get install -y git openssh-client


# RUN mkdir -p /root/.ssh && \
#     chmod 700 /root/.ssh && \
#     echo "$SSH_PRIVATE_KEY" > /root/.ssh/id_ed25519 && \
#     chmod 600 /root/.ssh/id_ed25519 && \
#     ssh-keyscan github.com >> /root/.ssh/known_hosts && \
#     echo "Host github.com\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config

# RUN --mount=type=ssh git clone git@github.com:Geode-solutions/PEGGHy-Data.git /data


# FROM python:3.12-slim

# WORKDIR /server

# COPY . .

# COPY --from=builder /data /server/data 

# # Installation des dépendances Python et système
# RUN pip3 install --no-cache-dir -r requirements.txt && \
#     pip3 install . && \
#     apt-get update && \
#     apt-get install -y libgomp1 gh


# # Commande de démarrage
# CMD ["pegghy-back", "--data_folder_path", "/data", "--allowed_origins", "['https://next.pegghy.geode-solutions.com', 'https://pegghy.geode-solutions.com']", "--timeout", "5"]

# EXPOSE 5000
