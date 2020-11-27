gcloud compute instances create reddit-app \
--image-family reddit-full \
--zone=europe-west1-b \
--tags puma-server \
--machine-type=e2-micro \
--restart-on-failure
