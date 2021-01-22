Alterações ao usar este modelo:

O campo "NOMEDOPROJETO" deve ser alterado nos arquivos:
variables.tf
dev.backend.tfvars
prod.backend.tfvars


Utilizar o terraform v12.13 ou superior

O backend-config só é necessário durante o parametro init do terraform

 - terraform init --backend-config=dev.backend.tfvars --var-file=dev.tfvars

Para os demais parametros do terraform, basta informar o arquivo de variaveis do ambiente:
 - terraform plan --var-file=dev.tfvars
 - terraform apply --var-file=dev.tfvars
