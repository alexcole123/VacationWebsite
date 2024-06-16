#Install Linux OS(debian) + mysql specific version ( good as wont break in future)
FROM mysql:8


#Copy shelter.sql into docker special folder named /docker-entrypoint-initdb.d which install 
COPY ./vacations.sql /docker-entrypoint-initdb.d