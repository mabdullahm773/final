# python
FROM python:3.9-slim

# Set dir
WORKDIR /mabdullah

# Copy file
COPY mabdullah.py .

#cmd comand
CMD ["python", "file.py"]
