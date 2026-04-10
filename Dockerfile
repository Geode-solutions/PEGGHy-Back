FROM python:3.12-slim-bookworm AS builder

RUN apt-get update && apt-get install -y binutils

WORKDIR /app

COPY . .
RUN pip3 install --no-cache-dir . pyinstaller

RUN pyinstaller \
    --onefile \
    --collect-data opengeodeweb_back \
    --collect-data pegghy_back \
    --recursive-copy-metadata pegghy_back src/pegghy_back/app.py \
    --distpath dist \
    --name pegghy-back \
    --clean
ENV PYTHON_ENV="prod"

FROM debian:12-slim

COPY --from=builder /app/dist/pegghy-back /usr/local/bin/pegghy-back
RUN chmod +x /usr/local/bin/pegghy-back

RUN apt-get update && apt-get install -y git
RUN git clone https://x-access-token:${TOKEN}@github.com/Geode-solutions/PEGGHy-Data.git

EXPOSE 5000
ENV PYTHON_ENV=prod

ENTRYPOINT ["/usr/local/bin/pegghy-back"]
CMD ["--data_folder_path", "/data", \
    "--timeout", "5", \
    "--upload_folder_path", "/server/PEGGHy-Data"]

