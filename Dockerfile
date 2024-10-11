# Stage 1: Build the application
FROM oven/bun:1.1-slim as builder

# Set working directory
WORKDIR /app

# Copy the package and lock file
COPY package.json bun.lockb ./

# Install dependencies using Bun
RUN bun install

# Copy all application files
COPY . .

# Build the application
RUN bun next build

# Stage 2: Run the application
FROM oven/bun:1.1-alpine as runner

# Set environment variables (optional, based on your app)
ENV NODE_ENV=production
ENV PORT=3000

# Set working directory
WORKDIR /app

# Copy built files from the builder stage
COPY --from=builder /app ./

# Expose port
EXPOSE 3000

# Start the application
CMD ["bun", "next", "start"]