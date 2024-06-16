
#Install Debian OS + python3 so requirements.txt could be install withut error (system bug/ missing dependencies)
FROM python:3

#Create /app folder (and make this foldern the current directory):
WORKDIR /app

#Create virtaul enviroment inside the image suitable for Linux:
RUN python -m venv env

#Copy only requirements.txt so we could install requirements as soon as posible
COPY requirements.txt /app 

#Install requirements.txt inside the virtual requirement:
RUN /app/env/bin/pip install -r requirements.txt

#Copy entire project into /app:
COPY . /app

#Run python within virtaul enviroment when container starts:
ENTRYPOINT /app/env/bin/python src/manage.py runserver 0.0.0.0:8000

