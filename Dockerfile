FROM python:3.8-slim-buster
WORKDIR /app
COPY . /app/

# Fix old Debian Buster repos
RUN sed -i 's|deb.debian.org|archive.debian.org|g' /etc/apt/sources.list && \
    sed -i '/security.debian.org/d' /etc/apt/sources.list && \
    apt-get update -y && apt-get install -y awscli

RUN pip install -r requirements.txt
CMD [ "python3", "app.py" ]