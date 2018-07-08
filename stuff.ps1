az group create --name beardkubes --location westeurope

az aks create --resource-group beardkubes --name beardk8scluster 

az aks get-credentials --resource-group beardkubes --name beardk8scluster

kubectl get nodes

nano sqlserver.yml

apiVersion: apps/v1beta1
kind: Deployment
metadata:
  name: sqlserver
  labels:
    app: sqlserver
spec:
  replicas: 1
  template:
    metadata:
      labels:
        name: sqlserver
    spec:
      containers:
      - name: sqlserver1
        image: microsoft/mssql-server-linux:latest
        ports:
        - containerPort: 1433
        env:
        - name: SA_PASSWORD
          value: "Testing1122"
        - name: ACCEPT_EULA
          value: "Y"
---
apiVersion: v1
kind: Service
metadata:
  name: sqlserver-service
spec:
  ports:
  - name: sqlserver
    port: 1433
    targetPort: 1433
  selector:
    name: sqlserver
  type: LoadBalancer

  kubectl get pods

  kubectl get deployments

  kubectl create -f sqlserver.yml

  az group delete --name beardkubes
