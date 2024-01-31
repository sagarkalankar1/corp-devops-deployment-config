# Nonprod Folder Structure

The "nonprod" folder is organized to categorize various components and configurations for non-production environments.


- **nonprod:** This is the main folder for non-production environment components.

  - **baseline-infra:** Subfolder for baseline infrastructure configurations and components.

  - **load-test:** Subfolder for load testing configurations and related components.

  - **serviceBus-components:** Subfolder for configurations and components related to Service Bus.

  - **dev,qa,uat:** Subfolder for the environment specific and consisting of microservices.

This structure helps in organizing and managing different components specific to the non-production environment. Adjustments and additions can be made within each subfolder based on specific requirements.

# Baseline-Infra

Baseline infrastructure configurations and components.

## Usage of `bicep-pipeline-nonprod.yaml`

This README provides an overview of the [`bicep-pipeline-nonprod.yaml`](https://github.com/devsecops-len/template-deployment-config-repo/blob/release/deployment-configs/nonprod/baseline-infra/azure-pipelines/bicep-pipeline-nonprod.yaml) file, an Azure Pipeline YAML configuration for deploying non-production infrastructure using Bicep templates.

  ## Pipeline Configuration

  ### Trigger

   The pipeline is set to trigger on "none," indicating manual initiation.

  ### Variables

   - Global variable groups `IAC_<projectCode>_GLOBAL_VAR_GRP` and `IAC_<projectCode>_NONPROD_VAR_GRP` are referenced for shared variables.
   - Constants like `resourceGroup` and `subscriptionId` are defined.

  ### Pool

   The pipeline utilizes an Ubuntu agent with the latest version.

  ### Parameters

   - `templateBranch`: Specifies the branch from the "release" branch to refer to.
   - `iacModulesBranch`: Specifies the branch for IaC modules, defaulting to the value from the variable `G_IAC_MODULE_REPO_BRANCH`.
   - `env`: Allows choosing the deployment environment from options like `dev01`, `qa01`, and `uat01`.

  ### Resources

   Two repositories (`CI_CD_Templates` and `iacModules`) are configured, referencing GitHub endpoints and specific branches.

  ### Stages

   The pipeline includes a single stage, referencing the deployment template (`bicep-deployment-template.yaml`) from the `CI_CD_Templates` repository.

   #### Parameters for the `bicep-deployment-template.yaml`:

   - `resourceGroup`: The Azure resource group.
   - `subscriptionId`: The Azure subscription ID.
   - `csmFile`: Path to the main Bicep file.
   - `parameterFile`: Path to the Bicep parameter file specific to the chosen environment.
   - `env`: The selected deployment environment.

   This pipeline is intended for deploying non-production infrastructure using Bicep templates, providing flexibility and consistency across different environments.



# APIM

This repository is organized to facilitate the management, deployment, and creation of APIs within different environments using Azure API Management (APIM). The APIM folders are created specifically for each environment, such as development (dev), quality assurance (qa), and user acceptance testing (uat).


- **dev, qa, uat:** These folders represent different environments where APIs are deployed and managed. Each environment has its own set of configurations and APIs.

- **apim:** This folder is dedicated to Azure API Management. It contains environment-specific subfolders for better organization.

- **bff/pdf:** This folder represents a specific micro-service or API within the APIM environment.

- **v1/v2:** Within the micro-service folder, there are version-specific subfolders. This allows for the organization of APIs based on their versions.

- **pipeline-api-components.yaml:** This file contains the deployment pipeline configuration for the API components specific to the version. Deployment pipelines are unique not only at the micro-service level but also at the version level.

## Usage

This repository follows a structured approach to manage APIs in different environments using Azure API Management. To deploy or manage APIs:

1. Navigate to the specific environment folder (e.g., `dev`, `qa`, `uat`).
2. Within the environment folder, locate the micro-service folder (`bff` in the example).
3. Navigate to the version-specific folder (`v1` in the example).
4. Utilize the [`pipeline-api-components.yaml`](https://github.com/devsecops-len/template-deployment-config-repo/blob/release/deployment-configs/nonprod/dev/apim/bff/v1/pipeline-api-components.yaml) file to configure deployment pipelines for the API components of that version.

Refer to the folder structure diagram for a visual representation of the organization. This structure helps maintain clarity and organization when working with multiple APIs and environments in Azure API Management.


# Load Test

The Load Test folder is designed to store pipelines related to deployment and triggering for Azure Load Test service. This organization ensures a clear structure for managing load tests within the project.

- **Load-test:** This is the main folder for managing load test-related pipelines.

- **azure-pipelines:** Within the Load-test folder, this subfolder is dedicated to categorizing Azure pipelines related to load testing. This structure helps in future-proofing for any additional deployment configurations that may be added for load testing.

- **loadtest-trigger.yaml:** This YAML file, located within the azure-pipelines folder, contains the Azure pipeline configuration for deploying and triggering all load tests for the project. The pipeline is scoped to allow control over deployment and triggers for all load tests specific to the project at the subscription level.

## Usage

The [`loadtest-trigger.yaml`](https://github.com/devsecops-len/template-deployment-config-repo/blob/release/deployment-configs/nonprod/load-test/azure-pipelines/loadtest-trigger.yaml) pipeline is designed to deploy and trigger all load tests for the project. It is scoped to provide control over deployment and triggers for load tests across different environments, such as development (dev), quality assurance (qa), user acceptance testing (uat), and production (prod).

For example:
- The GFX non-prod pipeline allows you to deploy and trigger load tests for the load test service of GFX dev, GFX qa, and GFX uat.
- The GFX prod pipeline is configured to deploy and trigger load tests for the load test service of GFX prod.
- The GFX sandbox pipeline is set up for deploying and triggering load tests specific to the load test service of GFX sandbox.

This structure facilitates organized management and execution of load tests across different environments within the project.

# ServiceBus Components

This repository contains configurations for ServiceBus components, including queues and topics-subscriptions.

## Configuration Files

### Queues

The configuration for queues is defined in the [`queues.yaml`](https://github.com/devsecops-len/template-deployment-config-repo/blob/release/deployment-configs/nonprod/servicebus-components/queues.yaml) file. This file is used to create queues specific to the environment and application. Customize queue settings, such as names and properties, in this file.

### Topics and Subscriptions

The configuration for topics and subscriptions is defined in the [`topics-subscriptions.yaml`](https://github.com/devsecops-len/template-deployment-config-repo/blob/release/deployment-configs/nonprod/servicebus-components/topics-subscriptions.yaml) file. This file is used to create topics and subscriptions specific to the environment and application. Customize topic and subscription settings in this file according to your requirements.

## Usage

1. Update the following variables in the pipeline configuration:

   - `projectCode`: 3 Letter Project Code Name.
   - `resourceGroup`: Resource group where the ServiceBus component exists.
   - `subscriptionId`: Subscription Id.

2. Set the desired values for the variables in the pipeline configuration file (`azure-pipelines.yml`).

```yaml
variables:
  - name: projectCode
    value: <projectCode>
    readonly: true

  - name: resourceGroup
    value: <resourceGroup>
    readonly: true

  - name: subscriptionId
    value: <subscriptionId>
    readonly: true
```

## Folder Structure
```plaintext
nonprod
├── baseline-infra
│   └── azure-pipelines
│       └── bicep-pipeline-nonprod.yaml
├── load-test
│   └── azure-pipelines
│       └── loadtest-trigger.yaml
├── serviceBus-components
│   └── queues.yaml
│   └── topics-subscriptions.yaml
├── dev
│   └── apim
│       ├── bff
│       │   ├── v1
│       │   │   ├── pipeline-api-components.yaml
│       │   └──v2
│       │       └── pipeline-api-components.yaml
│       └── pdf
│           ├── v1
│           │   ├── pipeline-api-components.yaml
│           └── v2
│               └── pipeline-api-components.yaml
├── qa
│   └── apim
│       ├── bff
│       │   ├── v1
│       │   │   ├── pipeline-api-components.yaml
│       │   └── v2
│       │       └── pipeline-api-components.yaml
│       └── pdf
│           ├── v1
│           │   ├── pipeline-api-components.yaml
│           └── v2
│               └── pipeline-api-components.yaml
└── uat
    └── apim
        ├── bff
        │   ├── v1
        │   │   ├── pipeline-api-components.yaml
        │   └── v2
        │       └── pipeline-api-components.yaml
        └── pdf
            ├── v1
            │   ├── pipeline-api-components.yaml
            └── v2
                └── pipeline-api-components.yaml

```