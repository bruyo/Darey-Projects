# E-Commerce Application CI/CD Pipeline

## Project Overview: Automated Pipeline for an E-Commerce Platform

#### Hypothetical Use Case:

You are tasked with developing and maintaining an e-commerce platform. This platform has two primary components:

- **E-Commerce API:** Backend service handling product listings, user, accounts, and order processing.

- **E-Commerce Frontend:** A web application for users to browse products, manage their accounts, and place orders.

The goal is to automate the integration and deployment process for both components using GitHub Actions, ensuring continuous delivery and integration.


### Project Structure:

```bash
project-root/
├── api/
│   ├── app.js
│   ├── index.js
│   ├── package.json
│   └── tests/
├── webapp/
│   ├── package.json
│   ├── src/
│   │   ├── components/
│   │   │   ├── Login.js
│   │   │   ├── ProductList.js
│   │   │   └── OrderForm.js
│   │   ├── App.js
│   │   ├── index.js
│   │   └── App.css
│   └── public/
└── .github/
```

### Project Tasks:

1. Project Setup.

- Create a new GitHub repository named 'ecommerce-platform'.

![github-repo](./img/repo.JPG)

![clone](./img/git-clone.JPG)

```bash
git clone https://github.com/bruyo/ecommerce-platform.git
```

- Inside the repository, create two directories: 'api' for the backend and 'webapp' for the frontend.

```bash
cd ecommerce-platform
```

```bash
mkdir api
```

```bash
mkdir webapp
```

![app](./img/app.JPG)

2. Initialize GitHub Actions.

- Initialize a Git repository and add the inital the project structure.

```bash
git add .
```

- Create '.github/workflows' directory in your repository for GitHub Actions.

```bash
mkdir .github
```

```bash
cd .github
```

```bash
mkdir workflows
```

3. Backend API Setup.

- In the 'api' directory, set up a simple Node.js/Express application that handles basic e-commerce operations. 

```bash
cd api
```

```bash
npm init -y
```

![Node.js](./img/node-js.JPG)

**Install dependencies:**

```bash
npm install express
npm install --save-dev jest supertest
```

![dependencies](./img/express.JPG)

![jest](./img/jest.JPG)

**Update package.json file**

```bash
nano package.json
```

```bash
{
  "name": "api",
  "version": "1.0.0",
  "main": "index.js",
  "scripts": {
    "start": "node index.js",
    "test": "jest"
  },
  "dependencies": {
    "express": "^4.21.0"
  },
  "devDependencies": {
    "jest": "^30.4.2",
    "supertest": "^7.1.0"
  }
}
```

- Create app.js file.

```bash
nano app.js
```

```bash
const express = require('express');

const app = express();
app.use(express.json());

const products = [
  { id: 1, name: 'Laptop', price: 1200 },
  { id: 2, name: 'Phone', price: 800 }
];

app.get('/products', (req, res) => {
  res.status(200).json(products);
});

app.get('/products/:id', (req, res) => {
  const product = products.find(
    p => p.id === parseInt(req.params.id)
  );

  if (!product) {
    return res.status(404).json({ message: 'Product not found' });
  }

  res.json(product);
});

app.post('/products', (req, res) => {
  const product = {
    id: products.length + 1,
    ...req.body
  };

  products.push(product);

  res.status(201).json(product);
});

module.exports = app;
```

- Create index.js file.

```bash
nano index.js
```

```bash
const app = require('./app');

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
```

- Implement unit tests for the API.

```bash
mkdir test
```

```bash
cd test
```

```bash
nano products.test.js
```

```bash
const request = require('supertest');
const app = require('../app');

describe('Products API', () => {
  test('GET /products returns all products', async () => {
    const response = await request(app).get('/products');

    expect(response.statusCode).toBe(200);
    expect(Array.isArray(response.body)).toBe(true);
  });
});
```

3. Backend API Setup.

- In the 'webapp' directory, create a simple React application that interacts with the backend API. 

From the project root (/ecommerce-platform):

```bash
npx create-react-app webapp
```

![react](./img/react.JPG)

```bash
cd webapp
npm install axios
```

axios will be used to communicate with the backend API.

To fix vulnerabilities: 

```bash
npm audit fix --force
```

