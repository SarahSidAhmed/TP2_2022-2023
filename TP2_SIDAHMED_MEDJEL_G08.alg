
  {TP2 _ SID AHMED SARAH _ MENDJEL CHAHRAZED_ G08}
   SOIENT
       A1 , A2 , A3 DES ARB DE ENTIERS ;
       P , Q DES POINTEURS VERS UN ARB ;
       Stack UNE PILE DE ARB DE ENTIERS ;
       Displayarb , Genarb , Drawarb : ACTION ;
       Insert , Rechval : FONCTION ( BOOLEEN ) ;
       Suivantpre , Suivantpost , Suivantin , Rechvaldouble , Insertdouble DES ACTIONS ;
       Prepre , Postpost , Prepost , Inpre , Inpost DES ACTIONS ;
      {--------------PROGRAMME PRINCIPAL-------------------}
      {----------------------------------------------------}
      
   DEBUT
  {--CREATION DE PREMIER ARBRE A1--}
       APPEL Genarb ( A1 , 10 ) ;
       ECRIRE ( 'LE PREMIER ARBRE GENERE ALEATOIREMENT:' ) ;
       APPEL Displayarb ( A1 ) ;
      {--CREATION DU DEUXIEME ARBRE A2--}
       APPEL Genarb ( A2 , 10 ) ;
       ECRIRE ( 'LE DEUXIEME ARBRE GENERE ALEATOIREMENT:' ) ;
       APPEL Displayarb ( A2 ) ;
      {APPEL DRAWARB(A1);  }
      
   FIN
  {-----------LES MODULES-----------------------------}
  {---------------------------------------------------}
  {-------AFFICHAGE D'UN ARBRE- PLUS CLAIRE-----------}
   ACTION Drawarb ( A )
   SOIENT
       A UN ARB DE ENTIER ;
      
   DEBUT
       SI ( ( FD ( A ) = NIL ) ET ( A = NIL ) ) :
           ECRIRE ( '--' ) ;
          
       SINON
           ECRIRE ( INFO ( A ) , '[--' , INFO ( FD ( A ) ) ) ;
           APPEL Drawarb ( FD ( A ) ) ;
           APPEL Drawarb ( FG ( A ) ) ;
          
       FSI ;
      
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
       SI INFO ( Q ) >= V :
           AFF_FG ( Q , P ) ;
          
       SINON
           AFF_FD ( Q , P ) ;
          
       FSI ;
      
   FIN
  {---------------------------------------------------------}
  {------MODULE DE RECHERCHE DU SUIVANT PREORDRE------------}
   ACTION Suivantpre ( P , Q )
   SOIENT
       Q UN ARB DE ENTIERS ;
       P UNE PILE DE ARB DE ENTIER ;
      
   DEBUT
       SI FG ( Q ) <> NIL :
           EMPILER ( P , Q ) ;
           Q := FG ( Q ) ;
          
       SINON
           TQ ( ( PILEVIDE ( P ) = FAUX ) ET ( FD ( Q ) = NIL ) ) :
               DEPILER ( P , Q )
           FTQ ;
           Q := FD ( Q ) ;
          
       FSI
   FIN
  {---------------------------------------------------------}
  {-------MODULE DE RECHERCHE DU SUIVANT POSTORDRE---------}
   ACTION Suivantpost ( P , Q )
   SOIENT
       P , Q DES POINTEURS VERS UN ARB DE ENTIER ;
      
   DEBUT
      
   FIN
  {---------------------------------------------------------}
  {---------MODULE DE RECHERCHE DU SUIVANT INORDRE----------}
   ACTION Suivantin ( P , Q )
   SOIENT
       P , Q DES POINTEURS VERS UN ARB DE ENTIER ;
      
   DEBUT
      
   FIN
  {---------------------------------------------------------}
  {----------MODULE DE PARCOUR PRE PRE----------------------}
   ACTION Prepre ( A1 , A2 , A3 )
   SOIENT
       A1 , A2 , A3 DES ARB DE ENTIERS ;
       P , Q DES POINTEURS VERS UN ARB DE ENTIER ;
      
   DEBUT
       P := A1 ;
       Q := A2 ;
       TQ ( ( P <> NIL ) ET ( Q <> NIL ) ) :
           SI INFO ( Q ) < INFO ( P ) :
               APPEL Insertdouble ( A3 , INFO ( Q ) ) ;
               APPEL Suivantpre ( Q ) ;
              
           SINON
               APPEL Insertdouble ( A3 , INFO ( P ) ) ;
               APPEL Suivantpre ( P ) ;
              
           FSI ;
          
       FTQ ;
      
   FIN
  {---------------------------------------------------------}
  {-----MODULE DE PARCOUR POST POST--------------------------}
   ACTION Postpost ( A1 , A2 , A3 )
   SOIENT
       A1 , A2 , A3 DES ARB DE ENTIERS ;
       P , Q DES POINTEURS VERS UN ARB DE ENTIER ;
      
   DEBUT
      
   FIN
  {---------------------------------------------------------}
  {-----MODULE DE PARCOUR PRE POST--------------------------}
   ACTION Prepost ( A1 , A2 , A3 )
   SOIENT
       A1 , A2 , A3 DES ARB DE ENTIERS ;
       P , Q DES POINTEURS VERS UN ARB DE ENTIER ;
      
   DEBUT
      
   FIN
  {---------------------------------------------------------}
  {-----MODULE DE PARCOUR INORDRE PRE----------------------}
   ACTION Inpre ( A1 , A2 , A3 )
   SOIENT
       A1 , A2 , A3 DES ARB DE ENTIERS ;
       P , Q DES POINTEURS VERS UN ARB DE ENTIER ;
      
   DEBUT
      
   FIN
  {---------------------------------------------------------}
  {------MODULE DE PARCOUR INORDRE POST---------------------}
   ACTION Inpost ( A1 , A2 , A )
   SOIENT
       A1 , A2 , A3 DES ARB DE ENTIERS ;
       P , Q DES POINTEURS VERS UN ARB DE ENTIER ;
      
   DEBUT
      
   FIN
  {---------------------------------------------------------}
  {----PROGRAMME DE VERIFICATION DES RESULTATS--------------}
  {---------------------------------------------------------} 
