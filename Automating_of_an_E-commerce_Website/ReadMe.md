# CI/CD Mastery

## Project Review

A technology consulting firm, is adopting a cloud architecture for its software applications. As a DevOps Engineer, your task is to design and implement a robust CI/CD pipeline using Jenkins to automate the deployment of a web application. The goal is to achieve continuous integration, continuous deployment, and ensure the scalability and reliability of the application.

### Project Task

**Jenkins Server Setup**

- Install Jenkins on a dedicated server.

1. Update the server.

```bash
sudo yum update -y
```

![server-update](./img/update.JPG)

2. Install Java.

```bash
sudo yum install java-17-amazon-corretto -y
```

![Installation](./img/java-install.JPG)

3. Install Jenkins.

```bash
sudo wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo
```

![Repo](./img/jenkins-repo.JPG)

```bash
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
```

![repo](./img/jenk.JPG)

```bash
sudo yum install jenkins -y
```

![install](./img/install-jenkins.JPG)

4. Start and Enable Jenkins.

```bash
sudo systemctl start jenkins
sudo systemctl enable jenkins
```

![start](./img/start-jenkins.JPG)

```bash
sudo systemctl status jenkins
```

![status](./img/jenkins-status.JPG)

5. Access Jenkins.

```bash
http://13.61.104.56:8080/
```

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

![Signin](./img/signin-jenkins.JPG)

- Set up necessary plugins (Git, Docker, etc.).

1. Go to manage Jenkins to install plugins.

![settings](./img/settings.JPG)

2. Select the preferred plugins and click "install".

![Select](./img/selected-plugins.JPG)

![plugins](./img/installed-plugins.JPG)

- Configure Jenkins with required security measures.

1. Install and configure docker.

```bash
sudo yum install docker -y
```

![Install-docker](./img/install-docker.JPG)

2. Start Docker.

```bash
sudo systemctl start docker
sudo systemctl enable docker
```

![Docker](./img/start-docker.JPG)

3. Allow Jenkins to Use Docker.

```bash
sudo usermod -aG docker jenkins
sudo systemctl restart docker
sudo systemctl restart jenkins
```

![allow](./img/jenkins-docker.JPG)

4. Enable Authentication. Go to "Manage Jenkins", click on "Security", and enable Jenkins own user database and Matrix/Role-based authorization.

![manage-jenkins](./img/manage-jenkins.JPG)

![Security](./img/security.JPG)

![Add-security](./img/add-level.JPG)

5. Disable Anonymous Access.

![edit-user](./img/edit-user.JPG)

![user](./img/user.JPG)

6. Use Strong Credentials.

![credentials](./img/credentials.JPG)

### Source Code Management Repository Integration

- Create a freestyle job.

![freestyle-job](./img/freestyle-job.JPG)

![Create-job](./img/freestyle-settings.JPG)

- Integrate Jenkins with the source code management repository. Note that we have created a github repository in our previous project "jenkins-scm". So you copy the link and paste on the freestyle job configuration.

![source-code](./img/source-code.JPG)

![main-branch](./img/branch-setting.JPG)

- Configure webhooks for automatic triggering of jenkins builds. Go to github setting and the webhook.

![Setting](./img/webhook.JPG)

![add-webhook](./img/add-webhook.JPG)

![Configuration](./img/config-webhook.JPG)

![Setting](./img/webhook-trigger.JPG)

![Setting](./img/webhook-setting.JPG)

![github-trigger](./img/trigger.JPG)

![Test](./img/freestyle-test.JPG)

### Jenkins Pipeline for Web Application

- Create a pipeline job for the web application by clicking "New item" on the Jenkins dashboard.

![Pipeline-job](./img/pipeline-job.JPG)

![description](./img/desc.JPG)

- Configuring Build Trigger

Like we did with the freestyle job project, we will create a build trigger for jenkins new build.

1. Click on build trigger on the configure menu to configure triggering the job from GitHub webhook.

![build-trigger](./img/build-trigger.JPG)

2. Since we have already created a github webhook previously, we do not need to create another one again.

- Writing Jenkins Pipeline Script. Click "Pipeline" on the configure menu and paste the pipeline script below.

