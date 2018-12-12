docker pull dpage/pgadmin4
docker run -p 80:80 \
	-e "PGADMIN_DEFAULT_EMAIL=admin@admin.com" \
	-e "PGADMIN_DEFAULT_PASSWORD=password" \
	-d dpage/pgadmin4
