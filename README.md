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