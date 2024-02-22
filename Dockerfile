FROM mcr.microsoft.com/playwright:v1.41.1-jammy

WORKDIR /app

COPY . .

RUN npm ci
RUN npx playright install --with-deps
ENV CI=true

CMD ["npm", "test", "&&", "cp", "-r", "allure-results", "/app/allure-results"]