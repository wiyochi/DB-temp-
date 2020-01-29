LOAD DATA INFILE *
INTO TABLE auteurs
fields terminated by ","
(num,nom,prenom nullif prenom="null",pays nullif pays="null",tel nullif tel="null")
BEGINDATA
1,Dupont,Jacques,FR,0473151585
2,Durand,Marie,GB,null
3,Dupont,Pierre,null,null
3,Dupont,null,null,null

