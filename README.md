ProjetTD
========

Laboratoire de techniques de transmissions de données

Ressources :

    Participant :

        · Wery Michael

        · Dessandé Alexandre

        · Pécriaux Thomas

        · Detournay Jérôme

    Matériel :

        · Un ordinateur

        · Une carte créé au cours
        
                    i. USART (Simulation USB)

                    ii. Ethernet ( A voir si possible)
            
        · Module RFID


    Scénario :

    Dans une salle serveur, un pc sera utilisé pour l'administration des ressources mis à disposition (serveur, routeur ect). Pour ce connecter à ce pc il faudra s'authentifier via une carte RFID qui contiendra les informations de loggin/mdp ainsi que le niveau de l'utilisateur (Admin Réseau, Admin Sécurité, Stagiaire, ect).

    La carte disposant d'un capteur de luminosité et de température enverra les données via l'Ethernet (ou l'usart si problème avec l'Ethernet), toute ces données seront stockées dans une base de donnée et seront mis à disposition sur une page web. Il sera donc possible de voir partout si il n'y a pas un problème avec la climatisation ou encore si les lampes sont bien éteinte.

    Un programme en C# sera crée pour gérer les données de t° et lux. Les utilisateurs dit "normaux" n'auront accès qu'au action de bases (exemples : maj des données, nettoyage de la bdd, récupération des données à une date précise, ect).

    L'administrateur lui aura droit à une option supplémentaire qui sera de créer ou supprimer des carte RFID.
