
FROM python:3.12.1-slim as build

WORKDIR /
COPY welcome/app/bookinfo/src/productpage/requirements.txt /
RUN pip3 install -vvv --require-hashes --no-cache-dir -r requirements.txt
COPY welcome/app/bookinfo/src/productpage/test-requirements.txt /
RUN pip3 install --no-cache-dir --require-hashes -r test-requirements.txt

FROM python:3.12.1-slim as test

COPY --from=build / /
WORKDIR /
COPY welcome/app/bookinfo/src/productpage/productpage.py /opt/microservices/
COPY welcome/app/bookinfo/src/productpage/tests/unit/* /opt/microservices/
COPY welcome/app/bookinfo/src/productpage/templates /opt/microservices/templates
COPY welcome/app/bookinfo/src/productpage/static /opt/microservices/static
COPY welcome/app/bookinfo/src/productpage/requirements.txt /opt/microservices/

FROM python:3.12.1-slim as run

COPY --from=test / /
ARG flood_factor
ENV FLOOD_FACTOR ${flood_factor:-0}
EXPOSE 9080
WORKDIR /opt/microservices
RUN python -m unittest discover

CMD ["gunicorn", "-b", "[::]:9080", "productpage:app", "-w", "8", "--keep-alive", "2", "-k", "gevent"]

USER 1000
