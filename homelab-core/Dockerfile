FROM ghcr.io/actions/actions-runner:2.338.2

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends python3-pip libatomic1 \
    && rm -rf /var/lib/apt/lists/* \
    && rm -f /usr/lib/python*/EXTERNALLY-MANAGED

ENV PATH="/home/runner/.local/bin:$PATH"

USER runner
