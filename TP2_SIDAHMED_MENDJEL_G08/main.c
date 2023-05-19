  /**--------------------------------------------------------**/
  /**       C o n v e r s i o n   Z vers C (Standard)        **/
  /**             Réalisée par Pr D.E ZEGOUR                 **/
  /**             E S I - Alger                              **/
  /**             Copywrite 2014                             **/
  /**--------------------------------------------------------**/

  /*TP2 _ SID AHMED SARAH _ MENDJEL CHAHRAZED_ G08*/


  #include <stdio.h>
  #include <stdlib.h>
  #include <Time.h>

  typedef int bool ;

  #define True 1
  #define False 0

  /** Implémentation **\: ARBRE BINAIRE DE ENTIERS**/

  /** Arbres de recherche binaire **/

  typedef int Typeelem_Ai   ;
  typedef struct Noeud_Ai * Pointeur_Ai ;

  struct Noeud_Ai
    {
      Typeelem_Ai  Val ;
      Pointeur_Ai Fg ;
      Pointeur_Ai Fd ;
      Pointeur_Ai Pere ;
     } ;

  Typeelem_Ai Info_Ai( Pointeur_Ai P )
    { return P->Val;   }

  Pointeur_Ai Fg_Ai( Pointeur_Ai P)
    { return P->Fg ; }

  Pointeur_Ai Fd_Ai( Pointeur_Ai P)
    { return P->Fd ; }

  Pointeur_Ai Pere_Ai( Pointeur_Ai P)
    { return P->Pere ; }

  void Aff_info_Ai ( Pointeur_Ai P, Typeelem_Ai Val)
    {
       P->Val = Val ;
    }

  void Aff_fg_Ai( Pointeur_Ai P, Pointeur_Ai Q)
    { P->Fg =  Q;  }

  void Aff_fd_Ai( Pointeur_Ai P, Pointeur_Ai Q)
    { P->Fd =  Q ; }

  void Aff_pere_Ai( Pointeur_Ai P, Pointeur_Ai Q)
    { P->Pere =  Q ; }

  void Creernoeud_Ai( Pointeur_Ai *P)
    {
      *P = (struct Noeud_Ai *) malloc( sizeof( struct Noeud_Ai))   ;
      (*P)->Fg = NULL;
      (*P)->Fd = NULL;
      (*P)->Pere = NULL;
    }

  void Liberernoeud_Ai( Pointeur_Ai P)
    { free( P ) ; }

  /** Variables du programme principal **/
  Pointeur_Ai A1=NULL;
  Pointeur_Ai A2=NULL;
  Pointeur_Ai A3=NULL;
  Pointeur_Ai P=NULL;
  Pointeur_Ai Q=NULL;
  int _Px1;
  int _Px2;

  /** Fonctions standards **/

  int Aleanombre( int N )
    { return ( rand() % N ); }


  /** Prototypes des fonctions **/

  void Genarb (Pointeur_Ai *A , int *N);
  void Displayarb (Pointeur_Ai *A);
  bool  Insert (Pointeur_Ai *A , int *V) ;
  bool  Rechval (Pointeur_Ai *A , int *V , Pointeur_Ai *P , Pointeur_Ai *Q) ;
  void Prepre (Pointeur_Ai *A1 , Pointeur_Ai *A2 , Pointeur_Ai *A3);
  void Postpost (Pointeur_Ai *A1 , Pointeur_Ai *A2 , Pointeur_Ai *A3);
  void Prepost (Pointeur_Ai *A1 , Pointeur_Ai *A2 , Pointeur_Ai *A3);
  void Inpre (Pointeur_Ai *A1 , Pointeur_Ai *A2 , Pointeur_Ai *A3);
  void Inpost (Pointeur_Ai *A1 , Pointeur_Ai *A2 , Pointeur_Ai *A3);

  void Genarb (Pointeur_Ai *A , int *N)
    {
      /** Variables locales **/
      int Cpt;
      int Num;
      bool Found;

      /** Corps du module **/
     Found  =  False ;
     Cpt  =  1 ;
     while( Cpt <= *N)  {
       Num  =  Aleanombre ( *N ) ;
       if( Cpt == 1)   {
         Creernoeud_Ai (& *A ) ;
         Aff_info_Ai ( *A , Num ) ;
         }
       else
         {
         Found  =  Insert ( & *A , & Num ) ;

       } ;
       if( ( Found == False ))   {
         Cpt  =  Cpt + 1 ;

       } ;

     } ;

    }
  void Displayarb (Pointeur_Ai *A)
    {
      /** Variables locales **/
      Pointeur_Ai _Px1=NULL;
      Pointeur_Ai _Px2=NULL;

      /** Corps du module **/
     if( *A != NULL)   {
       printf ( " %d\n", Info_Ai(*A) ) ;
       _Px1 =  Fg_Ai ( *A ) ;
       Displayarb ( &_Px1) ;
       _Px2 =  Fd_Ai ( *A ) ;
       Displayarb ( &_Px2) ;

     }
    }
  bool  Insert (Pointeur_Ai *A , int *V)
    {
      /** Variables locales **/
      bool  Insert2 ;
      Pointeur_Ai P=NULL;
      Pointeur_Ai Q=NULL;
      bool Found;

      /** Corps du module **/
     Found  =  Rechval ( & *A , & *V , & P , & Q ) ;
     if( P == NULL)   {
       Creernoeud_Ai (& P ) ;
       Aff_info_Ai ( P , *V ) ;
       if( Info_Ai ( Q ) > *V)   {
         Aff_fg_Ai ( Q , P ) ;
         }
       else
         {
         Aff_fd_Ai ( Q , P ) ;

       } ;

     } ;
     Insert2  =  Found ;

     return Insert2 ;
    }
  bool  Rechval (Pointeur_Ai *A , int *V , Pointeur_Ai *P , Pointeur_Ai *Q)
    {
      /** Variables locales **/
      bool  Rechval2 ;
      bool Found;

      /** Corps du module **/
     Found  =  False ;
     *P  =  *A ;
     while( ( ( *P != NULL ) && ( Found == False ) )) {
       if( Info_Ai ( *P ) == *V)   {
         Found  =  True ;
         }
       else
         {
         if( Info_Ai ( *P ) > *V)   {
           *Q  =  *P ;
           *P  =  Fg_Ai ( *P ) ;
           }
         else
           {
           *Q  =  *P ;
           *P  =  Fd_Ai ( *P ) ;

         } ;

       } ;

     } ;
     Rechval2  =  Found ;
    /*
      SI *A=NIL:
      *P:=NIL;
      *Q:=NIL;
      SINON
      SI *V=INFO(*A):
       *P:=*A;
       *Q:=PERE(*A);
       FOUND:=VRAI;
      SINON
      SI *V<INFO(*A):
      FOUND:=RECHVAL(FD(*A),*V,*P,*Q);
      SINON
      FOUND:=RECHVAL(FG(*A),*V,*P,*Q);
      FSI;
      FSI;
      FSI;
      */

     return Rechval2 ;
    }
  void Prepre (Pointeur_Ai *A1 , Pointeur_Ai *A2 , Pointeur_Ai *A3)
    {

      /** Corps du module **/
    ;
    }
  void Postpost (Pointeur_Ai *A1 , Pointeur_Ai *A2 , Pointeur_Ai *A3)
    {

      /** Corps du module **/
    ;
    }
  void Prepost (Pointeur_Ai *A1 , Pointeur_Ai *A2 , Pointeur_Ai *A3)
    {

      /** Corps du module **/
    ;
    }
  void Inpre (Pointeur_Ai *A1 , Pointeur_Ai *A2 , Pointeur_Ai *A3)
    {

      /** Corps du module **/
    ;
    }
  void Inpost (Pointeur_Ai *A1 , Pointeur_Ai *A2 , Pointeur_Ai *A3)
    {

      /** Corps du module **/
    ;
    }

  int main(int argc, char *argv[])
    {
     srand(time(NULL));
     _Px1 =  34 ;
     Genarb ( & A1 , &_Px1) ;
     printf ( " %s", "LE PREMIER ARBRE GENERE ALEATOIREMENT:" ) ;
     Displayarb ( & A1 ) ;
     _Px2 =  34 ;
     Genarb ( & A2 , &_Px2) ;
     printf ( " %s", "LE DEUXIEME ARBRE GENERE ALEATOIREMENT:" ) ;
     Displayarb ( & A2 ) ;


      system("PAUSE");
      return 0;
    }
