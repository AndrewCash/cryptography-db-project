# Use an official Python runtime as an image
FROM python:3.9.4

# The EXPOSE instruction indicates the ports on which a container
# will listen for connections
# Since Flask apps listen to port 5000  by default, we expose it
EXPOSE 5000

# Sets the working directory for following COPY and CMD instructions
# Notice we haven’t created a directory by this name - this instruction
# creates a directory with this name if it doesn’t exist
WORKDIR /app

# Install any needed packages specified in requirements.txt
COPY requirements.txt /app

RUN pip3 install -r requirements.txt

# Run app.py when the container launches
COPY app.py /app

CMD ["export", "FLASK_APP=UALR Cryptography Project 2"]
CMD ["export" "FLASK_ENV=development"]

CMD ["python", "app.py"]
