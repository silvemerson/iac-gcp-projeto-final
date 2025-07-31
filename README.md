# Infra as Code - Projeto Final GCP

Esse projeto vai contemplar um conjuto de recursos na GCP, que serão criados via Terraform. 

Teremos um balanceador de cargas que irá atender todas as requisições em um IP único. Essas requisições serão enviadas para um conjunto de máquinas nos Estados Unidos (em duas
zonas distintas), ou, para um região da Ásia (apenas uma zona), isso vai depender de onde o usuário estiver fazendo as requisições e com base nisso o usuário será direcionado para a região mais perto (Estados Unidos ou Ásia) da sua localização física. Em caso de uma região inteira acabar ficando offline, o tráfego será enviado automaticamente para outra região


Módulos necessários (Pode haver variações)

- firewall
- health-check
- instance
- instance-groups
- instance-templates
- load-balancer
- load-balancer-backend
- load-balancer-frontend
- load-balancer-target-http-proxy
- network
- router
- router-nat
- subnetwork
- tcp-health-check
