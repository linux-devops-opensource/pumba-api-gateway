apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app.kubernetes.io/component: api-gateway
    app.kubernetes.io/name: pumba-api-gateway
    app.kubernetes.io/part-of: pumba
    app.kubernetes.io/managed-by: argocd
  name: pumba-api-gateway
spec:
  selector:
    matchLabels:
      app.kubernetes.io/name: pumba-api-gateway
  template:
    metadata:
      labels:
        app.kubernetes.io/name: pumba-api-gateway
    spec:
      containers:
      - name: pumba-api-gateway
        image: gcr.io/GOOGLE_CLOUD_PROJECT/pumba-api-gateway:COMMIT_SHA
        ports:
        - containerPort: 8080
        command: [ "/usr/bin/krakend" ]
        args: [ "run", "-d", "-c", "/etc/krakend/krakend.json", "-p", "8080" ]
        resources:
          requests:
              memory: "50Mi"
              cpu: "50m"
          limits:
              memory: "250Mi"
              cpu: "250m"
