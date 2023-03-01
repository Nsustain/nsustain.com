# What is this folder for?

This folder lists all changes to made the core Flarum framework
for specific needs of Nsustain.

***From `discussions` to `Requests`***<br>
```bash
cd /var/www/html/flarum/vendor/flarum/core/local

# Check if there's any conflict. If there's any conflict,
# then make the necessary changes.
diff backup_core.yml core.yml

# Apply the file.
mv backup_core.yml core.yml

# Refresh Flarum.
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
