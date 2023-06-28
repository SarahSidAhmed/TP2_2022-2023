{TP2____2022-2023}
{Binome:     SIDAHMED SARAH  - MENDJEL CHAHRAZED}
{GROUPE: 08    -  SECTION: C}
{ENCADREUR: MR D.E.ZEGOUR  }
   SOIENT
       A1 , A2 , A3 DES ARB DE ENTIERS ;
       P , Q DES POINTEURS VERS UN ARB ;
       Stack UNE PILE DE ARB DE ENTIERS ;
       Displayarb , Genarb : ACTION ;
       Insert , Rechval : FONCTION ( BOOLEEN ) ;
       Suiv_post , Suiv_in , Suivantpre DES FONCTION ( ARB ) ;
       Rechvaldouble , Insertdouble DES ACTIONS ;
       Prepre , Postpost , Prepost , Inpre , Inpost DES ACTIONS ;
       Father UNE FONCTION ( ARB ) ;
       Erro UNE ACTION ;
       Inordre : FONCTION ( BOOLEEN ) ;
       Nbrn : FONCTION ( ENTIER ) ;
       N , M , V UN ENTIER ;
       I , K UN ENTIER ;
       Verify : FONCTION ( BOOLEEN ) ;
       Verify_min : FONCTION ( BOOLEEN ) ;
       T UN TABLEAU ( 50 ) DE ENTIER ;
       Halfverify_min UNE FONCTION ( BOOLEEN ) ;
       Otherhalfverify_min UNE FONCTION ( BOOLEEN ) ;
      
   DEBUT
       N := 20 ;
      {Varible du nombre de noeud}
       M := 10 ;
      {Varible de nombre d'occuration}
       ECRIRE('-------------------------------------');
       ECRIRE ( '__A1 et A2 sont deux arbres généré aléatoirement.' ) ;
       ECRIRE ( '__Un tableau t est généré pour garder l ordre de creation de chaque noeud' ) ;
       ECRIRE ( '__Ce qui sert pour le module de vérification' ) ;
       POUR I:=1, M:
       ECRIRE('-------------------------------------');
           ECRIRE ( 'OCCURENCE' , I) ;
            ECRIRE('-------------------------------------');
           A1 := NIL ;
           A2 := NIL ;
           A3 := NIL ;
           APPEL Genarb ( A1 , N ) ;
           APPEL Genarb ( A2 , N ) ;
           POUR K := 1 , 5 :
               SI K = 1 :
                   ECRIRE ( 'PARCOUR INORDRE_PREORDRE' ) ;
                   APPEL Inpre ( A1 , A2 , A3 , T ) ;
                  
               FSI ;
               SI K = 2 :
                   ECRIRE ( 'PARCOUR INORDRE_POSTORDRE' ) ;
                   APPEL Inpost ( A1 , A2 , A3 , T ) ;
                  
               FSI ;
               SI K = 3 :
                   ECRIRE ( 'PARCOUR PREORDRE_PREORDRE' ) ;
                   APPEL Prepre ( A1 , A2 , A3 , T ) ;
                  
               FSI ;
               SI K = 4 :
                   ECRIRE ( 'PARCOUR POSTORDRE_POSTORDRE' ) ;
                   APPEL Postpost ( A1 , A2 , A3 , T ) ;
                  
               FSI ;
               SI K = 5 :
                   ECRIRE ( 'PARCOUR PREORDRE_POSTORDRE' ) ;
                   APPEL Prepost ( A1 , A2 , A3 , T ) ;
                  
               FSI ;
               SI ( Verify ( A1 , A2 , A3 , T , K ) = VRAI ) :
                   ECRIRE ( 'PASS' ) ;
                  
               SINON
                   ECRIRE ( 'ERROR' ) ;
                  
               FSI ;
              
           FPOUR ;
       FPOUR ;
      
   FIN
  {---------MODULE GENERATION D'UN ARBRE DE ENTIER ALEATOIRE----------}
   ACTION Genarb ( A , N )
   SOIENT
       A UN ARB DE ENTIER ;
       N , Cpt , Num DES ENTIERS ;
       Found UN BOOLEEN ;
      
   DEBUT
       Found := FAUX ;
       Cpt := 1 ;
       TQ Cpt <= N :
           Num := ALEANOMBRE ( N ) ;
           SI Cpt = 1 :
               CREERNOEUD ( A ) ;
               AFF_INFO ( A , Num ) ;
              
           SINON
               Found := Insert ( A , Num ) ;
              
           FSI ;
           SI ( Found = FAUX ) :
               Cpt := Cpt + 1 ;
              
           FSI ;
          
       FTQ ;
      
   FIN
  {----------------------------------------------------------}
  {----------------------------------------------------------}
  {----------MODULE D'AFFICHAGE D'UN ARBRE-------------------}
   ACTION Displayarb ( A )
   SOIT
       A UN ARB DE ENTIER ;
      
   DEBUT
       SI A <> NIL :
           ECRIRE ( INFO ( A ) ) ;
           APPEL Displayarb ( FG ( A ) ) ;
           APPEL Displayarb ( FD ( A ) ) ;
          
       FSI
   FIN
  {----------------------------------------------------------}
  {--------MODULE D'INSERTION - DOUBLE NON ACCEPTE-----------}
   FONCTION Insert ( A , V ) : BOOLEEN
   SOIENT
       A UN ARB DE ENTIER ;
       V UN ENTIER ;
       P , Q DES POINTEURS VERS UN ARB ;
       Found UN BOOLEEN ;
      
   DEBUT
       Found := Rechval ( A , V , P , Q ) ;
       SI P = NIL :
           CREERNOEUD ( P ) ;
           AFF_INFO ( P , V ) ;
           SI INFO ( Q ) > V :
               AFF_FG ( Q , P ) ;
              
           SINON
               AFF_FD ( Q , P ) ;
              
           FSI ;
          
       FSI ;
       Insert := Found ;
      
   FIN
  {----------------------------------------------------------}
  {-----------MODULE DE RECHERCHE DANS UN ARBRE- DOUBLE NON ACCEPTE---}
   FONCTION Rechval ( A , V , P , Q ) : BOOLEEN
   SOIENT
       A UN ARB DE ENTIER ;
       V UN ENTIER ;
       P , Q DES POINTEURS VERS UN ARB ;
       Found UN BOOLEEN ;
      
   DEBUT
       Found := FAUX ;
       P := A ;
       TQ ( ( P <> NIL ) ET ( Found = FAUX ) )
           SI INFO ( P ) = V :
               Found := VRAI ;
              
           SINON
               SI INFO ( P ) > V :
                   Q := P ;
                   P := FG ( P ) ;
                  
               SINON
                   Q := P ;
                   P := FD ( P ) ;
                  
               FSI ;
              
           FSI ;
          
       FTQ ;
       Rechval := Found ;
      
   FIN
  {----------------------------------------------------------}
  {--------MODULE DE RECHERCHE DANS UN ARBRE- DOUBLE INCLU---}
   ACTION Rechvaldouble ( A , V , P , Q )
   SOIENT
       A UN ARB DE ENTIER ;
       V UN ENTIER ;
       P , Q DES POINTEURS VERS UN ARB ;
      
   DEBUT
       Q := NIL ;
       P := A ;
       TQ ( ( P <> NIL ) )
           SI INFO ( P ) >= V :
               Q := P ;
               P := FG ( P ) ;
              
           SINON
               Q := P ;
               P := FD ( P ) ;
              
           FSI ;
          
       FTQ ;
      
   FIN
  {---------------------------------------------------------}
  {-------MODULE D'INSERTION DANS UN ARB - DOUBLE INCLU-----}
   ACTION Insertdouble ( A , V , T , I )
   SOIENT
       A UN ARB DE ENTIERS ;
       V UN ENTIER ;
       P , Q DES POINTEURS VERS UN ARB DE ENTIER ;
       T UN TABLEAU ( 50 ) DE ENTIER ;
       I UN ENTIER ;
      
   DEBUT
       APPEL Rechvaldouble ( A , V , P , Q ) ;
       CREERNOEUD ( P ) ;
       AFF_INFO ( P , V ) ;
       SI Q = NIL :
           A3 := P ;
          
       SINON
           SI INFO ( Q ) >= V :
               AFF_FG ( Q , P ) ;
              
           SINON
               AFF_FD ( Q , P ) ;
              
           FSI ;
          
       FSI ;
       AFF_ELEMENT ( T [ I ] , V ) ;
      
   FIN
  {---------------------------------------------------------}
  {---------------------------------------------------------}
  {---------------------------------------------------------}
  {---------MODULE DE RECHERCHE DU SUIVANT INORDRE----------}
  {---------Traité en td------------------------------------}
   FONCTION Suiv_in ( X , A ) : ARB
   SOIENT
       X , Q , P , A DES ARB ;
       Find UN BOOLEEN ;
      
   DEBUT
       P := X ;
       SI ( FD ( P ) <> NIL ) :
           Q := FD ( P ) ;
           TQ ( FG ( Q ) <> NIL ) :
               Q := FG ( Q ) ;
              
           FTQ ;
          
       SINON
           P := X ;
           Q := Father ( P , A ) ;
           Find := FAUX ;
           TQ ( ( Find = FAUX ) ET ( Q <> NIL ) ) :
               SI ( P = FG ( Q ) ) :
                   Find := VRAI ;
                  
               SINON
                   P := Q ;
                   Q := Father ( Q , A ) ;
                  
               FSI ;
              
           FTQ ;
          
       FSI ;
       Suiv_in := Q ;
      
   FIN
  {------MODULE DE RECHERCHE DU SUIVANT PREORDRE------------}
   FONCTION Suivantpre ( Q , A ) : ARB
   SOIENT
       G , D , R , Q , Pre , A DES ARB DE ENTIERS ;
       Trouv UN BOOLEEN ;
      
   DEBUT
       SI FG ( Q ) <> NIL :
           R := FG ( Q ) ;
          
       SINON
           SI ( FD ( Q ) <> NIL ) :
               R := FD ( Q ) ;
              
           SINON
               Pre := Q ;
               R := Father ( Q , A ) ;
               G := FG ( R ) ;
               D := FD ( R ) ;
               TQ ( ( ( G <> Pre ) OU ( D = NIL ) ) ET ( R <> NIL ) ) :
                   Pre := R ;
                   R := Father ( R , A ) ;
                   SI ( R = NIL ) :
                       G := NIL ;
                       D := NIL ;
                      
                   SINON
                       G := FG ( R ) ;
                       D := FD ( R ) ;
                      
                   FSI ;
                  
               FTQ ;
               SI ( R <> NIL ) :
                   R := FD ( R ) ;
                  
               FSI ;
              
           FSI ;
          
       FSI ;
       Suivantpre := R ;
      
   FIN
  {---------------------------------------------------------}
  {----------MODULE DE PARCOUR PRE PRE----------------------}
   ACTION Prepre ( A1 , A2 , A3 , T )
   SOIENT
       A1 , A2 , A3 DES ARB DE ENTIERS ;
       P , Q , R DES POINTEURS VERS UN ARB DE ENTIER ;
       T UN TABLEAU ( 50 ) DE ENTIER ;
       I UN ENTIER ;
      
   DEBUT
       P := A1 ;
       Q := A2 ;
       I := 1 ;
       SI ( INFO ( Q ) < INFO ( P ) ) :
           CREERNOEUD ( R ) ;
           AFF_INFO ( R , INFO ( Q ) ) ;
           AFF_ELEMENT ( T [ I ] , INFO ( Q ) ) ;
           A3 := R ;
           Q := Suivantpre ( Q , A2 ) ;
          
       SINON
           CREERNOEUD ( R ) ;
           AFF_INFO ( R , INFO ( P ) ) ;
           AFF_ELEMENT ( T [ I ] , INFO ( P ) ) ;
           A3 := R ;
           P := Suivantpre ( P , A1 ) ;
          
       FSI ;
       I := 2 ;
       TQ ( ( P <> NIL ) ET ( Q <> NIL ) ) :
           SI ( INFO ( Q ) < INFO ( P ) ) :
               APPEL Insertdouble ( A3 , INFO ( Q ) , T , I ) ;
               Q := Suivantpre ( Q , A2 ) ;
              
           SINON
               APPEL Insertdouble ( A3 , INFO ( P ) , T , I ) ;
               P := Suivantpre ( P , A1 ) ;
              
           FSI ;
           I := I + 1 ;
          
       FTQ ;
       TQ ( P <> NIL ) :
           APPEL Insertdouble ( A3 , INFO ( P ) , T , I ) ;
           P := Suivantpre ( P , A1 ) ;
           I := I + 1 ;
          
       FTQ ;
       TQ ( Q <> NIL ) :
           APPEL Insertdouble ( A3 , INFO ( Q ) , T , I ) ;
           Q := Suivantpre ( Q , A2 ) ;
           I := I + 1 ;
          
       FTQ ;
      
   FIN
  {---------------------------------------------------------}
  {-----MODULE DE PARCOUR POST POST--------------------------}
   ACTION Postpost ( A1 , A2 , A3 , T )
   SOIENT
       A1 , A2 , A3 DES ARB DE ENTIERS ;
       R , P , Q DES POINTEURS VERS UN ARB DE ENTIER ;
       T UN TABLEAU ( 50 ) DE ENTIER ;
       I UN ENTIER ;
      
   DEBUT
       P := A1 ;
       Q := A2 ;
      {INITIALISER LES POINTEURS A LA BONNE PLACE}
       R := NIL ;
       TQ ( P <> NIL ) :
           TQ ( FG ( P ) <> NIL ) :
               P := FG ( P ) ;
              
           FTQ ;
           R := P ;
           P := FD ( P ) ;
          
       FTQ ;
       P := R ;
       R := NIL ;
       TQ ( Q <> NIL ) :
           TQ ( FG ( Q ) <> NIL ) :
               Q := FG ( Q ) ;
              
           FTQ ;
           R := Q ;
           Q := FD ( Q ) ;
          
       FTQ ;
       Q := R ;
       SI INFO ( Q ) < INFO ( P ) :
           CREERNOEUD ( R ) ;
           AFF_INFO ( R , INFO ( Q ) ) ;
           AFF_ELEMENT ( T [ 1 ] , INFO ( Q ) ) ;
           A3 := R ;
           Q := Suiv_post ( Q , A2 ) ;
          
       SINON
           CREERNOEUD ( R ) ;
           AFF_INFO ( R , INFO ( P ) ) ;
           AFF_ELEMENT ( T [ 1 ] , INFO ( P ) ) ;
           A3 := R ;
           P := Suiv_post ( P , A1 ) ;
          
       FSI ;
       I := 2 ;
       TQ ( ( P <> NIL ) ET ( Q <> NIL ) ) :
           SI ( INFO ( Q ) < INFO ( P ) ) :
               APPEL Insertdouble ( A3 , INFO ( Q ) , T , I ) ;
               Q := Suiv_post ( Q , A2 ) ;
              
           SINON
               APPEL Insertdouble ( A3 , INFO ( P ) , T , I ) ;
               P := Suiv_post ( P , A1 ) ;
              
           FSI ;
           I := I + 1 ;
          
       FTQ ;
       TQ ( P <> NIL ) :
           APPEL Insertdouble ( A3 , INFO ( P ) , T , I ) ;
           P := Suiv_post ( P , A1 ) ;
           I := I + 1 ;
          
       FTQ ;
       TQ ( Q <> NIL ) :
           APPEL Insertdouble ( A3 , INFO ( Q ) , T , I ) ;
           Q := Suiv_post ( Q , A2 ) ;
           I := I + 1 ;
          
       FTQ ;
      
   FIN
  {----------FONCTION QUI RETOURNE LE PERE DU NOEUD------}
   FONCTION Father ( X , A ) : ARB
   SOIENT
       X , P , A DES ARB ;
      
   DEBUT
       P := A ;
       Q := NIL ;
       TQ ( P <> X ) :
           Q := P ;
           SI ( INFO ( X ) < INFO ( P ) ) :
               P := FG ( P ) ;
              
           SINON
               P := FD ( P ) ;
              
           FSI ;
          
       FTQ ;
       Father := Q ;
      
   FIN
  {-------MODULE DE RECHERCHE DU SUIVANT POSTORDRE---------}
   FONCTION Suiv_post ( X , A ) : ARB
   SOIENT
       X , P , R , Q , A DES ARB ;
      
   DEBUT
       P := A ;
       Q := NIL ;
       TQ ( P <> X ) :
           Q := P ;
           SI ( INFO ( X ) <= INFO ( P ) ) :
               P := FG ( P ) ;
              
           SINON
               P := FD ( P ) ;
              
           FSI ;
          
       FTQ ;
       SI ( Q = NIL ) :
           Suiv_post := Q ;
          
       SINON
           SI ( ( FD ( Q ) = X ) OU ( FD ( Q ) = NIL ) ) :
               Suiv_post := Q ;
              
           SINON
               P := FD ( Q ) ;
               TQ ( P <> NIL ) :
                   TQ ( FG ( P ) <> NIL ) :
                       P := FG ( P ) ;
                      
                   FTQ ;
                   R := P ;
                   P := FD ( P ) ;
                  
               FTQ ;
               Suiv_post := R ;
              
           FSI ;
          
       FSI ;
      
   FIN
  {================module pour tester le suivin=========================}
   ACTION Erro ( A )
   SOIENT
       A , P DES ARB DE ENTIER ;
      
   DEBUT
       P := A ;
       TQ ( Suivantpre ( P , A ) <> NIL ) :
           ECRIRE ( INFO ( P ) ) ;
           P := Suivantpre ( P , A ) ;
          
       FTQ ;
       ECRIRE ( INFO ( P ) ) ;
      
   FIN
  {---------------------------------------------------------}
  {-----MODULE DE PARCOUR PRE POST--------------------------}
   ACTION Prepost ( A1 , A2 , A3 , T )
   SOIENT
       A1 , A2 , A3 DES ARB DE ENTIERS ;
       R , P , Q DES ARB DE ENTIER ;
       T UN TABLEAU ( 50 ) DE ENTIER ;
       I UN ENTIER ;
      
   DEBUT
       P := A1 ;
       Q := A2 ;
       R := NIL ;
       TQ ( Q <> NIL ) :
           TQ ( FG ( Q ) <> NIL ) :
               Q := FG ( Q ) ;
              
           FTQ ;
           R := Q ;
           Q := FD ( Q ) ;
          
       FTQ ;
       Q := R ;
       R := NIL ;
       SI ( INFO ( Q ) < INFO ( P ) ) :
           CREERNOEUD ( R ) ;
           AFF_INFO ( R , INFO ( Q ) ) ;
           AFF_ELEMENT ( T [ 1 ] , INFO ( Q ) ) ;
           A3 := R ;
           Q := Suiv_post ( Q , A2 ) ;
          
       SINON
           CREERNOEUD ( R ) ;
           AFF_INFO ( R , INFO ( P ) ) ;
           AFF_ELEMENT ( T [ 1 ] , INFO ( P ) ) ;
           A3 := R ;
           P := Suivantpre ( P , A1 ) ;
          
       FSI ;
       I := 2 ;
       TQ ( ( P <> NIL ) ET ( Q <> NIL ) ) :
           SI ( INFO ( Q ) < INFO ( P ) ) :
               APPEL Insertdouble ( A3 , INFO ( Q ) , T , I ) ;
               Q := Suiv_post ( Q , A2 ) ;
              
           SINON
               APPEL Insertdouble ( A3 , INFO ( P ) , T , I ) ;
               P := Suivantpre ( P , A1 ) ;
              
           FSI ;
           I := I + 1 ;
          
       FTQ ;
       TQ ( P <> NIL ) :
           APPEL Insertdouble ( A3 , INFO ( P ) , T , I ) ;
           P := Suivantpre ( P , A1 ) ;
           I := I + 1 ;
          
       FTQ ;
       TQ ( Q <> NIL ) :
           APPEL Insertdouble ( A3 , INFO ( Q ) , T , I ) ;
           Q := Suiv_post ( Q , A2 ) ;
           I := I + 1 ;
          
       FTQ ;
      
   FIN
  {---------------------------------------------------------}
  {-----MODULE DE PARCOUR INORDRE PRE----------------------}
   ACTION Inpre ( A1 , A2 , A3 , T )
   SOIENT
       A1 , A2 , A3 DES ARB DE ENTIERS ;
       R , P , Q DES POINTEURS VERS UN ARB DE ENTIER ;
       T UN TABLEAU ( 50 ) DE ENTIER ;
       I UN ENTIER ;
      
   DEBUT
       P := A1 ;
       Q := A2 ;
       TQ FG ( P ) <> NIL :
           P := FG ( P ) ;
          
       FTQ ;
       SI ( INFO ( Q ) < INFO ( P ) ) :
           CREERNOEUD ( R ) ;
           AFF_INFO ( R , INFO ( Q ) ) ;
           AFF_ELEMENT ( T [ 1 ] , INFO ( Q ) ) ;
           A3 := R ;
           Q := Suivantpre ( Q , A2 ) ;
          
       SINON
           CREERNOEUD ( R ) ;
           AFF_INFO ( R , INFO ( P ) ) ;
           AFF_ELEMENT ( T [ 1 ] , INFO ( P ) ) ;
           A3 := R ;
           P := Suiv_in ( P , A1 ) ;
          
       FSI ;
       I := 2 ;
       TQ ( ( P <> NIL ) ET ( Q <> NIL ) ) :
           SI ( INFO ( Q ) < INFO ( P ) ) :
               APPEL Insertdouble ( A3 , INFO ( Q ) , T , I ) ;
               Q := Suivantpre ( Q , A2 ) ;
               I := I + 1 ;
              
           SINON
               APPEL Insertdouble ( A3 , INFO ( P ) , T , I ) ;
               P := Suiv_in ( P , A1 ) ;
               I := I + 1 ;
              
           FSI ;
          
       FTQ ;
       TQ ( P <> NIL ) :
           APPEL Insertdouble ( A3 , INFO ( P ) , T , I ) ;
           P := Suiv_in ( P , A1 ) ;
           I := I + 1 ;
          
       FTQ ;
       TQ ( Q <> NIL ) :
           APPEL Insertdouble ( A3 , INFO ( Q ) , T , I ) ;
           Q := Suivantpre ( Q , A2 ) ;
           I := I + 1 ;
          
       FTQ ;
      
   FIN
  {---------------------------------------------------------}
  {------MODULE DE PARCOUR INORDRE POST---------------------}
   ACTION Inpost ( A1 , A2 , A3 , T )
   SOIENT
       A1 , A2 , A3 DES ARB DE ENTIERS ;
       R , P , Q DES POINTEURS VERS UN ARB DE ENTIER ;
       T UN TABLEAU ( 50 ) DE ENTIER ;
       I UN ENTIER ;
      
   DEBUT
       P := A1 ;
       Q := A2 ;
       TQ FG ( P ) <> NIL :
           P := FG ( P ) ;
          
       FTQ ;
       R := NIL ;
       TQ ( Q <> NIL ) :
           TQ ( FG ( Q ) <> NIL ) :
               Q := FG ( Q ) ;
              
           FTQ ;
           R := Q ;
           Q := FD ( Q ) ;
          
       FTQ ;
       Q := R ;
       SI INFO ( Q ) < INFO ( P ) :
           CREERNOEUD ( R ) ;
           AFF_INFO ( R , INFO ( Q ) ) ;
           AFF_ELEMENT ( T [ 1 ] , INFO ( Q ) ) ;
           A3 := R ;
           Q := Suiv_post ( Q , A2 ) ;
          
       SINON
           CREERNOEUD ( R ) ;
           AFF_INFO ( R , INFO ( P ) ) ;
           AFF_ELEMENT ( T [ 1 ] , INFO ( P ) ) ;
           A3 := R ;
           P := Suiv_in ( P , A1 ) ;
          
       FSI ;
       I := 2 ;
       TQ ( ( P <> NIL ) ET ( Q <> NIL ) ) :
           SI ( INFO ( Q ) < INFO ( P ) ) :
               APPEL Insertdouble ( A3 , INFO ( Q ) , T , I ) ;
               Q := Suiv_post ( Q , A2 ) ;
              
           SINON
               APPEL Insertdouble ( A3 , INFO ( P ) , T , I ) ;
               P := Suiv_in ( P , A1 ) ;
              
           FSI ;
           I := I + 1 ;
          
       FTQ ;
       TQ ( P <> NIL ) :
           APPEL Insertdouble ( A3 , INFO ( P ) , T , I ) ;
           P := Suiv_in ( P , A1 ) ;
           I := I + 1 ;
          
       FTQ ;
       TQ ( Q <> NIL ) :
           APPEL Insertdouble ( A3 , INFO ( Q ) , T , I ) ;
           Q := Suiv_post ( Q , A2 ) ;
           I := I + 1 ;
          
       FTQ ;
      
   FIN
  {---------------------------------------------------------}
  {----PROGRAMME DE VERIFICATION DES RESULTATS--------------}
  {---------------------------------------------------------}
   FONCTION Nbrn ( A ) : ENTIER
   SOIT
       A UN ARB DE ENTIER ;
      
   DEBUT
       SI ( A = NIL ) :
           Nbrn := 0 ;
          
       SINON
           Nbrn := 1 + Nbrn ( FG ( A ) ) + Nbrn ( FD ( A ) ) ;
          
       FSI ;
      
   FIN
  {---------------------------------------------------------}
  {-------MODULE DE PARCOUR INORDRE DANS UN ARBRE-----------}
  {----IDEE: SI L'ARBRE EST STRUCTURE CORRECTEMENT LE-------}
  {--PARCOUR INORDRE NOUS DONNE LES INFOS DES NOEUDS EN-----}
  {---ORDRE CROISSANT---------------------------------------}
   FONCTION Inordre ( A ) : BOOLEEN
   SOIENT
       A UN ARB DE ENTIER ;
       R , Q DES POINTEURS VERS UN ARB DE ENTIER ;
      
   DEBUT
  { Inordre := VRAI ; 
       SI A <> NIL : 
       Q:=A; 
       TQ FG ( Q ) <> NIL : 
           Q := FG ( Q ) ; 
       FTQ ; 
           ECRIRE(INFO(Q)); 
           TQ ( ( Suiv_in ( Q,A ) <> NIL ) ET ( INFO ( Q ) < INFO ( Suiv_in ( Q,A ) ) ) ) : 
               Q := Suiv_in ( Q,A ) ; 
           FTQ ; 
           SI Q <> NIL : 
               Inordre := FAUX ; 
           FSI ; 
       FSI ; 
              }
       SI ( ( INFO ( A ) > INFO ( FG ( A ) ) ) OU ( INFO ( A ) < INFO ( FD ( A ) ) ) ) :
           Inordre := VRAI ;
          
       SINON
           Inordre := Inordre ( FG ( A ) ) ET Inordre ( FD ( A ) ) ;
          
       FSI ;
      
   FIN
   FONCTION Halfverify_min ( A1 , A2 , Choix , T , A3 ) : BOOLEEN
   SOIENT
       A1 UN ARB ;
       A2 UN ARB ;
       A3 UN ARB ;
       P UN ARB ;
       Q UN ARB ;
       R UN ARB ;
       Choix UN ENTIER ;
      {choix designe le type de parcours}
       S UN TABLEAU ( 50 ) DE ENTIER ;
       T UN TABLEAU ( 50 ) DE ENTIER ;
       H , M , J DES ENTIERS ;
       Trouv UN BOOLEEN ;
       I UN ENTIER;
      
   DEBUT
       Trouv := VRAI ;
       SI ( Choix = 3 ) :
           P := A1 ;
           Q := A2 ;
           I := 1 ;
           TQ ( ( P <> NIL ) ET ( Q <> NIL ) ) :
               SI ( INFO ( Q ) < INFO ( P ) ) :
                   AFF_ELEMENT ( S [ I ] , INFO ( Q ) ) ;
                   Q := Suivantpre ( Q , A2 ) ;
                  
               SINON
                   AFF_ELEMENT ( S [ I ] , INFO ( P ) ) ;
                   P := Suivantpre ( P , A1 ) ;
                  
               FSI ;
               I := I + 1 ;
              
           FTQ ;
           TQ ( P <> NIL ) :
               AFF_ELEMENT ( S [ I ] , INFO ( P ) ) ;
               P := Suivantpre ( P , A1 ) ;
               I := I + 1 ;
              
           FTQ ;
           TQ ( Q <> NIL ) :
               AFF_ELEMENT ( S [ I ] , INFO ( Q ) ) ;
               Q := Suivantpre ( Q , A2 ) ;
               I := I + 1 ;
              
           FTQ ;
          
       SINON
           SI ( Choix = 1 ) :
               P := A1 ;
               Q := A2 ;
               TQ ( FG ( P ) <> NIL ) :
                   P := FG ( P ) ;
                  
               FTQ ;
               I := 1 ;
               TQ ( ( P <> NIL ) ET ( Q <> NIL ) ) :
                   SI ( INFO ( Q ) < INFO ( P ) ) :
                       AFF_ELEMENT ( S [ I ] , INFO ( Q ) ) ;
                       Q := Suivantpre ( Q , A2 ) ;
                       I := I + 1 ;
                      
                   SINON
                       AFF_ELEMENT ( S [ I ] , INFO ( P ) ) ;
                       P := Suiv_in ( P , A1 ) ;
                       I := I + 1 ;
                      
                   FSI ;
                  
               FTQ ;
               TQ ( P <> NIL ) :
                   AFF_ELEMENT ( S [ I ] , INFO ( P ) ) ;
                   P := Suiv_in ( P , A1 ) ;
                   I := I + 1 ;
                  
               FTQ ;
               TQ ( Q <> NIL ) :
                   AFF_ELEMENT ( S [ I ] , INFO ( Q ) ) ;
                   Q := Suivantpre ( Q , A2 ) ;
                   I := I + 1 ;
                  
               FTQ ;
              
           SINON
               SI ( Choix = 2 ) :
                   P := A1 ;
                   Q := A2 ;
                   TQ FG ( P ) <> NIL :
                       P := FG ( P ) ;
                      
                   FTQ ;
                   R := NIL ;
                   TQ ( Q <> NIL ) :
                       TQ ( FG ( Q ) <> NIL ) :
                           Q := FG ( Q ) ;
                          
                       FTQ ;
                       R := Q ;
                       Q := FD ( Q ) ;
                      
                   FTQ ;
                   Q := R ;
                   I := 1 ;
                   TQ ( ( P <> NIL ) ET ( Q <> NIL ) ) :
                       SI ( INFO ( Q ) < INFO ( P ) ) :
                           AFF_ELEMENT ( S [ I ] , INFO ( Q ) ) ;
                           Q := Suiv_post ( Q , A2 ) ;
                          
                       SINON
                           AFF_ELEMENT ( S [ I ] , INFO ( P ) ) ;
                           P := Suiv_in ( P , A1 ) ;
                          
                       FSI ;
                       I := I + 1 ;
                      
                   FTQ ;
                   TQ ( P <> NIL ) :
                       AFF_ELEMENT ( S [ I ] , INFO ( P ) ) ;
                       P := Suiv_in ( P , A1 ) ;
                       I := I + 1 ;
                      
                   FTQ ;
                   TQ ( Q <> NIL ) :
                       AFF_ELEMENT ( S [ I ] , INFO ( Q ) ) ;
                       Q := Suiv_post ( Q , A2 ) ;
                       I := I + 1 ;
                      
                   FTQ ;
                  
               FSI ;
              
           FSI ;
          
       FSI ;
       I := 1 ;
       J := 1 ;
       H := ELEMENT ( S [ 1 ] ) ;
       M := ELEMENT ( T [ 1 ] ) ;
       Trouv := VRAI ;
       TQ ( ( I < Nbrn ( A3 ) ) ET ( Trouv = VRAI ) ) :
           SI ( H <> M ) :
               Trouv := FAUX ;
              
           FSI ;
           I := I + 1 ;
           J := J + 1 ;
           H := ELEMENT ( S [ I ] ) ;
           M := ELEMENT ( T [ J ] ) ;
          
       FTQ ;
       Halfverify_min := Trouv ;
      
   FIN
   FONCTION Otherhalfverify_min ( A1 , A2 , Choix , T , A3 ) : BOOLEEN
   SOIENT
       A1 UN ARB ;
       A2 UN ARB ;
       A3 UN ARB ;
       P UN ARB ;
       Q UN ARB ;
       R UN ARB ;
       Choix UN ENTIER ;
      {choix designe le type de parcours}
       S UN TABLEAU ( 50 ) DE ENTIER ;
       T UN TABLEAU ( 50 ) DE ENTIER ;
       H , M , J DES ENTIERS ;
       Trouv UN BOOLEEN ;
       I UN ENTIER;
      
   DEBUT
       Trouv := VRAI ;
       SI ( Choix = 4 ) :
           P := A1 ;
           Q := A2 ;
          {INITIALISER LES POINTEURS A LA BONNE PLACE}
           R := NIL ;
           TQ ( P <> NIL ) :
               TQ ( FG ( P ) <> NIL ) :
                   P := FG ( P ) ;
                  
               FTQ ;
               R := P ;
               P := FD ( P ) ;
              
           FTQ ;
           P := R ;
           R := NIL ;
           TQ ( Q <> NIL ) :
               TQ ( FG ( Q ) <> NIL ) :
                   Q := FG ( Q ) ;
                  
               FTQ ;
               R := Q ;
               Q := FD ( Q ) ;
              
           FTQ ;
           Q := R ;
           I := 1 ;
           TQ ( ( P <> NIL ) ET ( Q <> NIL ) ) :
               SI ( INFO ( Q ) < INFO ( P ) ) :
                   AFF_ELEMENT ( S [ I ] , INFO ( Q ) ) ;
                   Q := Suiv_post ( Q , A2 ) ;
                  
               SINON
                   AFF_ELEMENT ( S [ I ] , INFO ( P ) ) ;
                   P := Suiv_post ( P , A1 ) ;
                  
               FSI ;
               I := I + 1 ;
              
           FTQ ;
           TQ ( P <> NIL ) :
               AFF_ELEMENT ( S [ I ] , INFO ( P ) ) ;
               P := Suiv_post ( P , A1 ) ;
               I := I + 1 ;
              
           FTQ ;
           TQ ( Q <> NIL ) :
               AFF_ELEMENT ( S [ I ] , INFO ( Q ) ) ;
               Q := Suiv_post ( Q , A2 ) ;
               I := I + 1 ;
              
           FTQ ;
          
       SINON
           SI ( Choix = 5 ) :
               P := A1 ;
               Q := A2 ;
              {INITIALISER LES POINTEURS A LA BONNE PLACE}
               R := NIL ;
               TQ ( Q <> NIL ) :
                   TQ ( FG ( Q ) <> NIL ) :
                       Q := FG ( Q ) ;
                      
                   FTQ ;
                   R := Q ;
                   Q := FD ( Q ) ;
                  
               FTQ ;
               Q := R ;
               I := 1 ;
               TQ ( ( P <> NIL ) ET ( Q <> NIL ) ) :
                   SI ( INFO ( Q ) < INFO ( P ) ) :
                       AFF_ELEMENT ( S [ I ] , INFO ( Q ) ) ;
                       Q := Suiv_post ( Q , A2 ) ;
                      
                   SINON
                       AFF_ELEMENT ( S [ I ] , INFO ( P ) ) ;
                       P := Suivantpre ( P , A1 ) ;
                      
                   FSI ;
                   I := I + 1 ;
                  
               FTQ ;
               TQ ( P <> NIL ) :
                   AFF_ELEMENT ( S [ I ] , INFO ( P ) ) ;
                   P := Suivantpre ( P , A1 ) ;
                   I := I + 1 ;
                  
               FTQ ;
               TQ ( Q <> NIL ) :
                   AFF_ELEMENT ( S [ I ] , INFO ( Q ) ) ;
                   Q := Suiv_post ( Q , A2 ) ;
                   I := I + 1 ;
                  
               FTQ ;
              
           FSI ;
          
       FSI ;
       I := 1 ;
       J := 1 ;
       H := ELEMENT ( S [ 1 ] ) ;
       M := ELEMENT ( T [ 1 ] ) ;
       Trouv := VRAI ;
       TQ ( ( I < Nbrn ( A3 ) ) ET ( Trouv = VRAI ) ) :
           SI ( H <> M ) :
               Trouv := FAUX ;
              
           FSI ;
           I := I + 1 ;
           J := J + 1 ;
           H := ELEMENT ( S [ I ] ) ;
           M := ELEMENT ( T [ J ] ) ;
          
       FTQ ;
       Otherhalfverify_min := Trouv ;
      
   FIN
  {=======module de verification de l'ordre==========}
   FONCTION Verify_min ( A1 , A2 , Choix , T , A3 ) : BOOLEEN
   SOIENT
       A1 UN ARB ;
       A2 UN ARB ;
       A3 UN ARB ;
       P UN ARB ;
       Q UN ARB ;
       R UN ARB ;
       Choix UN ENTIER ;
      {choix designe le type de parcours}
       S UN TABLEAU ( 50 ) DE ENTIER ;
       T UN TABLEAU ( 50 ) DE ENTIER ;
       H , M , J DES ENTIERS ;
       Trouv UN BOOLEEN ;
      
   DEBUT
       SI ( Choix < 4 ) :
           Verify_min := Halfverify_min ( A1 , A2 , Choix , T , A3 ) ;
          
       SINON
           Verify_min := Otherhalfverify_min ( A1 , A2 , Choix , T , A3 ) ;
          
       FSI ;
      
   FIN
  {----------MODULE COMPLET DE VERIFICATION-------}
  {-----------------------------------------------}
   FONCTION Verify ( A1 , A2 , A3 , T , K ) : BOOLEEN
   SOIENT
       A1 , A2 , A3 DES ARB DE ENTIER ;
       T UN TABLEAU ( 50 ) DE ENTIER ;
       K UN ENTIER ;
      
   DEBUT
       Verify := VRAI ;
      {====vérification de nb de noeuds====}
       SI ( Nbrn ( A3 ) <> Nbrn ( A1 ) + Nbrn ( A2 ) ) :
           Verify := FAUX ;
          
       SINON
           ECRIRE ( '___Le nb de noeuds de l arbre généré est correct' ) ;
          
       FSI ;
      {======verification que c un arbre de recherche binaire')}
       SI ( Inordre ( A3 ) = VRAI )
           ;
           ECRIRE ( '___Le parcours inordre donne une liste croissante' ) ;
           ECRIRE ( '___Ainsi il est un arbre de recherche binaire' ) ;
          
       SINON
           Verify := FAUX ;
          
       FSI ;
      {======verification du minimum=========}
       SI ( Verify_min ( A1 , A2 , K , T , A3 ) = VRAI ) :
           ECRIRE ( '___l ordre de creation de l arbre est correct' ) ;
          
       SINON
           Verify := FAUX ;
          
       FSI ;
      
   FIN
  {======} 
