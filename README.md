# spe test

This guides on how to develop, and deploy the application in a local Docker environment. The goal is to create a GitHubs workflow that automatically deploys the application to a locally hosted Docker environment whenever changes are pushed to the repository into the default branch (`main`). It comes with a basic CI/CD workflow.

## Assumptions

This assumes the infrastructure already has a machine to configure as a runner. However, if there is none available, feel free to look at [Setup a local runner machine with Vagrant (optional)](#setup-a-local-runner-machine-with-Vagrant-optional)) to setup a runner locally.

For the purpose of test, this assumes the application with be deployed to the same machine where the self-hosted runner is configured and running.

## Prerequisites
- Docker compose plugin installed. See the [Install Docker](./docs/install-docker.md) document for more information.
- Ensure your local machine configured a self-hosted GitHub runner. See the [Adding self-hosted runner to a repository](docs/add-self-hosted-runners.md) document for more information.

## Project directory structure

```bash
.
├── .github/workflows/
├── app/
├── compose.yaml
├── docs/
├── .pre-commit-config.yaml
├── README.md
├── scripts/
└── Vagrantfile

2 directories, 3 files
```

- `.github/workflows/`: contains automated GitHub Actions workflow to deploy to local environment.
- `app/`: Flask application source code, Dockerfile, and Flask depedencies
- `compose.yaml`: Docker compose stack for Flask app
- `scripts/`: contains all scripts for the project.
- `docs/`: Documents
- `.pre-commit-config.yaml` - pre-commit settings for various hooks
- `README.md`: README.md for the project repository
- `Vagrantfile`: optional Vagrantfile to help creating a virtual machine to use as runner locally.


## Develop locally

Steps to develop, and run the application locally

### 1. Checkout the project

Clone the project locally

### 2. Make changes

Do something with `app/app.py`

### 3. Build the Docker image

Ensure you are in root project directory, and execute Docker image build
```bash
docker compose build
```

### 4. Start the app

To start the app, execute the following command:
```bash
docker compose up -d
```

### 5. Access the application the browser

The application is now accessible at http://localhost:5000

## Deploy

To deploy, create a PR or push to `main` branch and let GitHub Actions handle it.

### Commit new changes

First commit all changes
```bash
git add -A
git commit -m 'feat: a nice feature'
```

### Push

*Make sure the self-hosted runner machine is up and running, as the workflow uses self-hosted ones*

Then push commits to the remote repository
```bash
git push
```

Once GitHub receives the push, it will trigger the workflow in `.github/workflows/main.yaml` and deploy accordingly.

## Code quality, analysis or security

The GitHub workflow supports the following scanning:
- Snyk

### Synk setup (Optional)

*If no Snyk token was found, the scan will be skipped*

To integrate with Snyk's platform for more advanced features (e.g,, vulnerability tracking, automatic fixes,), first obtain a personal Snyk token.

Set the Snyk token as a secret name `SNYK_TOKEN` in your GitHub repository settings

## Setup a local runner machine with Vagrant (optional)

This guides to quickly create a virtual machine that can be used as a runner when necessary. This uses [Vagrant](https://developer.hashicorp.com/vagrant) to manage virtual machines, and bootstrap with cloud-init for build tools, and Docker engine.

**This assumes**
- Vagrant installed. See [Install Vagrant](https://developer.hashicorp.com/vagrant/docs/installation) for more information.
- VirtualBox installed. To get VirtualBox, visit [Download VirtualBox](https://www.virtualbox.org/wiki/Downloads?). If you are using other hypervisors, just install it accordingly.

### Start a local virtual machine

Start a new virtual machine with `vagrant up`
```bash
vagrant up
```

### Configure the machine as a runner

Connect to the virtual machine
```bash
vagrant ssh
```

Once inside the virtual machine, perform the [Add self-hosted runners](docs/add-self-hosted-runners.md) to configure the machine as a runner.

## Troubleshooting

### GitHub Actions workflow is pending waiting for a runner

Summary: If the workflow run is pending with a message: `Waiting for a runner to pick up this job...`

Resolution: Because the workflow intended to deploy into an on-premise or a local environment, ensure the self-hosted runner machine is configured, and running.
