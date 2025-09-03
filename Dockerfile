# Stage 1: Build stage
FROM amazonlinux:2023 AS build

RUN dnf update -y && \
    dnf install -y python3 python3-pip && \
    dnf clean all

WORKDIR /app

COPY requirements.txt .
RUN pip3 install --user -r requirements.txt

# Copy application code
COPY . .

# Stage 2: Final lightweight image
FROM amazonlinux:2023

RUN dnf update -y && \
    dnf install -y python3 && \
    dnf clean all

WORKDIR /app

COPY --from=build /root/.local /root/.local
COPY --from=build /app /app

# ENV PATH=/root/.local/bin:$PATH

EXPOSE 80

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
