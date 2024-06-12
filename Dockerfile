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

# Install PyYAML
RUN pip install PyYAML
