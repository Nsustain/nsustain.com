# What is this folder for?

This folder lists all changes to made the core Flarum framework
for specific needs of Nsustain.

***From `discussions` to `Requests`***<br>
```bash
# ---------------------------------------------------------------------
# If you're using K8s
# ---------------------------------------------------------------------
# Check the name of the pod and then copy
# the file into the container.
kubectl get pods
kubectl cp ./backup_core.yml <Pod Name>:/var/www/html/flarum/vendor/flarum/core/locale/backup_core.yml
kubectl exec -it <Pod Name> -- sh
cd vendor/flarum/core/locale

# ---------------------------------------------------------------------
# If you're using Docker Compose
# ---------------------------------------------------------------------
docker ps
docker compose cp <Container Name>:/var/www/html/flarum/vendor/flarum/core/locale/backup_core.yml
docker compose exec -it <Container Name> sh
cd vendor/flarum/core/locale

# ---------------------------------------------------------------------
# Now, for both K8s and Docker Compose
# ---------------------------------------------------------------------
# Check if there's any conflict. If there's any conflict,
# then make the necessary changes.
diff backup_core.yml core.yml

# Apply the file.
mv backup_core.yml core.yml

# Refresh Flarum.
cd -
php flarum assets:publish
php flraum cache:clear
```

***Remove misaligned nightmode button for mobile***<br>
```bash
cd /var/www/html/flarum/vendor/fof/nightmode/resources/locale

# Check if there's any conflict. If there's any conflict,
# then make the necessary changes.
diff backup_en.yml en.yml

# Apply the file.
mv backup_en.yml en.yml
```
