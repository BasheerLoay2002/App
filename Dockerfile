# Stage 1: Build stage
FROM amazonlinux:2023 AS build

# Install Python and pip
RUN dnf update -y && \
    dnf install -y python3 python3-pip && \
    dnf clean all

# Set working directory
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip3 install --user -r requirements.txt

# Copy application code
COPY . .

# Stage 2: Final lightweight image
FROM amazonlinux:2023

# Install only Python runtime
RUN dnf update -y && \
    dnf install -y python3 && \
    dnf clean all

WORKDIR /app

# Copy installed dependencies from build stage
COPY --from=build /root/.local /root/.local
COPY --from=build /app /app

# Update PATH to include pip packages
ENV PATH=/root/.local/bin:$PATH

# Expose port
EXPOSE 80

# Run the application
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
