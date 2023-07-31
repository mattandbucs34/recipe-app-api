FROM python:3.9-alpine3.13
<<<<<<< HEAD
LABEL maintainer="londonappdeveloper.com"
=======
LABEL maintainer="matt johnson"
>>>>>>> b446e6c99bd58c64179e2747fbbdbfc7afa9e40a

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

ARG DEV=false
RUN python -m venv /py && \
<<<<<<< HEAD
    /py/bin/pip install --upgrade pip && \
    apk add --update --no-cache postgresql-client && \
    apk add --update --no-cache --virtual .tmp-build-deps \
        gcc libc-dev linux-headers postgresql-dev && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [ $DEV = "true" ] ; \
        then echo "--DEV BUILD--" && /py/bin/pip install -r /tmp/requirements.dev.txt ; \
    fi && \
    apk del .tmp-build-deps && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user
=======
  /py/bin/pip install --upgrade pip && \
  apk add --update --no-cache postgresql-client && \
  apk add --update --no-cache --virtual .tmp-build-deps \
    build-base postgresql-dev musl-dev && \
  /py/bin/pip install -r /tmp/requirements.txt && \
  if [ $DEV = "true" ]; \
    then /py/bin/pip install -r /tmp/requirements.dev.txt ; \
  fi && \
  rm -rf /tmp && \
  apk del .tmp-build-deps && \
  adduser \
    --disabled-password \
    --no-create-home \
    django-user
>>>>>>> b446e6c99bd58c64179e2747fbbdbfc7afa9e40a

ENV PATH="/py/bin:$PATH"

USER django-user