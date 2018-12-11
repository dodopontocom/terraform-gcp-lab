#!/bin/bash
# run terraform commands from docker container
# no need terraform previous installation
# requirement: docker
# https://hub.docker.com/r/hashicorp/terraform/

export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export AWS_DEFAULT_REGION="us-west-1"

if [ -z "$1" ]; then
  echo "Usage: must pass the terraform directory"
  elif [ -z "$2" ]; then
    echo "Usage: must pass the terraform command as second parameter"
    echo -e "
    Common commands:
    apply              Builds or changes infrastructure
    console            Interactive console for Terraform interpolations
    destroy            Destroy Terraform-managed infrastructure
    env                Workspace management
    fmt                Rewrites config files to canonical format
    get                Download and install modules for the configuration
    graph              Create a visual graph of Terraform resources
    import             Import existing infrastructure into Terraform
    init               Initialize a Terraform working directory
    output             Read an output from a state file
    plan               Generate and show an execution plan
    providers          Prints a tree of the providers used in the configuration
    push               Upload this Terraform module to Atlas to run
    refresh            Update local state file against real resources
    show               Inspect Terraform state or plan
    taint              Manually mark a resource for recreation
    untaint            Manually unmark a resource as tainted
    validate           Validates the Terraform files
    version            Prints the Terraform version
    workspace          Workspace management

    All other commands:
    debug              Debug output management (experimental)
    force-unlock       Manually unlock the terraform state
    state              Advanced state management"
  else
    cd $1
    terraform() {
        docker run --rm -it -v ${PWD}:/home -w /home hashicorp/terraform $1
    }
    terraform $2
    cd -
fi

#endscript
