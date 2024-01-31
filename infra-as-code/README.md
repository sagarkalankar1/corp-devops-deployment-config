# infra-as-code
This is the main directory for the infrastructure-as-code templates.

## Objective

This repository encompasses infrastructure-as-code (IaC) templates utilizing Bicep. The structure is intentionally crafted to facilitate environment-specific configurations, featuring a shared main Bicep file applicable across all environments. Each environment is designated its own folder, housing Bicep parameter files uniquely tailored to the specifications of that particular environment.

## bicep 
 This subfolder contains environment-specific folders and the main Bicep file.

  - **dev01, prod01, qa01, sandbox01, uat01:** These folders represent different environments, each containing a "baseline-infra" subfolder.

## baseline-infra
Subfolder for environment-specific baseline infrastructure configurations.

  These Bicep parameter files contain parameters specific to each environment:
  - **[parameters-dev.bicepparam](https://github.com/devsecops-len/template-deployment-config-repo/blob/release/infra-as-code/bicep/dev01/baseline-infra/parameters-dev.bicepparam)**, 
  - **[parameters-prod.bicepparam](https://github.com/devsecops-len/template-deployment-config-repo/blob/release/infra-as-code/bicep/prod01/baseline-infra/parameters-prod.bicepparam)**, 
  - **[parameters-qa.bicepparam](https://github.com/devsecops-len/template-deployment-config-repo/blob/release/infra-as-code/bicep/qa01/baseline-infra/parameters-qa.bicepparam)**, 
  - **[parameters-sandbox.bicepparam](https://github.com/devsecops-len/template-deployment-config-repo/blob/release/infra-as-code/bicep/sandbox01/baseline-infra/parameters-sandbox.bicepparam)**, 
  - **[parameters-uat.bicepparam](https://github.com/devsecops-len/template-deployment-config-repo/blob/release/infra-as-code/bicep/uat01/baseline-infra/parameters-uat.bicepparam)**.

## main.bicep 
This is the common [main.bicep](https://github.com/devsecops-len/template-deployment-config-repo/blob/release/infra-as-code/bicep/main.bicep) file used by all environments.

This structure allows for a modular and organized approach to managing environment-specific infrastructure configurations using Bicep.

## Folder Structure
```

infra-as-code
└── bicep
    ├── dev01
    |   └── baseline-infra
    |       └── parameters-dev.bicepparam
    ├── prod01
    |   └── baseline-infra
    |       └── parameters-dev.bicepparam
    ├── qa01
    |   └── baseline-infra
    |       └── parameters-qa.bicepparam
    ├── sandbox01
    |   └── baseline-infra
    |       └── parameters-sandbox.bicepparam
    ├── uat01
    |   └── baseline-infra
    |       └── parameters-uat.bicepparam
    └── main.bicep

```
