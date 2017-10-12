# Scalable Web Aplication

## Structure:

            Loadbalancer(Haproxy)
                   |
      --------------------------------
      |          |        |          |
	 Backend  Backend    ...     Backend
	 server1  server2    ...     server n

## Features
- Strict https connection
- Self-signed SSL certification
- SSL termination at Load balancer
- Dynamic backend node registration
- Adjustable backend server allocation

## Development methodology
- Test-driven development(TDD) methodology. 
- Chef Rspec testing
- Chef kitchen test suit applied
- Used Chef aws driver
- Applied configuration templates

## How to use:

- Configure your aws credentials and aws profile
- Execute the following command:
`chef-client -z --listen devops_peoject_demo.rb` You will provisioned 3 instance on aws, one is a load balancer and the other two is backend webservers.

- To distroy all the servers on aws, execute `chef-client -z --listen distroy_all.rb`
- You can verify this demo by hitting the HaProxy machine's public address. For now the public ip address is http://18.216.27.219. When you visiting the webpage you will be redirect to a https port. Your brwoser will prompt the warning regarding the self signed certificate. Just ignore it and choose trust the certificate. If you want to see the effect of loadbalancer, just inspect the source code of the page you will see the greeting massages from different backend server. :beer:

> For more details please contact YangKai yangiak91@gmail.com