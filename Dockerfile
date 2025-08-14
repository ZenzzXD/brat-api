FROM mcr.microsoft.com/playwright:focal

# Skip default browser download karena kita install manual
ENV PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD 1

WORKDIR /app

# Copy package.json dan package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy semua file project
COPY . .

# Install browser dependencies Playwright
RUN npx playwright install --with-deps

# Hugging Face akan kasih PORT otomatis, jangan hardcode
EXPOSE ${PORT}

# Jalankan app
CMD ["node", "app.js"]
