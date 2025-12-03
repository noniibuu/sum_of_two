FROM debian:bookworm-slim
COPY --from=ghcr.io/astral-sh/uv:0.9.10 /uv /uvx /usr/local/bin/
WORKDIR /app
COPY README.md pyproject.toml uv.lock ./
RUN uv sync --locked --no-install-project
COPY ./src ./src
CMD ["uv", "run", "-m", "kalymbet-new"]
