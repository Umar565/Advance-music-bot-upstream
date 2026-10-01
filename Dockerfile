FROM python:3.10-bookworm

RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg aria2 nodejs npm \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /app/
WORKDIR /app/

RUN python -m pip install --no-cache-dir --upgrade pip
RUN pip3 install --no-cache-dir --upgrade --requirement requirements.txt

EXPOSE 8080

CMD ["python3", "-m", "BADMUSIC"]
