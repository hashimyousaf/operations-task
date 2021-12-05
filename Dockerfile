# pull official base image
FROM python:3.9.5-slim-buster

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1


# install dependencies
COPY ./rates/requirements.txt /usr/src/app/requirements.txt

RUN pip install --upgrade pip && \
    pip install -U gunicorn && \
    pip install -r requirements.txt

# copy project
COPY ./rates /usr/src/app
EXPOSE 3000/tcp


# Added for local testing
ENTRYPOINT ["gunicorn", "-b" ,":3000", "wsgi"]
