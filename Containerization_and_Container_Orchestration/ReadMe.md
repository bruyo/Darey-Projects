# Containerization and Container Orchestration

## Project Review

Develop a microservices-based weather application. The implementation involves creating two microservices; one for fetching weather data and another for diplaying it. The primary objectives include containerizing these microservices using Docker, deploying them to a Kubernetes cluster, and accessing them through Nginx.


### Phase 1: Basic Frontend Application with Docker and Kubernetes

**Hypothetical Use Case**

We are deploying a simple static website (HTML and CSS) for a company's landing page. The goal is to containerize this application using Docker, deploy it to a Kubernetes cluster, and access it through Nginx.

### Task

1. **Set up the project**

- Create a new project directory.

'mkdir my-weather-app'

![Directory](./img/app-dir.JPG)

- Inside the directory, create HTML file ('index.html') and a CSS file ('styles.css').

'touch index.html'

![index-file](./img/index-file.JPG)

- Copy and paste the code snippet below.

![Updated-file](./img/updated-index-file.JPG)

'touch styles.css'

![css-file](./img/css-file.JPG)

- Copy and paste the code snippet below.

![Updated-file](./img/updated-css-file.JPG)

2. **Initialize Git.**

- Initialize a Git repository in the project directory.

'git init'

![Initialize-git](./img/git-init.JPG)

3. **Git Commit.**

- Add and commit the initial code to the Git repository.

'git add .'

![Add](./img/add-file.JPG)

'git commit -m "my first commit"'

![Commit](./img/commit-file.JPG)

4. **Dockerize the application**

- Create a 'Dockerfile' specfying Nginx as the base image.

'nano Dockerfile'

- Copy and paste the code snippet below into your Dockerfile.

- Copy your HTML and CSS files into the Nginx HTML directory.

'# Use official Nginx image
FROM nginx:latest

# Remove default Nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy your HTML and CSS files into Nginx directory
COPY index.html /usr/share/nginx/html/
COPY styles.css /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start Nginx (already default, but explicit is fine)
CMD ["nginx", "-g", "daemon off;"]'

![dokerfile](./img/dockerfile.JPG)

- Build the Docker Image.

'docker build -t my-weather-app .'

![Build](./img/docker-build.JPG)

- Run the Container.

'docker run -p 8080:80 my-weather-app'

![Run](./img/run-container.JPG)

- Test in browser.

'http://localhost:8080'

![Test](./img/test.JPG)

5. **Push to Docker Hub**

- Log in to Docker Hub.

![Docker-hub](./img/docker-hub.JPG)

- Push the Docker image to Docker Hub.

- Create a repository named "my-weather-app".

![Create](./img/create-repo.JPG)

![Repo](./img/repo.JPG)

- Login to Docker Hub from terminal.

'docker login'

![Login](./img/login.JPG)

- Tag your image correctly.

'docker images'

![Image](./img/docker-image.JPG)

'docker tag my-weather-app bruyo/my-weather-app:latest'

![Tag](./img/tag-image.JPG)

- Push the Image.

'docker push bruyo/my-weather-app:latest'

![Push](./img/push.JPG)

6. **Set up a Kind Kubernetes Cluster**

- Install Kind (Kubernetes in Docker)

'choco install kind'

![Install-Kubernetes](./img/kind.JPG)

- Verify installation.

'kind version'

![Version](./img/version-kind.JPG)

- Ensure that Docker is running, the docker desktop must be running as well.

'docker ps'

![Docker](./img/docker-run.JPG)


- Create a Kind cluster.

- Clean old bruken cluster

'kind delete cluster'

'docker system prune -f'

'kind create cluster --image kindest/node:v1.29.2'

![Kind-cluster](./img/kind-cluster.JPG)

- Verify Cluster.

'kubectl get nodes'

![Verify](./img/verify-cluster.JPG)

- Deploy the Application.

'kubectl create deployment nginx --image=nginx'

![Deployment](./img/dp-nginx.JPG)

'kubectl get pods'

![Pod](./img/get-pod.JPG)

- Expose Service.

'kubectl expose deployment nginx --type=NodePort --port=80'

![Expose](./img/expose-svc.JPG)

- Get Access URL.

'kubectl get svc'

![service](./img/get-service.JPG)

'kubectl port-forward service/nginx 8080:80'

![Port](./img/port.JPG)

- Open browser and open application with the link below:

'http://localhost:8080'

![Test](./img/test-1.JPG)

7. **Deploy to Kubernetes using YAML file**

- Create a Kubernetes Deployment YAML file specifying the image and desired replicas.

'nano nginx-deployment.yaml'

- Copy and paste the code snippet below into the yaml file.

apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-nginx-deployment
spec:
  replicas: 2
  selector:
    matchLabels:
      app: my-weather
  template:
    metadata:
      labels:
        app: my-weather
    spec:
      containers:
      - name: nginx-container
        image: nginx:latest   # Or your Docker Hub image (e.g. bruyo/my-nginx-app:latest)
        ports:
        - containerPort: 80


![File](./img/dp-code.JPG)

- Apply the deployment to the cluster.

'kubectl apply -f nginx-deployment.yaml'

![Dp](./img/dp-created.JPG)

- Verify Deployment.

'kubectl get deployments'

![Verify](./img/apply-clp.JPG)

8. **Create a Service (ClusterIP)**

- Create a Kubernetes service YAML file specifying the type as ClusterIP.

'nano nginx-service.yaml'

- Copy and paste the code snippet below into the yaml file.

apiVersion: v1
kind: Service
metadata:
  name: my-nginx-service
spec:
  type: ClusterIP
  selector:
    app: my-weather   # MUST match Deployment labels
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80


![Yaml-file](./img/svc-yaml.JPG)

- Apply the service to the cluster.

'kubectl apply -f nginx-service.yaml'

![Yaml-file](./img/svc-file.JPG)

- Verify Service.

'kubectl get svc'

![Verify](./img/verify-svc.JPG)

9. **Access the Application**

- Port-forward to the service to access the application locally.

'kubectl port-forward service/my-nginx-service 8080:80'

![Port-Forward](./img/port-forward.JPG)

- Open your browser and visit the specified port to view the application.

'http://localhost:8080'

![Test](./img/test-1.JPG)