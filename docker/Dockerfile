# Stage 1: Build the Go application
FROM golang:1.22.3 AS builder

# Set the current working directory inside the container
WORKDIR /app

# Copy the go.mod and go.sum files
COPY go.mod ./

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

# Copy the source code into the container
COPY . .

# Build the Go app
RUN go build -o main .

# Stage 2: Create a runtime image with Kali Linux and install dependencies
FROM kalilinux/kali-rolling

# Set environment variable to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && apt-get install -y \
    nmap \
    dirb \
    hping3 \
    aircrack-ng \
    arp-scan \
    tcpdump \
    uniscan \
    iputils-ping \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /root/

# Copy the binary from the builder stage
COPY --from=builder /app/main .

# Use ENTRYPOINT to ensure command-line arguments are passed correctly
ENTRYPOINT ["./main"]
