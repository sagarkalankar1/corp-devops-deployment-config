# deployment-configs

This folder manages deployment pipelines for our project, providing a streamlined process for deploying applications in different environments. The structure of this repository is designed to organize pipelines according to their respective environments, facilitating efficient deployment workflows.

# Folder Descriptions

### Non Prod 
* **Baseline Infra**: The `baseline-infra` directory is introduced to house configurations related to the baseline infrastructure. Within this directory, the azure-pipelines subdirectory contains a pipeline configuration (pipeline.yaml) for managing the baseline infrastructure. This may include foundational infrastructure setup shared across non-production environments.

* **Dev, QA, and UAT**: The `nonprod` directory continues to contain environments such as dev, qa, and uat. Each subdirectory under dev, qa,uat holds the respective pipeline configurations inside [`apim`](https://github.com/devsecops-len/template-deployment-config-repo/blob/release/deployment-configs/nonprod/README.md) folder that consist of `bff` and `pdf` services folder (pipeline-api-components.yaml).

* **load-test**: The `nonprod` directory contain `azure-pipelines` folder that consist of [`loadtest-trigger.yaml`](https://github.com/devsecops-len/template-deployment-config-repo/blob/release/deployment-configs/nonprod/README.md) file.

* **servicebus-components**: The `nonprod` directory contain [`queues.yaml`](https://github.com/devsecops-len/template-deployment-config-repo/blob/release/deployment-configs/nonprod/README.md) and [`topics-subscriptions.yaml`](https://github.com/devsecops-len/template-deployment-config-repo/blob/release/deployment-configs/nonprod/README.md) file.

### Prod
* **Baseline Infra**: The `baseline-infra` directory is introduced to house configurations related to the baseline infrastructure. Within this directory, the azure-pipelines subdirectory contains a pipeline configuration (pipeline.yaml) for managing the baseline infrastructure. This may include foundational infrastructure setup shared across non-production environments.

* **apim**: The `prod` holds the respective pipeline configurations inside [`apim`](https://github.com/devsecops-len/template-deployment-config-repo/blob/release/deployment-configs/nonprod/README.md) folder that consist of `bff` and `pdf` services folder (pipeline-api-components.yaml).

* **load-test**: The `prod` directory contain `azure-pipelines` folder that consist of [`loadtest-trigger.yaml`](https://github.com/devsecops-len/template-deployment-config-repo/blob/release/deployment-configs/nonprod/README.md) file.

* **servicebus-components**: The `prod` directory contain [`queues.yaml`](https://github.com/devsecops-len/template-deployment-config-repo/blob/release/deployment-configs/nonprod/README.md) and [`topics-subscriptions.yaml`](https://github.com/devsecops-len/template-deployment-config-repo/blob/release/deployment-configs/nonprod/README.md) file.

### Sandbox
* The `sandbox` directory is reserved for the sandbox environment. This environment is isolated from others and serves as a playground for proof of concept (POC) activities. Any pipelines or configurations specific to sandbox deployments are housed here.

* **Baseline Infra**: The `baseline-infra` directory is introduced to house configurations related to the baseline infrastructure. Within this directory, the azure-pipelines subdirectory contains a pipeline configuration (pipeline.yaml) for managing the baseline infrastructure. This may include foundational infrastructure setup shared across non-production environments.

* **apim**: The `sandbox` holds the respective pipeline configurations inside [`apim`](https://github.com/devsecops-len/template-deployment-config-repo/blob/release/deployment-configs/nonprod/README.md) folder that consist of `bff` and `pdf` services folder (pipeline-api-components.yaml).

* **load-test**: The `sandbox` directory contain `azure-pipelines` folder that consist of [`loadtest-trigger.yaml`](https://github.com/devsecops-len/template-deployment-config-repo/blob/release/deployment-configs/nonprod/README.md) file.

* **servicebus-components**: The `sandbox` directory contain [`queues.yaml`](https://github.com/devsecops-len/template-deployment-config-repo/blob/release/deployment-configs/nonprod/README.md) and [`topics-subscriptions.yaml`](https://github.com/devsecops-len/template-deployment-config-repo/blob/release/deployment-configs/nonprod/README.md) file.


# Usage

* DevOps team will create the pipelines as per the environment required to be deployed in. For eg:  If a pipeline is required to deploy in `Development` environment, keep the pipeline in `env/baseline-infra/azure-pipeline` folder (env -> nonprod,prod,sandbox)

* Additonally the `variable group` we use in the pipeline should be environment specific and easy to distinguish.
  > **Note:**
  > Link to the confluence page where best practise for variable groups is documented https://lennar.atlassian.net/wiki/spaces/PLAT/pages/684032063/DevOps+Variable+Group+Standardisation


* The `projectCode` is the short form of the initiative we are going to use For eg: `Green Folder Experiece` will have short form `GFX`.

* `SubscriptionId` will change according the environment in which we want it to be deployed.


Example to set variable group  in [`env/baseline-infra/azure-pipeline`](https://github.com/devsecops-len/template-deployment-config-repo/blob/release/deployment-configs/nonprod/baseline-infra/azure-pipelines/bicep-pipeline-nonprod.yaml)
```
variables:
- group: IAC_<projectCode>_GLOBAL_VAR_GRP
- group: IAC_<projectCode>_DEV_VAR_GRP

- name: resourceGroup
  value: azu-ln<projectCode>resd01
  readonly: true

- name: subscriptionId
  value: <envSubscriptionId>
  readonly: true

```

# Folder Structure 

```
└── deployment-configs
    ├── README.md
    ├── nonprod
    │   ├── README.md
    │   ├── baseline-infra
    │   │   └── azure-pipelines
    │   │       └── bicep-pipeline-nonprod.yaml
    │   ├── dev
    │   │   └── apim
    │   │       ├── bff
    │   │       │   ├── v1
    │   │       │   │   └── pipeline-api-components.yaml
    │   │       │   └── v2
    │   │       │       └── pipeline-api-components.yaml
    │   │       └── pdf
    │   │           ├── v1
    │   │           │   └── pipeline-api-components.yaml
    │   │           └── v2
    │   │               └── pipeline-api-components.yaml
    │   ├── load-test
    │   │   └── azure-pipelines
    │   │       └── loadtest-trigger.yaml
    │   ├── qa
    │   │   └── apim
    │   │       ├── bff
    │   │       │   ├── v1
    │   │       │   │   └── pipeline-api-components.yaml
    │   │       │   └── v2
    │   │       │       └── pipeline-api-components.yaml
    │   │       └── pdf
    │   │           ├── v1
    │   │           │   └── pipeline-api-components.yaml
    │   │           └── v2
    │   │               └── pipeline-api-components.yaml
    │   ├── servicebus-components
    │   │   ├── queues.yaml
    │   │   └── topics-subscriptions.yaml
    │   └── uat
    │       └── apim
    │           ├── bff
    │           │   ├── v1
    │           │   │   └── pipeline-api-components.yaml
    │           │   └── v2
    │           │       └── pipeline-api-components.yaml
    │           └── pdf
    │               ├── v1
    │               │   └── pipeline-api-components.yaml
    │               └── v2
    │                   └── pipeline-api-components.yaml
    ├── prod
    │   ├── README.md
    │   ├── apim
    │   │   ├── bff
    │   │   │   ├── v1
    │   │   │   │   └── pipeline-api-components.yaml
    │   │   │   └── v2
    │   │   │       └── pipeline-api-components.yaml
    │   │   └── pdf
    │   │       ├── v1
    │   │       │   └── pipeline-api-components.yaml
    │   │       └── v2
    │   │           └── pipeline-api-components.yaml
    │   ├── baseline-infra
    │   │   └── azure-pipelines
    │   │       └── bicep-pipeline-prod.yml
    │   ├── load-test
    │   │   └── azure-pipelines
    │   │       └── loadtest-trigger.yaml
    │   └── servicebus-components
    │       ├── queues.yaml
    │       └── topics-subscriptions.yaml
    └── sandbox
        ├── README.md
        ├── apim
        │   ├── bff
        │   │   ├── v1
        │   │   │   └── pipeline-api-components.yaml
        │   │   └── v2
        │   │       └── pipeline-api-components.yaml
        │   └── pdf
        │       ├── v1
        │       │   └── pipeline-api-components.yaml
        │       └── v2
        │           └── pipeline-api-components.yaml
        ├── baseline-infra
        │   └── azure-pipelines
        │       └── bicep-pipeline-sandbox.yml
        ├── load-test
        │   └── azure-pipelines
        │       └── loadtest-trigger.yaml
        └── servicebus-components
            ├── queues.yaml
            └── topics-subscriptions.yaml
```