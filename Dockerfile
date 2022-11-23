FROM python:3
RUN pip install django==3.2

COPY . . 

RUN curl -fsSLO https://get.docker/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz
  
RUN python manage.py migrate
EXPOSE 8000

CMD ["python" , "manage.py", "runserver" , "0.0.0.0:8000"]
