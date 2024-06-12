# Use the official Ubuntu image from the Docker Hub
FROM ubuntu:latest

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3-venv \
    git

# Create a virtual environment and activate it
RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"

# Install Python packages
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy the rest of the code
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Run the application
ENTRYPOINT ["/entrypoint.sh"]
