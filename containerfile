# Use the latest Fedora image as base
FROM fedora:latest

# Update the system and install required packages
RUN dnf -y update && \
    dnf -y install tuxpaint vim httpd

# Add the HTML file to the container
COPY myinfo.html /var/www/html/

# Create a directory for the data content
COPY data/dummy-content.txt /data/dummy-content.txt

# Expose port 80 to make the container accessible via HTTP
EXPOSE 80

# Set the entrypoint to start the httpd server
ENTRYPOINT ["/usr/sbin/httpd", "-DFOREGROUND"]