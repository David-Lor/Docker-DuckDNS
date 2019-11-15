FROM alpine:latest

# ENV variables
ENV DOMAINS ""
ENV TOKEN ""
ENV FREQUENCY 15
ARG USERNAME=user

# Install curl
RUN apk --no-cache update && apk --no-cache add curl

# Copy entrypoint script and set executable
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Create non-root user
RUN addgroup $USERNAME && adduser $USERNAME -D -G $USERNAME
USER $USERNAME

# Execute the entrypoint
CMD ["/entrypoint.sh"]
