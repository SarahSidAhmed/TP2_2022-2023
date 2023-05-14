
  {TP2 _ SID AHMED SARAH _ MENDJEL CHAHRAZED_ G08}
   SOIENT
       A1 , A2 , A3 DES ARB DE ENTIERS ;
       P , Q DES POINTEURS VERS UN ARB ;
       Displayarb : ACTION ;
       Insert : FONCTION ( BOOLEEN ) ;
       Genarb : ACTION ;
       Rechval : FONCTION ( BOOLEEN ) ;
      
   DEBUT
       APPEL Genarb ( A1 , 34 ) ;
       ECRIRE('LE PREMIER ARBRE GENERE ALEATOIREMENT:');
       APPEL Displayarb ( A1 ) ;
       APPEL  GENARB(A2, 34);
        ECRIRE('LE DEUXIEME ARBRE GENERE ALEATOIREMENT:');
       APPEL DISPLAYARB(A2);
      
   FIN
   ACTION Genarb ( A , N )
   SOIENT
       A UN ARB DE ENTIER ;
       N , I , Cpt , Num DES ENTIERS ;
       Found UN BOOLEEN ;
      
   DEBUT
   FOUND:=FAUX;
       Cpt := 1 ;
       TQ CPT<=N :
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
      { 
      SI A=NIL: 
      P:=NIL; 
      Q:=NIL; 
      SINON 
      SI V=INFO(A): 
       P:=A; 
       Q:=PERE(A); 
       FOUND:=VRAI; 
      SINON 
      SI V<INFO(A): 
      FOUND:=RECHVAL(FD(A),V,P,Q); 
      SINON 
      FOUND:=RECHVAL(FG(A),V,P,Q); 
      FSI; 
      FSI; 
      FSI; 
      }
      
   FIN