![start-npm](./img/start-npm.JPG)

Expand your Express API (api/app.js) to support products, login, and orders.

```bash
cd api
nano app.js
```

Update with this;

```bash
const express = require('express');

const app = express();
app.use(express.json());

const products = [
  { id: 1, name: 'Laptop', price: 1200 },
  { id: 2, name: 'Phone', price: 800 },
  { id: 3, name: 'Headphones', price: 150 }
];

app.get('/products', (req, res) => {
  res.json(products);
});

app.post('/login', (req, res) => {
  const { username, password } = req.body;

  if (username === 'admin' && password === 'password') {
    return res.json({
      message: 'Login successful',
      token: 'sample-token'
    });
  }

  res.status(401).json({
    message: 'Invalid credentials'
  });
});

app.post('/orders', (req, res) => {
  res.status(201).json({
    message: 'Order placed successfully',
    order: req.body
  });
});

module.exports = app;
```

- Ensure the frontend has basic features like product listing, user login, and order placement.

**Product Listing Component**

```bash
cd webapp
cd src
mkdir components
nano ProductList.js
```

```bash
import { useEffect, useState } from 'react';
import axios from 'axios';

function ProductList() {
  const [products, setProducts] = useState([]);

  useEffect(() => {
    axios
      .get('http://localhost:3000/products')
      .then((response) => {
        setProducts(response.data);
      });
  }, []);

  return (
    <div>
      <h2>Products</h2>

      <ul>
        {products.map(product => (
          <li key={product.id}>
            {product.name} - ${product.price}
          </li>
        ))}
      </ul>
    </div>
  );
}

export default ProductList;
```

**Login Component**

```bash
cd components
nano Login.js
```

```bash
import { useState } from 'react';
import axios from 'axios';

function Login() {

  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');

  const login = async () => {

    try {

      const response = await axios.post(
        'http://localhost:3000/login',
        {
          username,
          password
        }
      );

      alert(response.data.message);

    } catch {

      alert('Login failed');

    }

  };

  return (
    <div>
      <h2>User Login</h2>

      <input
        placeholder="Username"
        onChange={(e) => setUsername(e.target.value)}
      />

      <input
        type="password"
        placeholder="Password"
        onChange={(e) => setPassword(e.target.value)}
      />

      <button onClick={login}>
        Login
      </button>
    </div>
  );

}

export default Login;
```

**Order Placement Component**

```bash
cd components
nano OrderForm.js
```

```bash
import axios from 'axios';

function OrderForm() {

  const placeOrder = async () => {

    const order = {
      productId: 1,
      quantity: 2
    };

    const response = await axios.post(
      'http://localhost:3000/orders',
      order
    );

    alert(response.data.message);

  };

  return (
    <div>

      <h2>Place Order</h2>

      <button onClick={placeOrder}>
        Order Laptop
      </button>

    </div>
  );

}

export default OrderForm;
```

```bash
cd src
nano App.js
```

```bash
import './App.css';

import Login from './components/Login';
import ProductList from './components/ProductList';
import OrderForm from './components/OrderForm';

function App() {

  return (
    <div className="App">

      <h1>E-Commerce Store</h1>

      <Login />

      <hr />

      <ProductList />

      <hr />

      <OrderForm />

    </div>
  );

}

export default App;
```

**Enable CORS in the Backend**

- Install CORS:

```bash
cd api
npm install cors
```

![cors](./img/cors.JPG)

Update api/app.js:

```bash
const express = require('express');
const cors = require('cors');

const app = express();

// Enable CORS
app.use(cors());

// Parse JSON request bodies
app.use(express.json());

const products = [
  { id: 1, name: 'Laptop', price: 1200 },
  { id: 2, name: 'Phone', price: 800 },
  { id: 3, name: 'Headphones', price: 150 }
];

// Get all products
app.get('/products', (req, res) => {
  res.json(products);
});

// User login
app.post('/login', (req, res) => {
  const { username, password } = req.body;

  if (username === 'admin' && password === 'password') {
    return res.json({
      message: 'Login successful',
      token: 'sample-token'
    });
  }

  res.status(401).json({
    message: 'Invalid credentials'
  });
});

// Place an order
app.post('/orders', (req, res) => {
  res.status(201).json({
    message: 'Order placed successfully',
    order: req.body
  });
});

module.exports = app;
```

