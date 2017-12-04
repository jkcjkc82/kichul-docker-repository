@echo off
SET HOME=
FOR /F "tokens=*" %%i IN ('minikube docker-env') DO %%i
docker %*