# Docker-DuckDNS

Docker image to update [DuckDNS](https://www.duckdns.org/) dynamic domains, 
according to the [HTTP API specifications](https://www.duckdns.org/spec.jsp).

The image will request the DuckDNS HTTPS API endpoint in loop each X minutes,
updating the IP associated with your domain/s with the IP that performed the request.

Main features:

- Based on `alpine:latest`
- Using `curl` as a non-root user
- Token can be provided using Docker Secrets

## ENV variables

- **DOMAINS**: comma-separated list of your duckdns.org domains (required)
- **TOKEN**: your personal DuckDNS token (required or provide using Docker Secret)
- **FREQUENCY**: time to wait between requests, in minutes (default: 15)

### Token using Docker Secrets

The Token can be provided using a Docker Secret called `token`.
See the example with [Docker Compose](examples/duckdns-example-secrets).
The Secret token has more priority than the Env token.

## Changelog

- 0.1: Initial release
