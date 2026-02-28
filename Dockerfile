FROM oven/bun:1 AS base
WORKDIR /app

COPY package.json bun.lock* ./
RUN bun install --frozen-lockfile

COPY . .

EXPOSE 3001
ENV MCP_PORT=3001
ENV MCP_HOST=0.0.0.0

CMD ["bun", "run", "src/server/http-server.ts"]
