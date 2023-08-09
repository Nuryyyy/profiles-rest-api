# FROM python:3.9
# WORKDIR /code
# COPY ./requirements.txt /code/requirements.txt
# RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
# COPY . /code/.
# # RUN alembic upgrade head
# # RUN pytest -s /code/tests/
# RUN flake8 /code/ --exclude "migrations"
# CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8081"]


# Use the official Ubuntu 18.04 image as the base
FROM ubuntu:18.04

# Update package sources and install necessary packages
RUN apt-get update && apt-get install -y \
    python3-venv \
    zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Add an alias for python to python3
RUN echo "alias python='python3'" >> /root/.bashrc

# Expose a port (similar to forwarding a port in Vagrant)
EXPOSE 8000

# Start any necessary services or applications here
# (Docker doesn't have a direct equivalent to Vagrant's inline shell provision)

# You can't directly disable services or timers in Docker like in Vagrant
# Docker containers generally focus on running specific applications

# Entry point or command to start your application
CMD ["bash"]

