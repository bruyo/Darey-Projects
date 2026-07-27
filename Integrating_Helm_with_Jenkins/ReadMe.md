# Integrating Helm with Jenkins

## Project Overview

In this project, we will explore the integration of Helm with Jenkkins, enabling seamless deployment and automation of Kubernetes applications.

### Project Tasks

**Integrating Helm with CI/CD (Jenkins)**

1. Jenkins Setup//;

- Install Jenkins on your system with the default recommended plugins. If Jenkins is not already installed, follow the **https://www.jenkins.io/doc/book/installing/**.

For Windows:

- Download Jenkins with this link **https://www.jenkins.io/download/#downloading-jenkins**.

![Download-jenkins](./img/jenkins.JPG)

![Download-jenkins](./img/download-jenkins.JPG)

- Install Jenkins.

![install](./img/install.JPG)

![Install](./img/jk-install.JPG)

![install](./img/jk.JPG)

![install](./img/jk-port.JPG)

![install](./img/next-jk.JPG)

![install](./img/next.JPG)

![install](./img/select-java.JPG)

![install](./img/jk-select.JPG)

![install](./img/jk-select.JPG)

![install](./img/install-jk.JPG)

![install](./img/install-complete.JPG)

![install](./img/8080.JPG)

![secret](./img/secret.JPG)

![add-secret](./img/add-key.JPG)

![Install](./img/customize-jk.JPG)

![install](./img/create-account.JPG)

![install](./img/start-jk.JPG)

2. Determine Helm Binary Path:

- The full binary path of Helm is required in the Jenkins pipeline script.

- To find it, use: 

- **Linux/macOS: 'which helm'**

- **Windows: 'Get-Command helm | Select-Object -ExpandProperty Source'** in Powershell.

![helm](./img/helm-path.JPG)


3. Create a Jenkins Pipeline:

- In Jenkins, create a new pipeline job.

- Set the pipeline source as the Git repository you pushed your code to.

- Configure the pipeline to trigger a build on commit to your repository.

![create-job](./img/create-job.JPG)

![Settings](./img/settings-job.JPG)

![settings](./img/setting.JPG)

![github](./img/github.JPG)

![setting](./img/git-repo.JPG)

![settings](./img/trigger.JPG)

4. Pipeline script example with full Helm Path:

- Use the determined full path of Helm in the pipeline script. For example

```bash
pipeline {
    agent any
    environment {
        KUBECONFIG = "C:\\ProgramData\\Jenkins\\.jenkins\\.kube\\config"
    }
    stages {
        stage('Verify Cluster') {
            steps {
                bat 'kubectl get nodes'
            }
        }
        stage('Deploy with Helm') {
            steps {
                dir('webapp') {
                    bat 'helm upgrade --install my-webapp . --namespace default'
                }
            }
        }
    }
}
```

![script](./img/pipeline-script.JPG)

- Replace **'/usr/local/bin/helm'** with the path determined in the next step.

**Update Helm Chart and Trigger Jenkins Pipeline**

1. Update Helm Chart and Push Changes:

- Edit the **'values.yaml'** file:

- Open the **'values.yaml'** in your 'webapp' chart directory.

- Change the **'replicaCount'** to **'3'** to increase the number of replicas.

- Save the changes.

```bash
nano values.yaml
```

![changes](./img/replica.JPG)

- Edit the **'templates/deployment.yaml'** file:

- Open the **'deployment.yaml'** located in the 'templates' directory.

- Locate the **'resources'** section under **'spec.template.spec.containers'**.

- Update the resource requests as follows;

```bash
resources:
  requests:
    memory: "180Mi"
    cpu: "120m"
```

![resources](./img/resources.JPG)

- Save the changes.

2. Commit and Push the Changes:

- Use Git commands to commit these changes and push them to the remote repository. This will trigger the Jenkins Pipeline.

- Execute the following git commands in your terminal;

```bash
git add .
git commit -m "Updated replicas, memory and CPU requests"
git push
```

![push](./img/git-push.JPG)

3. Jenkins Pipeline Trigger:

- Once you push the changes to the repository, the configured Jenkins pipeline will detect the commit.

- Jenkins will then automatically start a new build, deploying your updated Helm Chart with the new configurations.

![test](./img/test.JPG)