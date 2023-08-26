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
```

```bash
# ---------------------------------------------------------------------
# If you're using Docker Compose
# ---------------------------------------------------------------------
cd nsustain.com/src/resources/mini-changes
docker cp ./backup_core.yml flarum:/var/www/html/flarum/vendor/flarum/core/locale/backup_core.yml
docker cp ./backup_en.yml flarum:/var/www/html/flarum/vendor/fof/nightmode/resources/locale/backup_en.yml

cd ../../docker
docker compose exec -it flarum sh
cd vendor/flarum/core/locale

# ---------------------------------------------------------------------
# Now, for both K8s and Docker Compose
# ---------------------------------------------------------------------
# Check if there's any conflict. If there's any conflict,
# then make the necessary changes.
diff backup_core.yml core.yml

# Apply the file.
mv backup_core.yml core.yml

# ---------------------------------------------------------------------
# Remove misaligned nightmode button for mobile
# ---------------------------------------------------------------------
cd /var/www/html/flarum/vendor/fof/nightmode/resources/locale

# Check if there's any conflict. If there's any conflict,
# then make the necessary changes.
diff backup_en.yml en.yml

# Apply the file.
mv backup_en.yml en.yml

# Refresh Flarum.
cd /var/www/html/flarum
php flarum assets:publish
php flraum cache:clear
```