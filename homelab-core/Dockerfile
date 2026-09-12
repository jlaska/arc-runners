FROM ghcr.io/actions/actions-runner:2.337.0

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends python3-pip \
    && rm -rf /var/lib/apt/lists/* \
    && rm -f /usr/lib/python*/EXTERNALLY-MANAGED

ENV PATH="/home/runner/.local/bin:$PATH"

USER runner
