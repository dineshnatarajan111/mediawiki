# HELM CHART for MEDIAWIKI
This repo is used to create mediawiki resource in kubernetes using HELM chart

### Prerequisite
1. Create a Kubernetes instance. In my case I am using AKS.
2. Install kubectl
   ```bash
   brew install kubectl
   ```
3. Install HELM Client in local
   ```bash
   brew install helm
   ```

### Creation of Kuberenetes resources
1. To create application in kubernetes, Clone this repository and execute
    ```bash
    helm install <chartname> -f ./mediawiki/application/values.yaml ./mediawiki/application
    ```
2. To create database resource in kubernetes execute
   ```bash
   helm install <chartname> -f ./mediawiki/database/values.yaml ./mediawiki/database
   ```
3. To create a Database in the running sql pod, get the pod name by running
   ```bash
   kubectl get pods -n <namespace>
   ```
   
   shell inside the pod running SQL server
   ```bash
   kubectl exec -it <mysql-pod-name> -- /bin/bash
   ```

   login to the server using
   ```bash
   mysql -u root -p
   ```

   Enter the root password which is used in values.yaml in database chart when prompted.

   To create database:
   ```bash
   CREATE DATABASE <database_name>;
   ```
   To verify the database has been created:
   ```bash
   SHOW DATABASES;
   ```
4. Get the External-IP of the mediawiki-service and Cluster-IP for the sql DATABASE
   ```bash
   kubectl get service -n <namespace>
   ```
5. Browse the Ip address to work on the application
6.  Get the name of the pod using
   ```bash
   kubectl get pods -n <namespace>
   ```
7.  Through the UI create LocalSettings.php
8.  For Database related fields use the floowing
    
    | Field | Value |
    |:-------------:|:-------------:|
    | Database host | Service-IP of sql-database |
    | Database name | DatabaseName which is create in the above steps |
    | Database username | default to root |
    | Database password | Password which is provided in the values.yaml of database chart |
9.  Upload the local settings.php to the path /var/www/html/ in running application pod
   ```bash
   kubectl cp /path/to/file/LocalSettings.php <podname>:/var/www/html
   ```