```bash
pipeline {
    agent any

    stages {

        stage('Connect To GitHub') {
            steps {
                checkout scmGit(
                    branches: [[name: '*/main']],
                    extensions: [],
                    userRemoteConfigs: [[
                        url: 'https://github.com/bruyo/jenkins-scm.git'
                    ]]
                )
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t dockerfile .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh '''
                    docker stop mycontainer || true
                    docker rm mycontainer || true
                    docker run -d --name mycontainer -p 8081:80 dockerfile
                    '''
                }
            }
        }

    }
}
```

![Pipeline-script](./img/pipeline-script.JPG)

![Test](./img/test-pipeline.JPG)

### Docker Image Creation and Registry Push

- Configure Jenkins to build Docker images.

1. Create a file named docker.sh

```bash
nano docker.sh
```

2. Open the file and paste the script below

```bash
# Update system
sudo yum update -y

# Install Docker
sudo yum install docker -y

# Start Docker service
sudo systemctl start docker

# Enable Docker on boot
sudo systemctl enable docker

# Add ec2-user to docker group
sudo usermod -aG docker ec2-user

# Verify Docker status
sudo systemctl status docker

# Verify Docker version
docker --version
```

3. Save and close the file.

![Docker-script](./img/docker-script.JPG)

- Make the file executable.

```bash
chmod u+x docker.sh
```

![execute-file](./img/execute-file.JPG)

5. Execute the file.

```bash
./docker.sh
```

![Docker-installation](./img/installed-docker.JPG)

we have successfully installed docker.

Now that we have docker installed on the same instance with jenkins, we need to create a dockerfile before we can run our pipeline script. 

6. Create a new file named **'dockerfile'**.

```bash
nano dockerfile
```

7. Paste the code snippet below in the file.

```bash
# Use official NGINX image
FROM nginx:latest

# Set working directory
WORKDIR /usr/share/nginx/html

# Remove default NGINX static files
RUN rm -rf ./*

# Copy application files
COPY index.html .

# Expose web port
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
```

9. Create an **'index.html'** file and paste the content below.

```bash
nano index.html
```

```bash
Congratulations, You have successfully run your web application.
```

10. Create Jenkins Pipeline for Docker Image. Copy and paste the docker image pipeline script below and also create dockerhub repository named "jenkins-scm".

![dockerhub-repo](./img/dockerhub-repo.JPG)

![repo](./img/created-repo.JPG)

```bash
pipeline {
    agent any

    environment {
        IMAGE_NAME = "yourdockerhubusername/jenkins-scm"
        IMAGE_TAG = "latest"
        CONTAINER_NAME = "mycontainer"
    }

    stages {

        stage('Connect To GitHub') {
            steps {
                git branch: 'main',
                url: 'https://github.com/bruyo/jenkins-scm.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t $IMAGE_NAME:$IMAGE_TAG .
                '''
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                docker stop $CONTAINER_NAME || true
                docker rm $CONTAINER_NAME || true

                docker run -d \
                    --name $CONTAINER_NAME \
                    -p 8081:80 \
                    $IMAGE_NAME:$IMAGE_TAG
                '''
            }
        }

        stage('Push To DockerHub') {
            steps {

                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {

                    sh '''
                    echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin

                    docker push $IMAGE_NAME:$IMAGE_TAG
                    '''
                }
            }
        }
    }

    post {

        success {
            echo 'Docker image built and container deployed successfully!'
        }

        failure {
            echo 'Pipeline execution failed!'
        }
    }
}
```

![Docker-script](./img/docker-pipeline-script.JPG)

11. Configure Jenkins credentials.

![dockerhub-credentials](./img/dockerhub-credentials.JPG)

![credential](./img/add-credentials.JPG)

![User-data](./img/user-data.JPG)

![push-docker](./img/password.JPG)

- Run a container using the built docker image.

![Test](./img/test-pipeline-.JPG)

1. Verify Container Running.

```bash
docker ps
```

![Verify](./img/verify-docker.JPG)

2. Verify Image Exists.

```bash
docker images
```

![Verify](./img/verify-image.JPG)

- Access the web application on the web browser.

```bash
http://13.61.104.56:8081/
```

![Test](./img/web-test.JPG)

- Push Docker images to a container registry.

![Pushed-docker-image](./img/pushed-image.JPG)