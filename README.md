[![CircleCI](https://circleci.com/gh/dodopontocom/terraform-gcp-lab.svg?style=svg)](https://circleci.com/gh/dodopontocom/terraform-gcp-lab)

## Google Cloud Platform LAB Repository
This repository is part of my GCP studies to perform the vast possibilities of using/implementing google services  

### Bring your custom script to run anything you desire
Commit your script into ./scripts folder and change the script name into the cicd-definitions.sh file as below  

``` sh
export TF_VAR_startup_script="../scripts/<YOUR_SCRIPT>.sh"
```

You can also customize firewall rule to forward your application port and access it via compute external IP:<port>  
Editing the file terraform/compute-instance.tf  
``` sh
resource "google_compute_firewall" "http-server" {
  name    = "default-allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "<PORT>"]
  }
```

## Custom commit message to trigger CircleCi pipeline
In order to have custom builds it is possible to commit with special messages  
`[skip ci]` <- built in flag that skips pipeline trigger  
`[tf-destroy]` <- triggers the pipeline to run 'terraform destroy' which will shutdown current GCP infrastructure  

`[custom-command]` <- triggers the pipeline and runs the command specified  
For this custom command you need to use a pipe '|' and then the command as follow as an example:  

``` sh
$ git commit -m "[custom-command] | terraform init"
```

[custom-vm]|script_name.sh