**Note:** Your frontend and backend typically run on different ports during development, for example:

React frontend: http://localhost:3000
Express API: http://localhost:5000

Browsers block requests between different origins unless the backend explicitly allows them.

5. Continuous Integration Workflow.

- Write a GitHub Actions workflow for the backend and frontend that; installs dependencies, runs tests and builds application.


- Create the file:

```bash
cd .github
cd workflow
nano ci.yml
```

Copy and paste:

```bash
name: Full Stack CI Pipeline

on:
  push:
    branches:
      - main
      - develop
      - staging

  pull_request:
    branches:
      - main
      - develop
      - staging

jobs:

  backend:

    name: Backend CI
    runs-on: ubuntu-latest

    defaults:
      run:
        working-directory: api

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: npm
          cache-dependency-path: api/package-lock.json

      - name: Install Dependencies
        run: npm ci

      - name: Run Unit Tests
        run: npm test

      - name: Build Backend
        run: |
          echo "Backend build completed"

  frontend:

    name: Frontend CI
    runs-on: ubuntu-latest

    defaults:
      run:
        working-directory: webapp

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: npm
          cache-dependency-path: webapp/package-lock.json

      - name: Install Dependencies
        run: npm ci

      - name: Run Frontend Tests
        run: npm test -- --watchAll=false

      - name: Build React Application
        run: npm run build
```

6. Docker Integration.

- Create Dockerfiles for both the backend and frontend.

```bash
cd api
nano Dockerfile
```

```bash
# Use the official Node.js 22 LTS image
FROM node:22-alpine

# Set the working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy the rest of the application
COPY . .

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
```

```bash
cd webapp
nano Dockerfile
```

```bash
# ---------- Build Stage ----------
FROM node:20-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# ---------- Production Stage ----------
FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

- Create '.dockerignore' in both api and webapp.

```bash
cd webapp
mkdir .dockerignore
```

```bash
cd webapp
mkdir .dockerignore
```

- Modify the GitHub Actions workflows to build Docker images.

```bash
cd .github/workflows/
nano ci.yml
```

```bash
name: CI/CD with Docker

on:
  push:
    branches:
      - develop
      - staging
      - main

  pull_request:
    branches:
      - develop
      - staging
      - main

jobs:

  backend:

    runs-on: ubuntu-latest

    defaults:
      run:
        working-directory: api

    steps:

      - uses: actions/checkout@v4

      - uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: npm
          cache-dependency-path: api/package-lock.json

      - name: Install Dependencies
        run: npm ci

      - name: Run Tests
        run: npm test

      - name: Build Backend Docker Image
        run: |
          docker build -t ecommerce-api ./api

  frontend:

    runs-on: ubuntu-latest

    defaults:
      run:
        working-directory: webapp

    steps:

      - uses: actions/checkout@v4

      - uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: npm
          cache-dependency-path: webapp/package-lock.json

      - name: Install Dependencies
        run: npm ci

      - name: Run Frontend Tests
        run: npm test -- --watchAll=false

      - name: Build React App
        run: npm run build

      - name: Build Frontend Docker Image
        run: |
          docker build -t ecommerce-webapp ./webapp
