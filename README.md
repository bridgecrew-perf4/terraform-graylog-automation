# Graylog configuration automation

To automate the tedious Graylog configs...

## Prerequisite

* Docker engine
* GNU make
* Terraform CLI 
  * Refer: [version.tf](./TF_graylog/core/version.tf)

## Steps

1. Provision local Graylog development with `make graylog-dev`
2. To obtain the access token of Graylog, browse `http://localhost:9000/system/users/tokens/local:admin`
3. On the Token Name field type `TF_TOKEN` (just an example) then click `Create Token`
4. Click `Copy to clipboard`, the token should available in clipboard 
5. Run `make tf-init`, this will run `terraform init default`
6. Run `make tf-plan`, it will prompt to input the tokens, if you are okay with the changes then run `make tf-apply`.
