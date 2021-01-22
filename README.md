# Repositório - tfstates do terraform no S3

Objetivo: centralizar no S3 os tfstates criados nos projetos do terraform. E uar o DynamoDB para evitar alteração simultanea do mesmo state.


Este projeto apenas cria dois buckets para armazenamento dos tfstates dos demais projetos feitos com terraform.

No diretório exemplo, você encontra um exemplo de projeto do terraform que utiliza o armazenamento de tfstate nos buckets já criados.

Utilizar o terraform v12.29 ou superior

O backend-config só é necessário durante o parametro init do terraform

 - terraform init --backend-config=dev.backend.tfvars --var-file=dev.tfvars

Para os demais parametros do terraform, basta informar o arquivo de variaveis do ambiente:
 - terraform plan --var-file=dev.tfvars
 - terraform apply --var-file=dev.tfvars

OU utilizar o workspace, terragrunt, ou outro... fiz o mais simples possível para ser alterado facilmente.


## Projeto de Exemplo - terraform12

No diretório "simple" há dois exemplos de projetos para seguir.

### exemplo1
O mesmo arquivo de criação dos resources, mantendo em separado apenas os arquivos
de variaveis e backend para os ambientes DEV e PROD.

PROS= garantia da mesma infra em diferentes ambientes/contas, mudando apenas as variaveis.

CONTRA= execução do terraform deve ser passado as flags/valores para os arquivos de variaveis e backend.


### exemplo2
Um diretório para cada ambiente, separados.

PROS= facil e rapido.

CONTRA= cada alteração deve ser feita duas vezes (uma para DEV e outra para PROD).


## Como usar

Além dos exemplos acima, em maiores ambientes o correto é o uso do recurso 'workspace' dentro do terraform.

Outras roles ou IAM devem ter apenas permissão de escrita dentro do subdiretório do projeto no bucket: ex.: s3://bucket/tfstate/PROJETO/arquivo.tfstate