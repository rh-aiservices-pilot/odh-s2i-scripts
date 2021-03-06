# odh-s2i-scripts

These scripts are meant to be run from an Open Data Hub JupyterHub environment and provide some basic scripted functions for creating a new project, repo, and application.

## Installing
Install scripts and pre-requesites.
```shell
curl -o- https://raw.githubusercontent.com/cfchase/odh-s2i-scripts/master/install.sh | bash
```

## Create a new project
Initializes a file structure including notebooks and a buildable s2i flask application.
```shell
odh new-project
```

## Create a new repository
Initializes and creates a new repository in GitHub.
```shell
odh new-repo <repo_directory>
```

## Create a new OpenShift application
Creates a new OpenShift application (deployment, service, buildconfig, imagestream, route) for model serving from the GitHub repo in a directory (`<repo-directory>`) in an OpenShift project (`<oc-project>`).

You must be logged into the OpenShift cluster using `oc login` using either username and password or a token. Full documentation [here](https://docs.okd.io/latest/cli_reference/openshift_cli/getting-started-cli.html#cli-logging-in_cli-developer-commands)
```shell
oc login --token=sha256~XYZ --server=https://api.my-cluster:6443
odh new-app <repo-directory> <oc-project>
```

## Create a webhook in an OpenShift application
Optionally, after creating the application, view the build config and add a webhook in GitHub.  The application will rebuild on `git push`
1. In the project repo click Settings -> Webhooks
1. Click Add webhook
1. Paste the value from BuildConfig
1. Change Content type to JSON
1. Click Add Webhook to save

