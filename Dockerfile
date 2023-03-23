FROM python:3.10-alpine

# update apk repo
RUN echo "http://dl-4.alpinelinux.org/alpine/v3.14/main" >> /etc/apk/repositories && \
    echo "http://dl-4.alpinelinux.org/alpine/v3.14/community" >> /etc/apk/repositories

# install chromedriver
RUN apk update
RUN apk add chromium chromium-chromedriver

# upgrade pip
RUN pip install --upgrade pip

WORKDIR /app

#Copy needed files
#COPY requirements.txt requirements.txt
COPY . .

# install requirements
RUN pip3 install -r requirements.txt

CMD [ "python3", "schedule_videotron.py"]


