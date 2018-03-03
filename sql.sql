#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: question
#------------------------------------------------------------

CREATE TABLE question(
        id_question    int (11) Auto_increment  NOT NULL ,
        libelle        Varchar (100) ,
        score          Float ,
        code_categorie Varchar (25) ,
        id_niveau      Int ,
        id_theme       Int ,
        PRIMARY KEY (id_question )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: quizz
#------------------------------------------------------------

CREATE TABLE quizz(
        id_quizz          int (11) Auto_increment  NOT NULL ,
        titre             Varchar (25) ,
        niveau            Varchar (25) ,
        sujet             Varchar (25) ,
        nbr_page          Int ,
        date_quizz        Date ,
        nbr_question      Int ,
        nbr_quizzVariante Int ,
        id_auteur         Int ,
        PRIMARY KEY (id_quizz )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: reponse
#------------------------------------------------------------

CREATE TABLE reponse(
        code     int (11) Auto_increment  NOT NULL ,
        libelle  Varchar (100) ,
        estJuste Bool ,
        PRIMARY KEY (code )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: quizz_Variante
#------------------------------------------------------------

CREATE TABLE quizz_Variante(
        id_qv    int (11) Auto_increment  NOT NULL ,
        id_quizz Int ,
        PRIMARY KEY (id_qv )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: _niveau
#------------------------------------------------------------

CREATE TABLE _niveau(
        id_niveau  int (11) Auto_increment  NOT NULL ,
        nom_niveau Varchar (25) ,
        PRIMARY KEY (id_niveau )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: _categorie
#------------------------------------------------------------

CREATE TABLE _categorie(
        code_categorie Varchar (25) NOT NULL ,
        description    Varchar (25) ,
        PRIMARY KEY (code_categorie )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: _theme
#------------------------------------------------------------

CREATE TABLE _theme(
        id_theme int (11) Auto_increment  NOT NULL ,
        libelle  Varchar (25) ,
        PRIMARY KEY (id_theme )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: _auteur
#------------------------------------------------------------

CREATE TABLE _auteur(
        id_auteur  int (11) Auto_increment  NOT NULL ,
        nom        Varchar (10) ,
        prenom     Varchar (10) ,
        specialite Varchar (25) ,
        PRIMARY KEY (id_auteur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: question_var
#------------------------------------------------------------

CREATE TABLE question_var(
        id_quesVar  int (11) Auto_increment  NOT NULL ,
        pos_ques    Int ,
        id_qv       Int ,
        id_question Int ,
        PRIMARY KEY (id_quesVar )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: reponse_Varianate
#------------------------------------------------------------

CREATE TABLE reponse_Varianate(
        id_repVar  int (11) Auto_increment  NOT NULL ,
        pos_rep    Int ,
        id_quesVar Int ,
        code       Int ,
        PRIMARY KEY (id_repVar )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: avoir
#------------------------------------------------------------

CREATE TABLE avoir(
        nombre      Int ,
        id_question Int NOT NULL ,
        code        Int NOT NULL ,
        PRIMARY KEY (id_question ,code )
)ENGINE=InnoDB;

ALTER TABLE question ADD CONSTRAINT FK_question_code_categorie FOREIGN KEY (code_categorie) REFERENCES _categorie(code_categorie);
ALTER TABLE question ADD CONSTRAINT FK_question_id_niveau FOREIGN KEY (id_niveau) REFERENCES _niveau(id_niveau);
ALTER TABLE question ADD CONSTRAINT FK_question_id_theme FOREIGN KEY (id_theme) REFERENCES _theme(id_theme);
ALTER TABLE quizz ADD CONSTRAINT FK_quizz_id_auteur FOREIGN KEY (id_auteur) REFERENCES _auteur(id_auteur);
ALTER TABLE quizz_Variante ADD CONSTRAINT FK_quizz_Variante_id_quizz FOREIGN KEY (id_quizz) REFERENCES quizz(id_quizz);
ALTER TABLE question_var ADD CONSTRAINT FK_question_var_id_qv FOREIGN KEY (id_qv) REFERENCES quizz_Variante(id_qv);
ALTER TABLE question_var ADD CONSTRAINT FK_question_var_id_question FOREIGN KEY (id_question) REFERENCES question(id_question);
ALTER TABLE reponse_Varianate ADD CONSTRAINT FK_reponse_Varianate_id_quesVar FOREIGN KEY (id_quesVar) REFERENCES question_var(id_quesVar);
ALTER TABLE reponse_Varianate ADD CONSTRAINT FK_reponse_Varianate_code FOREIGN KEY (code) REFERENCES reponse(code);
ALTER TABLE avoir ADD CONSTRAINT FK_avoir_id_question FOREIGN KEY (id_question) REFERENCES question(id_question);
ALTER TABLE avoir ADD CONSTRAINT FK_avoir_code FOREIGN KEY (code) REFERENCES reponse(code);
