FROM python:3.8-slim-buster
WORKDIR /app
COPY . /app

# Fix old Debian repo
RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list \
    && sed -i '/security.debian.org/d' /etc/apt/sources.list

# Install dependencies
RUN apt-get update && apt-get install -y \
    awscli ffmpeg libsm6 libxext6 unzip \
    && rm -rf /var/lib/apt/lists/*

RUN pip install -r requirements.txt
CMD ["python3", "app.py"]