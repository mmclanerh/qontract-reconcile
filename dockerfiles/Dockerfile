FROM quay.io/app-sre/qontract-reconcile-base:0.1.2

WORKDIR /reconcile

COPY e2e_tests e2e_tests
COPY reconcile reconcile
COPY tools tools
COPY templates templates
COPY setup.py .

RUN python3 setup.py install

COPY dockerfiles/hack/run-integration.py /run-integration.py
CMD [ "/run-integration.py" ]
