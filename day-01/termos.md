- server - Fazendo uma analogia ao k8s, ele seria o `master node`. O node responsavel por controlar o cluster.
  
- client - Fazendo outra analogia ao k8s, ele seria o `worker node`. E nesse node onde os containers, aplicacoes e VMs irão rodar.

- tasks - É a menor unidade dentro do cluster no Nomad. É alguma coisa que vai ser executada por algum driver.

- task groups - E um conjunto de `tasks` que precisam ser executadas juntas, no mesmo `client node`.

- driver - Quem vai executar as suas tasks. Por exemplo: Docker, Java, QEMU, etc.

- job - Fazendo outra analogia ao k8s, ele seria o `deployment`. E com o job que você define os detalhes do seu deploy. Ele é composto por um ou mais `task groups`.

- regions - Pode conter um ou mais datacenters, ela pode ser definida em cidades, paises, continentes

- datacenters - Agrupamento de instancias do Nomad dentro de uma região.

- allocation - É o mapeamento entre o Job, Task Group e Client Node.

- evaluation - É o mecanismo de escolha de qual Client Node determinado Allocation será alocado. Ele sempre estará de olho em dois estados `desired state` relacionado aos Jobs e o `actual state` que é relacionado ao Node Client

