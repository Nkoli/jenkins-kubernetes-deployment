FROM python:3.6-alpine
RUN mkdir -p /opt/services/djangoapp/src
WORKDIR /opt/services/djangoapp/src
COPY requirements.txt /opt/services/djangoapp/src
RUN pip install -r requirements.txt
COPY . /opt/services/djangoapp/src
EXPOSE 6060
CMD ["python", "manage.py", "runserver", "6060"]
