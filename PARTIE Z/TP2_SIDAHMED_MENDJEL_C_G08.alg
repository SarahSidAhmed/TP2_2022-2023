
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
        Inordre:FONCTION(BOOLEEN) ;
       Nbrn : FONCTION ( ENTIER ) ;
       N, M, V UN ENTIER;
       I , K UN ENTIER ;
       Verify : FONCTION ( BOOLEEN ) ;
      
   DEBUT
   N:=50; {Varible du nombre de noeud}
   M:=10; {Varible de nombre d'occuration}
      POUR I := 1 , M:
      A1:=NIL;
      A2:=NIL;
      A3:=NIL;
           APPEL Genarb ( A1 , N ) ;
           APPEL Genarb ( A2 , N ) ;
           POUR K := 1 , 5 :
               SI K = 1 :
                   APPEL Inpre ( A1 , A2 , A3 ) ;

               FSI ;
               SI K = 2 :
                   APPEL Inpost ( A1 , A2 , A3 ) ;

               FSI ;
               SI K = 3 :
                   APPEL Prepre ( A1 , A2 , A3 ) ;

               FSI ;
               SI K = 4 :
                   APPEL Postpost ( A1 , A2 , A3 ) ;

               FSI ;
               SI K = 5 :
                   APPEL Prepost ( A1 , A2 , A3 ) ;

               FSI ;
               SI Verify ( A3 , N ) = VRAI :
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
   ACTION Insertdouble ( A , V )
   SOIENT
       A UN ARB DE ENTIERS ;
       V UN ENTIER ;
       P , Q DES POINTEURS VERS UN ARB DE ENTIER ;
      
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
      
   FIN
  {---------------------------------------------------------}
  {---------------------------------------------------------}
  {---------------------------------------------------------}
  {---------MODULE DE RECHERCHE DU SUIVANT INORDRE----------}
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
   ACTION Prepre ( A1 , A2 , A3 )
   SOIENT
       A1 , A2 , A3 DES ARB DE ENTIERS ;
       P , Q , R DES POINTEURS VERS UN ARB DE ENTIER ;

      
   DEBUT
       P := A1 ;
       Q := A2 ;
       SI (INFO ( Q ) < INFO ( P )) :
           CREERNOEUD ( R ) ;
           AFF_INFO ( R , INFO ( Q ) ) ;
           A3 := R ;
           Q := Suivantpre ( Q , A2 ) ;
          
       SINON
           CREERNOEUD ( R ) ;
           AFF_INFO ( R , INFO ( P ) ) ;
           A3 := R ;
           P := Suivantpre ( P , A1 ) ;
          
       FSI ;
       TQ ( ( P <> NIL ) ET ( Q <> NIL ) ) :
           SI ( INFO ( Q ) < INFO ( P ) ) :
               APPEL Insertdouble ( A3 , INFO ( Q ) ) ;
               Q := Suivantpre ( Q , A2 ) ;
              
           SINON
               APPEL Insertdouble ( A3 , INFO ( P ) ) ;
               P := Suivantpre ( P , A1 ) ;
              
           FSI ;
          
       FTQ ;
       TQ ( P <> NIL ) :
           APPEL Insertdouble ( A3 , INFO ( P ) ) ;
           P := Suivantpre ( P , A1 ) ;
          
       FTQ ;
       TQ ( Q <> NIL ) :
           APPEL Insertdouble ( A3 , INFO ( Q ) ) ;
           Q := Suivantpre ( Q , A2 ) ;
          
       FTQ ;
      
   FIN
  {---------------------------------------------------------}
  {-----MODULE DE PARCOUR POST POST--------------------------}
   ACTION Postpost ( A1 , A2 , A3 )
   SOIENT
       A1 , A2 , A3 DES ARB DE ENTIERS ;
       R , P , Q DES POINTEURS VERS UN ARB DE ENTIER ;
      
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
           A3 := R ;
           Q := Suiv_post ( Q , A2 ) ;
          
       SINON
           CREERNOEUD ( R ) ;
           AFF_INFO ( R , INFO ( P ) ) ;
           A3 := R ;
           P := Suiv_post ( P , A1 ) ;
          
       FSI ;
       TQ ( ( P <> NIL ) ET ( Q <> NIL ) ) :
           SI ( INFO ( Q ) < INFO ( P ) ) :
               APPEL Insertdouble ( A3 , INFO ( Q ) ) ;
               Q := Suiv_post ( Q , A2 ) ;
              
           SINON
               APPEL Insertdouble ( A3 , INFO ( P ) ) ;
               P := Suiv_post ( P , A1 ) ;
              
           FSI ;
          
       FTQ ;
       TQ ( P <> NIL ) :
           APPEL Insertdouble ( A3 , INFO ( P ) ) ;
           P := Suiv_post ( P , A1 ) ;
          
       FTQ ;
       TQ ( Q <> NIL ) :
           APPEL Insertdouble ( A3 , INFO ( Q ) ) ;
           Q := Suiv_post ( Q , A2 ) ;
          
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
   ACTION Prepost ( A1 , A2 , A3 )
   SOIENT
       A1 , A2 , A3 DES ARB DE ENTIERS ;
       R,P , Q DES ARB DE ENTIER ;
      
   DEBUT
       P := A1 ;
       Q := A2 ;
        R := NIL ;
       TQ ( q<> NIL ) :
           TQ ( FG ( q ) <> NIL ) :
               q := FG ( q ) ;

           FTQ ;
           R := q ;
           q := FD ( q ) ;

       FTQ ;
       q := R ;
       R := NIL ;
        SI (INFO ( Q ) < INFO ( P )) :
           CREERNOEUD ( R ) ;
           AFF_INFO ( R , INFO ( Q ) ) ;
           A3 := R ;
           Q := Suiv_post ( Q , A2 ) ;

       SINON
           CREERNOEUD ( R ) ;
           AFF_INFO ( R , INFO ( P ) ) ;
           A3 := R ;
           P := Suivantpre ( P , A1 ) ;

       FSI ;
       TQ ( ( P <> NIL ) ET ( Q <> NIL ) ) :
           SI ( INFO ( Q ) < INFO ( P ) ) :
               APPEL Insertdouble ( A3 , INFO ( Q ) ) ;
               Q := Suiv_post ( Q , A2 ) ;

           SINON
               APPEL Insertdouble ( A3 , INFO ( P ) ) ;
               P := Suivantpre ( P , A1 ) ;

           FSI ;

       FTQ ;
       TQ ( P <> NIL ) :
           APPEL Insertdouble ( A3 , INFO ( P ) ) ;
           P := Suivantpre ( P , A1 ) ;

       FTQ ;
       TQ ( Q <> NIL ) :
           APPEL Insertdouble ( A3 , INFO ( Q ) ) ;
           Q := Suiv_post( Q , A2 ) ;

       FTQ ;
      
   FIN
  {---------------------------------------------------------}
  {-----MODULE DE PARCOUR INORDRE PRE----------------------}
   ACTION Inpre ( A1 , A2 , A3 )
   SOIENT
       A1 , A2 , A3 DES ARB DE ENTIERS ;
      R, P , Q DES POINTEURS VERS UN ARB DE ENTIER ;
      
   DEBUT
       P := A1 ;
       Q := A2 ;
       TQ FG ( Q ) <> NIL :
           Q := FG ( Q ) ;
       ftq;
        SI (INFO ( Q ) < INFO ( P )) :
           CREERNOEUD ( R ) ;
           AFF_INFO ( R , INFO ( Q ) ) ;
           A3 := R ;
           Q := Suiv_in ( Q , A2 ) ;

       SINON
           CREERNOEUD ( R ) ;
           AFF_INFO ( R , INFO ( P ) ) ;
           A3 := R ;
           P := Suivantpre ( P , A1 ) ;

       FSI ;
       TQ ( ( P <> NIL ) ET ( Q <> NIL ) ) :
           SI ( INFO ( Q ) < INFO ( P ) ) :
               APPEL Insertdouble ( A3 , INFO ( Q ) ) ;
                Q := Suiv_in ( Q , A2 ) ;

           SINON
               APPEL Insertdouble ( A3 , INFO ( P ) ) ;
               P := Suivantpre ( P , A1 ) ;

           FSI ;

       FTQ ;
       TQ ( P <> NIL ) :
           APPEL Insertdouble ( A3 , INFO ( P ) ) ;
           P := Suivantpre ( P , A1 ) ;

       FTQ ;
       TQ ( Q <> NIL ) :
           APPEL Insertdouble ( A3 , INFO ( Q ) ) ;
            Q := Suiv_in ( Q , A2 ) ;

       FTQ ;




      
   FIN
  {---------------------------------------------------------}
  {------MODULE DE PARCOUR INORDRE POST---------------------}
   ACTION Inpost ( A1 , A2 , A3 )
   SOIENT
       A1 , A2 , A3 DES ARB DE ENTIERS ;
       R , P , Q DES POINTEURS VERS UN ARB DE ENTIER ;
      
   DEBUT
       P := A1 ;
       Q := A2 ;
       TQ FG ( Q ) <> NIL :
           Q := FG ( Q ) ;
          
       FTQ ;
       R := NIL ;
       TQ ( P <> NIL ) :
           TQ ( FG ( P ) <> NIL ) :
               P := FG ( P ) ;
              
           FTQ ;
           R := P ;
           P := FD ( P ) ;
          
       FTQ ;
       P := R ;
       SI INFO ( Q ) < INFO ( P ) :
           CREERNOEUD ( R ) ;
           AFF_INFO ( R , INFO ( Q ) ) ;
           A3 := R ;
           Q := Suiv_in ( Q , A2 ) ;
          
       SINON
           CREERNOEUD ( R ) ;
           AFF_INFO ( R , INFO ( P ) ) ;
           A3 := R ;
           P := Suiv_post ( P , A1 ) ;
          
       FSI ;
       TQ ( ( P <> NIL ) ET ( Q <> NIL ) ) :
           SI ( INFO ( Q ) < INFO ( P ) ) :
               APPEL Insertdouble ( A3 , INFO ( Q ) ) ;
               Q := Suiv_in ( Q , A2 ) ;
              
           SINON
               APPEL Insertdouble ( A3 , INFO ( P ) ) ;
               P := Suiv_post ( P , A1 ) ;
              
           FSI ;
          
       FTQ ;
       TQ ( P <> NIL ) :
           APPEL Insertdouble ( A3 , INFO ( P ) ) ;
           P := Suiv_post ( P , A1 ) ;
          
       FTQ ;
       TQ ( Q <> NIL ) :
           APPEL Insertdouble ( A3 , INFO ( Q ) ) ;
           Q := Suiv_in ( Q , A2 ) ;
          
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
       R,Q DES POINTEURS VERS UN ARB DE ENTIER;

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
       SI ((INFO(A)>INFO(FG(A))) OU (INFO(A)<INFO(FD(A)))):
       INORDRE:=VRAI;
       SINON
       INORDRE:=INORDRE(FG(A)) ET INORDRE(FD(A));
       FSI;
   FIN
  {----------MODULE COMPLET DE VERIFICATION-------}
  {-----------------------------------------------}
   FONCTION Verify ( A , Noeud ) : BOOLEEN
   SOIENT
       A UN ARB DE ENTIER ;
       Noeud UN ENTIER ;
       N UN ENTIER;

   DEBUT
   N:=NOEUD*2;
       SI Nbrn ( A ) <> N :
           Verify := FAUX ;

       SINON
           Verify := Inordre ( A ) ;

       FSI ;

   FIN
  {======}
