# python
FROM python:3.9-slim

# Set dir
WORKDIR /app

# Copy file
COPY file.py .

#cmd comand
CMD ["python", "file.py"]
