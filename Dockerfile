ARG BASE
FROM $BASE as build-env

WORKDIR /opt/
ADD datax-web-2.1.2.tar.gz /opt/
RUN cd datax-web-2.1.2 \
    && ./bin/install.sh --force \
    && rm -rf packages

FROM $BASE
COPY --from=build-env /opt/datax-web-2.1.2 /opt/datax-web-2.1.2
WORKDIR /opt/
