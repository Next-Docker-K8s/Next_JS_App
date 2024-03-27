FROM node:latest AS builder

WORKDIR /app

COPY . .

RUN npm install

RUN npm run build



# Use an official Nginx image as a parent image
FROM nginx:latest

# Copy the static build files from the previous stage
COPY --from=builder app/out /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 80

# Command to start Nginx server
CMD ["nginx", "-g", "daemon off;"]