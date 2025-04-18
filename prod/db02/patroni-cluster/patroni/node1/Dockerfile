FROM postgres:17-alpine

# Install required packages and dependencies in a single RUN step
RUN apk update && apk add --no-cache \
    gcc musl-dev g++ python3-dev libffi-dev openssl-dev py3-pip

RUN   pip install --break-system-packages --upgrade pip setuptools 
RUN   pip install --break-system-packages  wheel

# Copy the requirements.txt and install the dependencies into the virtual environment
COPY ./requirements.txt /requirements.txt
RUN  pip install --break-system-packages  -r /requirements.txt
RUN chown -R postgres:postgres /var/lib/

# Copy the Patroni configuration file
COPY ./patroni.yml /patroni.yml

# Entry point to start Patroni
ENTRYPOINT ["patroni", "/patroni.yml"]
