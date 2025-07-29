FROM python:3.9-slim

WORKDIR /server

COPY . .
RUN pip3 install --no-cache-dir -r requirements.txt && \
    pip3 install . && \
    apt-get update && \
    apt-get install libgomp1 && \
    apt-get install -y curl && \
    apt-get update && apt-get install -y wget

CMD ["pegghy-back", "--data_folder_path", "/data", "--allowed_origins", "['https://next.pegghy.geode-solutions.com', 'https://pegghy.geode-solutions.com']" , "--timeout", "5"]

EXPOSE 5000