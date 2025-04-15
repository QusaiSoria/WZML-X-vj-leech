FROM mysterysd/wzmlx:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

# First upgrade pip and setuptools to avoid compatibility issues
RUN pip3 install --upgrade pip setuptools

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt || \
    pip3 install --no-cache-dir --ignore-installed pymediainfo==6.1.0  # Try specific version if fails

COPY . .

CMD ["bash", "start.sh"]
