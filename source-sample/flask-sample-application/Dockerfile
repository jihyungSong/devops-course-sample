FROM python:3.8

ENV FLASK_APP devops_sample_application
ENV FLASK_PORT 5000
ENV SRC_DIR /opt/${FLASK_APP}

COPY src ${SRC_DIR}

WORKDIR ${SRC_DIR}
RUN pip install .

EXPOSE ${FLASK_PORT}

ENTRYPOINT ["gunicorn"]
CMD ["--bind", "localhost:5000", "wsgi:app"]
