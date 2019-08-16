ncpa-formula
================

A SaltStack formula that installs and configures the **Nagios Cross-Platform Agent** (NCPA).



Available states
================


``init``
------------


This state will install the ncpa package if not already


Configure the ncpa.cfg files to accept connections from the server, using the variables set in the defaults.yaml file.


Start the ncpa service, if not already and restart the service everytime changes are made to the configuration of the agent.

*This formula is developed using TDD approach.*

Inspec Tests
================

This project also consists of the associated integration test developed using Inspec which tests for:

if the `ncpa package` is installed on the machine

Check if the `ncpa.cfg` file of the ncpa agent is created with the right file permissions and has the required configurations that are set according  to the `defaults.yaml` file to connect to the server.

if the `ncpa.listener` service is running

if the `ncpa.passive` service is running


