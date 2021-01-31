# Introduction 
This project is collection of commonly used microservice CI/CD templates to promote reusability.

# Getting Started with Microservice Templates
To use these templates follow these steps:
 1. Create YAML file in the root of the repo Microservice repo named `ci-cd.yml`
 2. Set up the reference to common-pipeline-templates
 1. 
    ```yaml
    resources:
      repositories:
      - repository: commontemplates # Unique name that is used to reference resource later in the pipeline
        type: git
        name: common-pipeline-templates # Name of repository
        ref: refs/heads/master # Name of the branch
    ``` 
1. Use the template by referencing it
1. 
   ```yaml
   stages:
   - template: microservice/ci-cd-stages.yml@commontemplates
     parameters:
       testDockerFile: ''
       testDockerFileArgs: ''
       serviceDockerFile: ''
       serviceDockerFileArgs: ''
       serviceName: ''
       serviceImageTag: ''
       kubernetesFile: ''
       devAppInsightsKey: ''
       qatAppInsightsKey: ''
       uatAppInsightsKey: ''
   ```

## Pipelines explanation

All pipelines start with ci-cd-stages.yml.
Every other pipeline is a template that is included in ci-cd-stages.yml file.