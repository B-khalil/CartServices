#!/bin/bash

# Nom de votre déploiement et service
DEPLOYMENT_NAME="cart-dep"
SERVICE_NAME="cart-service"
BDD_NAME="MONGO"

DEPLOYMENT_BDD_YAML="k8s/cart/cart-db.yaml"
SERVICE_BDD_YAML="k8s/cart/cart-db-service.yaml"


# Fichier YAML pour la définition du déploiement
DEPLOYMENT_YAML="k8s/cart/cart-dep.yaml"

# Fichier YAML pour la définition du service
SERVICE_YAML="k8s/cart/cart-service.yaml"

# Namespace (facultatif, modifiez si nécessaire)
NAMESPACE="default"

# Appliquer le déploiement
kubectl apply -f "$DEPLOYMENT_YAML" --namespace="$NAMESPACE"

# Attendre que le déploiement soit prêt (vous pouvez ajuster cela en fonction de votre application)
# kubectl wait --for=condition=available deployment/"$DEPLOYMENT_NAME" --timeout=10s --namespace="$NAMESPACE"

# Appliquer le service
kubectl apply -f "$SERVICE_YAML" --namespace="$NAMESPACE"

# Afficher les informations sur le service
kubectl get service "$SERVICE_NAME" --namespace="$NAMESPACE"

kubectl apply -f "$DEPLOYMENT_BDD_YAML" --namespace="$NAMESPACE"

kubectl apply -f "$SERVICE_BDD_YAML" --namespace="$NAMESPACE"

echo "Déploiement terminé."

