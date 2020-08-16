# Internet_and_applications

## Θέμα εργασίας στο μάθημα Διαδίκτυο και Εφαρμογές :
### COVID-01 με συνδυασμό COVID-02: Εύρεση των Συγγραφέων με τα περισσότερα Άρθρα που αφορούν δύο φαρμακευτικές ουσίες (αντί για ασθένεια) ###updated

###### Ζητείται μια διαδικτυακή εφαρμογή που εντοπίζει τους πέντε συγγραφείς με τα περισσότερα άρθρα που αφορούν δύο διαφορετικές φαρμακευτικές ουσίες. Το input θα είναι τα ονόματα των φαρμάκων, πχ DrugA και DrugB, και το output θα είναι οι 5 συγγραφείς με τα περισσότερα άρθρα και ποια είναι αυτά. Επίσης για καθέναν από του πέντε αυτούς συγγραφείς, θα παρουσιάσω σε Ιστόγραμμα την χρονική περίοδο στην οποία έχουν γίνει οι δημοσιεύσεις τους καθώς και τον αριθμό των άρθρων αυτών που δημοσιεύτηκαν κάθε χρόνο(που αφορούν τα 2 παραπάνω φάρμακα). 
###### Θα χρησιμοποιήσω μια βάση για την αποθήκευση των δεδομένων άρθρων https://www.semanticscholar.org/cord19 . Για την αναζήτηση του input θα επεξεργαστώ τα δεδομένα που υπάρχουν στο abstract(πεδίο του metadata.csv) . θα γίνει λοιπόν χρήση mysql για τη βάση και επεξεργασία-παρουσίαση με java/javascript σε Eclipse IDE.

### Τεχνολογίες που χρησιμοποιήθηκαν :
###### Βάση Δεδομένων -> MySQL (MariaDB) του XAMPP
###### Backend -> Java Servlets μέσα στις JSP(Java Server Pages)
###### Frontend -> HTML,CSS, JSP και Javascript

### Οδηγίες Εγκατάστασης :
###### - Εγκαθιστούμε το XAMPP (link on how to)-> https://www.youtube.com/watch?v=-f8N4FEQWyY.
###### - Ανοίγουμε το XAMPP control panel και εκεί που λέει Actions πατάμε το Start στα Modules: Apache και MySQL
###### - Κάνουμε click στο shell button του XAMPP control panel και συνδεόμαστε στη MySQL γράφοντας στο παράθυρο shell που άνοιξε: mysql -u root και παταμε enter
###### - Δημιουργούμε τη βάση δεδομένων γράφοντας «CREATE DATABASE internet_app; » και πατάμε enter
###### - Κάνουμε copy όλο το περιεχόμενο του αρχείου make_table_query.txt που βρίσκεται στο github και paste στο shell και δημιουργούμε το βασικό table της βάσης
###### - Κάνουμε copy όλο το περιεχόμενο του αρχείου load_data_query.txt και paste στο shell και φορτώνουμε τα δεδομένα στο table της βάσης. (Προσοχή πρέπει πρώτα να αλλάξουμε το path στην εντολή του αρχείου load_data_query.txt: LOAD DATA INFILE 'path\to\metadata.csv' στον κατάλογο που έχουμε κατεβάσει το metada.csv file του CORD19 dataset. Για παράδειγμα εμένα βρίσκεται στον κατάλογο 'D:\CORD19_DATASET\metadata.csv'
###### - Κάνουμε import το project Cord19 project ως εξής: Κατεβάζουμε τον φάκελο του project από το github, ανοίγουμε το Eclipse και πατώντας File->Open Projects from File System επιλέγουμε το φάκελο που κατεβάσαμε και πατάμε Finish. Κάνουμε δεξί κλικ στο Project και επιλέγουμε Properties->Project Facets->Runtimes και εκεί επιλέγουμε τη σωστή έκδοση του Tomcat που έχουμε εγκατεστημένο από το XAMPP ή όποια άλλη έχουμε και έπειτα πατάμε “Apply and Close”. 

### Οδηγίες Εκτέλεσης :
###### - Ώντας στο eclipse κάνουμε right-click στο imported project->settings->Java Build Path και 1) πατάμε add external jar και προσθέτουμε το mysql-connector-java-5.1.46-bin.jar στα Libraries. (Πρέπει να το κατεβάσουμε αν δεν το έχουμε) 2) ενημερώνουμε τις βιβλιοθήκες του Tomcat και του JRE στα version που είναι εγκατεστημένα στον υπολογιστή. Σε εμένα ήταν τα version Apache Tomcat v7.0 και JRE System Library [jdk1.8.0_191]
###### - Κάνουμε right-click στο project του eclipse και πατάμε Run As-> Run on Server . Αν θέλουμε το run να γίνει σε άλλον browser εκτός του default του eclipse ώντας στο eclipse IDE πατάμε την επιλογή Window-> Web Browser->πχ. Firefox

### Περιγραφή Λειτουργίας της εφαρμογής:
###### Η πρώτη σελίδα που βλέπει ο χρήστης είναι η index.jsp, που θα τρέξει όταν γίνει run το project. Σε αυτή τη σελίδα μέσω ενός searchbar γράφει τα δύο φάρμακα από τα οποία επιθυμεί να βρει σχετικά άρθρα. Η δεύτερη σελίδα search_page.jsp  επικοινωνεί με τη βάση, παρουσιάζει τις πληροφορίες που συλλέχθηκαν  για τα δοθέντα φάρμακα και βρίσκει τους 5 ζητούμενους συγγραφείς τους οποίους παρουσιάζει στην Τρίτη σελίδα authors_page.jsp μαζί με το ζητούμενο ιστόγραμμα

### Youtube Video playlist για περαιτέρω ανάλυση:
###### https://www.youtube.com/watch?v=YBWrKbR3yyU&list=PLFPmbXtIlq0gO_3yvOu6f8Bp0RXHxYYh_
###### Είναι μια playlist από 3 βίντεο, αν δεν ανοίξει ως playlist μεταβείτε στο profile https://www.youtube.com/user/inccoruptible13/playlists ή προσθέστε μία κάτω μπάρα _ στο παραπάνω link

### Author
###### Evangelos Papagiannopoulos

