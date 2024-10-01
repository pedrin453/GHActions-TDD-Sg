on:
  push:
    branches:
      - main

jobs:
  ci:
    name: Integração Contínua
    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '21'

      - name: Install dependencies
        run: npm install

      - name: Run tests
        run: npm test
  cd:
    name: Continuous Deployment
    runs-on: ubuntu-latest
    needs: ci

    steps:
      - name: Sucesso
        uses: echo "Deploying..."