```

6. Deploy to Cloud.

- Choose a cloud platform for deployment (aws, azure, or gcp).

- Configure GitHub Actions to deploy the Docker images to the chosen cloud platform.

Create the following resources in your AWS account:

Amazon ECR: ecommerce-api, ecommerce-webapp.

![ecr](./img/ecr.JPG)

![create-ecr](./img/create-ecr.JPG)

![API](./img/api-ecr.JPG)

![aws-repo](./img/aws-repo.JPG)

Amazon ECS:

- Cluster: ecommerce-cluster
- Service: backend-service
- Service: frontend-service

![ecs](./img/ecs.JPG)

![dashboard](./img/ecs-dashboard.JPG)

![cluster](./img/cluster.JPG)

![cluster](./img/create-cluster.JPG)

![cluster](./img/created-cluster.JPG)

Task Definitions:
- backend-task
- frontend-task

![definition](./img/task-definition.JPG)

![definition](./img/task.JPG)

![role](./img/role.JPG)

![create-role](./img/create-role.JPG)

![backend](./img/backend-reg.JPG)

![backend](./img/backend-task.JPG)

![tasks](./img/task-role.JPG)

- Create Service for both the backend and frontend.

![Service](./img/service.JPG)

![create-service](./img/create-service.JPG)

![service](./img/backend-service.JPG)

![vpc](./img/network.JPG)

![create-service](./img/service-created.JPG)

![services](./img/services.JPG)

- Use GitHub Secrets to to securely store and access cloud credentials. In your GitHub repository, go to Settings → Secrets and variables → Actions and create:

![github-setting](./img/github-setting.JPG)

![settings](./img/settings.JPG)

![input](./img/input.JPG)

![secrets](./img/secrets.JPG)

8. Continuous Deployment:

- Configure the workflows to deploy updates automatically to the cloud environment when charges are pushed to the main branch.

```bash
cd .github/workflows/
nano deploy.yml
```

```bash
name: Deploy to AWS ECS

on:
  push:
    branches:
      - main

env:
  AWS_REGION: ${{ secrets.AWS_REGION }}
  AWS_ACCOUNT_ID: ${{ secrets.AWS_ACCOUNT_ID }}

jobs:
  deploy:

    runs-on: ubuntu-latest

    steps:

      - name: Checkout Repository
        uses: actions/checkout@v4

      - name: Configure AWS Credentials
        uses: aws-actions/configure-aws-credentials@v4
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: ${{ secrets.AWS_REGION }}

      - name: Login to Amazon ECR
        id: login-ecr
        uses: aws-actions/amazon-ecr-login@v2

      - name: Build Backend Image
        run: |
          docker build -t ecommerce-api ./api

      - name: Tag Backend Image
        run: |
          docker tag ecommerce-api:latest \
          $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/ecommerce-api:latest

      - name: Push Backend Image
        run: |
          docker push \
          $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/ecommerce-api:latest

      - name: Build Frontend Image
        run: |
          docker build -t ecommerce-webapp ./webapp

      - name: Tag Frontend Image
        run: |
          docker tag ecommerce-webapp:latest \
          $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/ecommerce-webapp:latest

      - name: Push Frontend Image
        run: |
          docker push \
          $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/ecommerce-webapp:latest

      - name: Deploy Backend Service
        run: |
          aws ecs update-service \
            --cluster ecommerce-cluster \
            --service ${{ secrets.ECS_BACKEND_SERVICE }} \
            --force-new-deployment \
            --endpoint-url https://ecs.us-east-1.amazonaws.com

      - name: Deploy Frontend Service
        run: |
          aws ecs update-service \
            --cluster ecommerce-cluster \
            --service ${{ secrets.ECS_FRONTEND_SERVICE }} \
            --force-new-deployment \
            --endpoint-url https://ecs.us-east-1.amazonaws.com
```

9. Performance and Security:

- Implement caching in the workflow to optimize build times.

- Ensure all senseitive data, including API keys and database credentials, are secured using GitHub secrets.

Update your workflow;

```bash
cd .github/workflows/
nano ci.yml
```

```bash
name: Full Stack CI/CD

on:
  push:
    branches:
      - main
      - develop
      - staging

  pull_request:
    branches:
      - main
      - develop
      - staging

jobs:
  backend:
    runs-on: ubuntu-latest

    defaults:
      run:
        working-directory: api

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: npm
          cache-dependency-path: api/package-lock.json

      - name: Install Dependencies
        run: npm ci

      - name: Run Unit Tests
        run: npm test

      - name: Build Docker Image
        run: docker build -t ecommerce-api .

  frontend:
    runs-on: ubuntu-latest

    defaults:
      run:
        working-directory: webapp

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: npm
          cache-dependency-path: webapp/package-lock.json

      - name: Install Dependencies
        run: npm ci

      - name: Run Frontend Tests
        run: npm test -- --watchAll=false

      - name: Build React App
        run: npm run build

      - name: Build Docker Image
        run: docker build -t ecommerce-webapp .
```

![test](./img/test-1.JPG)

![test](./img/test.JPG)

![test](./img/test-2.JPG)

![test](./img/test-3.JPG)