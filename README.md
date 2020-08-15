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
###### - Κάνουμε import το project Cord19