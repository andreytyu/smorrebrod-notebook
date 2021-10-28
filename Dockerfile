FROM python:3.8
LABEL maintainer="Andrey Tyukavin <geotyukavin@gmail.com>"

# Install system dependencies
RUN apt-get -yqq update && apt-get -yqq install \
    libgdal-dev \
    libgeos-dev \
    python3-gdal

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY requirements.txt /usr/src/app
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8888

CMD ["jupyter", "notebook", "--allow-root", "--ip=0.0.0.0"]
