FROM python:3.8.4-slim-buster

ENV PYRFC_VERSION=2.0.6

RUN mkdir -p /opt/sap
WORKDIR /opt/sap

RUN apt update && apt install -y gcc g++ git
RUN pip install \
      jupyter==1.0.0 \
      pandas==1.0.5 \
      cython==0.29.21 \
      pydata-google-auth==1.1.0 \
      google-cloud-bigquery==1.25.0 \
      pyarrow==0.17.1

COPY ./nwrfcsdk ./nwrfcsdk
ENV SAPNWRFC_HOME=/opt/sap/nwrfcsdk
ENV LD_LIBRARY_PATH=${SAPNWRFC_HOME}/lib

RUN git clone https://github.com/SAP/PyRFC.git -b ${PYRFC_VERSION} && \
      cd PyRFC && python setup.py bdist_wheel && \
      pip install --user dist/pynwrfc-${PYRFC_VERSION}-cp38-cp38-linux_x86_64.whl

WORKDIR /workspace
