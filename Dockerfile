FROM python:3.13-slim

RUN mkdir -p /usr/src/app/home && \
    useradd -d /usr/src/app/home -s /usr/sbin/nologin -u 998 appuser && \
    chown appuser /usr/src/app/home
WORKDIR /usr/src/app

COPY requirements.txt /usr/src/app
RUN pip install --no-cache-dir -r requirements.txt

COPY radosgw_usage_exporter.py /usr/src/app

USER 998
EXPOSE 9242

ENTRYPOINT [ "python", "-u", "./radosgw_usage_exporter.py" ]
CMD []
