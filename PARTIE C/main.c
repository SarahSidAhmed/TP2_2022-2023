  /**--------------------------------------------------------**/
  /**       C o n v e r s i o n   Z vers C (Standard)        **/
  /**             Réalisée par Pr D.E ZEGOUR                 **/
  /**             E S I - Alger                              **/
  /**             Copywrite 2014                             **/
  /**--------------------------------------------------------**/

  #include <stdio.h>
  #include <stdlib.h>
  #include <stdbool.h>
  #include <string.h>
  #include <Time.h>
  #define True 1
  #define False 0
  #define maxi 50

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


  /** Implémentation **\: PILE DE ARBRES BINAIRES DE ENTIERS**/
  /** Piles **/

  typedef Pointeur_Ai Typeelem_PAi ;
  typedef struct Maillon_PAi * Pointeur_PAi ;
  typedef   Pointeur_PAi  Typepile_PAi  ;

  struct Maillon_PAi
    {
      Typeelem_PAi  Val ;
      Pointeur_PAi Suiv ;
    } ;

  void Creerpile_PAi( Pointeur_PAi *P )
    { *P = NULL ; }

  bool Pilevide_PAi ( Pointeur_PAi P )
    { return  (P == NULL ); }

  void Empiler_PAi ( Pointeur_PAi *P,  Typeelem_PAi Val )
    {
      Pointeur_PAi Q;

      Q = (struct Maillon_PAi *) malloc( sizeof( struct Maillon_PAi))   ;
      Q->Val = Val ;
      Q->Suiv = *P;
      *P = Q;
    }

  void Depiler_PAi ( Pointeur_PAi *P,  Typeelem_PAi *Val )
    {
      Pointeur_PAi Sauv;

      if (! Pilevide_PAi (*P) )
        {
          *Val = (*P)->Val ;
          Sauv = *P;
          *P = (*P)->Suiv;
          free(Sauv);
        }
      else printf ("%s \n", "Pile vide");
    }
/** Implémentation **\: FILE DE ARBRES BINAIRES DE ENTIERS**/
  /** Files d'attente **/

  typedef Pointeur_Ai Typeelem_FAi ;
  typedef  struct Filedattente_FAi * Pointeur_FAi ;
  typedef  struct Maillon_FAi * Ptliste_FAi ;

  struct Maillon_FAi
    {
      Typeelem_FAi Val ;
      Ptliste_FAi Suiv  ;
    };

  struct Filedattente_FAi
    {
      Ptliste_FAi Tete, Queue ;
    };

  void Creerfile_FAi ( Pointeur_FAi *Fil   )
    {
      *Fil = (struct Filedattente_FAi *) malloc( sizeof( struct Filedattente_FAi)) ;
      (*Fil)->Tete = NULL ;
      (*Fil)->Queue = NULL ;
    }

  bool Filevide_FAi (Pointeur_FAi Fil  )
    { return  Fil->Tete == NULL ;}

  void Enfiler_FAi ( Pointeur_FAi Fil , Typeelem_FAi Val   )
    {
      Ptliste_FAi Q;

      Q = (struct Maillon_FAi *) malloc( sizeof( struct Maillon_FAi))   ;
      Q->Val = Val ;
      Q->Suiv = NULL;
      if ( ! Filevide_FAi(Fil) )
        Fil->Queue->Suiv = Q ;
      else Fil->Tete = Q;
        Fil->Queue = Q;
    }

  void Defiler_FAi (Pointeur_FAi Fil, Typeelem_FAi *Val )
    {
      if (! Filevide_FAi(Fil) )
        {
          *Val = Fil->Tete->Val ;
          Fil->Tete =  Fil->Tete->Suiv;
        }
      else printf ("%s \n", "File d'attente vide");
    }



  /** Variables du programme principal **/
  Pointeur_Ai A1=NULL;
  Pointeur_Ai A2=NULL;
  Pointeur_Ai A3=NULL;
  Pointeur_Ai P=NULL;
  Pointeur_Ai Q=NULL;
  Pointeur_PAi Stack=NULL;
  int N;
  int M;
  int I;
  int K;

  /** Fonctions standards **/

  int Aleanombre( int N )
    { return ( rand() % N ); }


  /** Prototypes des fonctions **/

  void Genarb (Pointeur_Ai *A , int *N);
  void Displayarb (Pointeur_Ai *A);
  bool  Insert (Pointeur_Ai *A , int *V) ;
  bool  Rechval (Pointeur_Ai *A , int *V , Pointeur_Ai *P , Pointeur_Ai *Q) ;
  void Rechvaldouble (Pointeur_Ai *A , int *V , Pointeur_Ai *P , Pointeur_Ai *Q);
  void Insertdouble (Pointeur_Ai *A , int *V);
  Pointeur_Ai Suiv_in (Pointeur_Ai *X , Pointeur_Ai *A) ;
  Pointeur_Ai Suivantpre (Pointeur_Ai *Q , Pointeur_Ai *A) ;
  void Prepre (Pointeur_Ai *A1 , Pointeur_Ai *A2 , Pointeur_Ai *A3);
  void Postpost (Pointeur_Ai *A1 , Pointeur_Ai *A2 , Pointeur_Ai *A3);
  Pointeur_Ai Father (Pointeur_Ai *X , Pointeur_Ai *A) ;
  Pointeur_Ai Suiv_post (Pointeur_Ai *X , Pointeur_Ai *A) ;
  void Erro (Pointeur_Ai *A);
  void Prepost (Pointeur_Ai *A1 , Pointeur_Ai *A2 , Pointeur_Ai *A3);
  void Inpre (Pointeur_Ai *A1 , Pointeur_Ai *A2 , Pointeur_Ai *A3);
  void Inpost (Pointeur_Ai *A1 , Pointeur_Ai *A2 , Pointeur_Ai *A3);
  int  Nbrn (Pointeur_Ai *A) ;
  bool  Inordre (Pointeur_Ai *A) ;
  bool  Verify (Pointeur_Ai *A , int *Noeud) ;

  /*---------MODULE GENERATION D'UN ARBRE DE ENTIER ALEATOIRE----------*/
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
  /*----------------------------------------------------------*/
  /*----------------------------------------------------------*/
  /*----------MODULE D'AFFICHAGE D'UN ARBRE-------------------*/
  void Displayarb (Pointeur_Ai *A)
    {
      /** Variables locales **/
      Pointeur_Ai _Px1=NULL;
      Pointeur_Ai _Px2=NULL;

      /** Corps du module **/
     if( *A != NULL)   {
       printf ( " %d", Info_Ai(*A) ) ;
       _Px1 =  Fg_Ai ( *A ) ;
       Displayarb ( &_Px1) ;
       _Px2 =  Fd_Ai ( *A ) ;
       Displayarb ( &_Px2) ;

     }
    }
  /*----------------------------------------------------------*/
  /*--------MODULE D'INSERTION - DOUBLE NON ACCEPTE-----------*/
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
  /*----------------------------------------------------------*/
  /*-----------MODULE DE RECHERCHE DANS UN ARBRE- DOUBLE NON ACCEPTE---*/
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

     return Rechval2 ;
    }
  /*----------------------------------------------------------*/
  /*--------MODULE DE RECHERCHE DANS UN ARBRE- DOUBLE INCLU---*/
  void Rechvaldouble (Pointeur_Ai *A , int *V , Pointeur_Ai *P , Pointeur_Ai *Q)
    {

      /** Corps du module **/
     *Q  =  NULL ;
     *P  =  *A ;
     while( ( ( *P != NULL ) )) {
       if( Info_Ai ( *P ) >= *V)   {
         *Q  =  *P ;
         *P  =  Fg_Ai ( *P ) ;
         }
       else
         {
         *Q  =  *P ;
         *P  =  Fd_Ai ( *P ) ;

       } ;

     } ;

    }
  /*---------------------------------------------------------*/
  /*-------MODULE D'INSERTION DANS UN ARB - DOUBLE INCLU-----*/
  void Insertdouble (Pointeur_Ai *A , int *V)
    {
      /** Variables locales **/
      Pointeur_Ai P=NULL;
      Pointeur_Ai Q=NULL;

      /** Corps du module **/
     Rechvaldouble ( & *A , & *V , & P , & Q ) ;
     Creernoeud_Ai (& P ) ;
     Aff_info_Ai ( P , *V ) ;
     if( Q == NULL)   {
       A3  =  P ;
       }
     else
       {
       if( Info_Ai ( Q ) >= *V)   {
         Aff_fg_Ai ( Q , P ) ;
         }
       else
         {
         Aff_fd_Ai ( Q , P ) ;

       } ;

     } ;

    }
  /*---------------------------------------------------------*/
  /*---------------------------------------------------------*/
  /*---------------------------------------------------------*/
  /*---------MODULE DE RECHERCHE DU SUIVANT INORDRE----------*/
  Pointeur_Ai Suiv_in (Pointeur_Ai *X , Pointeur_Ai *A)
    {
      /** Variables locales **/
      Pointeur_Ai Suiv_in2 =NULL;
      Pointeur_Ai Q=NULL;
      Pointeur_Ai P=NULL;
      bool Find;

      /** Corps du module **/
     P  =  *X ;
     if( ( Fd_Ai ( P ) != NULL ))   {
       Q  =  Fd_Ai ( P ) ;
       while( ( Fg_Ai ( Q ) != NULL ))  {
         Q  =  Fg_Ai ( Q ) ;

       } ;
       }
     else
       {
       P  =  *X ;
       Q  =  Father ( & P , & *A ) ;
       Find  =  False ;
       while( ( ( Find == False ) && ( Q != NULL ) ))  {
         if( ( P == Fg_Ai ( Q ) ))   {
           Find  =  True ;
           }
         else
           {
           P  =  Q ;
           Q  =  Father ( & Q , & *A ) ;

         } ;

       } ;

     } ;
     Suiv_in2  =  Q ;

     return Suiv_in2 ;
    }
  /*------MODULE DE RECHERCHE DU SUIVANT PREORDRE------------*/
  Pointeur_Ai Suivantpre (Pointeur_Ai *Q , Pointeur_Ai *A)
    {
      /** Variables locales **/
      Pointeur_Ai Suivantpre2 =NULL;
      Pointeur_Ai G=NULL;
      Pointeur_Ai D=NULL;
      Pointeur_Ai R=NULL;
      Pointeur_Ai Pre=NULL;
      bool Trouv;

      /** Corps du module **/
     if( Fg_Ai ( *Q ) != NULL)   {
       R  =  Fg_Ai ( *Q ) ;
       }
     else
       {
       if( ( Fd_Ai ( *Q ) != NULL ))   {
         R  =  Fd_Ai ( *Q ) ;
         }
       else
         {
         Pre  =  *Q ;
         R  =  Father ( & *Q , & *A ) ;
         G  =  Fg_Ai ( R ) ;
         D  =  Fd_Ai ( R ) ;
         while( ( ( ( G != Pre ) || ( D == NULL ) ) && ( R != NULL ) ))  {
           Pre  =  R ;
           R  =  Father ( & R , & *A ) ;
           if( ( R == NULL ))   {
             G  =  NULL ;
             D  =  NULL ;
             }
           else
             {
             G  =  Fg_Ai ( R ) ;
             D  =  Fd_Ai ( R ) ;

           } ;

         } ;
         if( ( R != NULL ))   {
           R  =  Fd_Ai ( R ) ;

         } ;

       } ;

     } ;
     Suivantpre2  =  R ;

     return Suivantpre2 ;
    }
  /*---------------------------------------------------------*/
  /*----------MODULE DE PARCOUR PRE PRE----------------------*/
  void Prepre (Pointeur_Ai *A1 , Pointeur_Ai *A2 , Pointeur_Ai *A3)
    {
      /** Variables locales **/
      Pointeur_Ai P=NULL;
      Pointeur_Ai Q=NULL;
      Pointeur_Ai R=NULL;
      int _Px1;
      int _Px2;
      int _Px3;
      int _Px4;

      /** Corps du module **/
     P  =  *A1 ;
     Q  =  *A2 ;
     if( ( Info_Ai ( Q ) < Info_Ai ( P ) ))   {
       Creernoeud_Ai (& R ) ;
       Aff_info_Ai ( R , Info_Ai ( Q ) ) ;
       *A3  =  R ;
       Q  =  Suivantpre ( & Q , & *A2 ) ;
       }
     else
       {
       Creernoeud_Ai (& R ) ;
       Aff_info_Ai ( R , Info_Ai ( P ) ) ;
       *A3  =  R ;
       P  =  Suivantpre ( & P , & *A1 ) ;

     } ;
     while( ( ( P != NULL ) && ( Q != NULL ) ))  {
       if( ( Info_Ai ( Q ) < Info_Ai ( P ) ))   {
         _Px1 =  Info_Ai ( Q ) ;
         Insertdouble ( & *A3 , &_Px1) ;
         Q  =  Suivantpre ( & Q , & *A2 ) ;
         }
       else
         {
         _Px2 =  Info_Ai ( P ) ;
         Insertdouble ( & *A3 , &_Px2) ;
         P  =  Suivantpre ( & P , & *A1 ) ;

       } ;

     } ;
     while( ( P != NULL ))  {
       _Px3 =  Info_Ai ( P ) ;
       Insertdouble ( & *A3 , &_Px3) ;
       P  =  Suivantpre ( & P , & *A1 ) ;

     } ;
     while( ( Q != NULL ))  {
       _Px4 =  Info_Ai ( Q ) ;
       Insertdouble ( & *A3 , &_Px4) ;
       Q  =  Suivantpre ( & Q , & *A2 ) ;

     } ;

    }
  /*---------------------------------------------------------*/
  /*-----MODULE DE PARCOUR POST POST--------------------------*/
  void Postpost (Pointeur_Ai *A1 , Pointeur_Ai *A2 , Pointeur_Ai *A3)
    {
      /** Variables locales **/
      Pointeur_Ai R=NULL;
      Pointeur_Ai P=NULL;
      Pointeur_Ai Q=NULL;
      int _Px1;
      int _Px2;
      int _Px3;
      int _Px4;

      /** Corps du module **/
     P  =  *A1 ;
     Q  =  *A2 ;
    /*INITIALISER LES POINTEURS A LA BONNE PLACE*/
     R  =  NULL ;
     while( ( P != NULL ))  {
       while( ( Fg_Ai ( P ) != NULL ))  {
         P  =  Fg_Ai ( P ) ;

       } ;
       R  =  P ;
       P  =  Fd_Ai ( P ) ;

     } ;
     P  =  R ;
     R  =  NULL ;
     while( ( Q != NULL ))  {
       while( ( Fg_Ai ( Q ) != NULL ))  {
         Q  =  Fg_Ai ( Q ) ;

       } ;
       R  =  Q ;
       Q  =  Fd_Ai ( Q ) ;

     } ;
     Q  =  R ;
     if( Info_Ai ( Q ) < Info_Ai ( P ))   {
       Creernoeud_Ai (& R ) ;
       Aff_info_Ai ( R , Info_Ai ( Q ) ) ;
       *A3  =  R ;
       Q  =  Suiv_post ( & Q , & *A2 ) ;
       }
     else
       {
       Creernoeud_Ai (& R ) ;
       Aff_info_Ai ( R , Info_Ai ( P ) ) ;
       *A3  =  R ;
       P  =  Suiv_post ( & P , & *A1 ) ;

     } ;
     while( ( ( P != NULL ) && ( Q != NULL ) ))  {
       if( ( Info_Ai ( Q ) < Info_Ai ( P ) ))   {
         _Px1 =  Info_Ai ( Q ) ;
         Insertdouble ( & *A3 , &_Px1) ;
         Q  =  Suiv_post ( & Q , & *A2 ) ;
         }
       else
         {
         _Px2 =  Info_Ai ( P ) ;
         Insertdouble ( & *A3 , &_Px2) ;
         P  =  Suiv_post ( & P , & *A1 ) ;

       } ;

     } ;
     while( ( P != NULL ))  {
       _Px3 =  Info_Ai ( P ) ;
       Insertdouble ( & *A3 , &_Px3) ;
       P  =  Suiv_post ( & P , & *A1 ) ;

     } ;
     while( ( Q != NULL ))  {
       _Px4 =  Info_Ai ( Q ) ;
       Insertdouble ( & *A3 , &_Px4) ;
       Q  =  Suiv_post ( & Q , & *A2 ) ;

     } ;

    }
  /*----------FONCTION QUI RETOURNE LE PERE DU NOEUD------*/
  Pointeur_Ai Father (Pointeur_Ai *X , Pointeur_Ai *A)
    {
      /** Variables locales **/
      Pointeur_Ai Father2 =NULL;
      Pointeur_Ai P=NULL;

      /** Corps du module **/
     P  =  *A ;
     Q  =  NULL ;
     while( ( P != *X ))  {
       Q  =  P ;
       if( ( Info_Ai ( *X ) < Info_Ai ( P ) ))   {
         P  =  Fg_Ai ( P ) ;
         }
       else
         {
         P  =  Fd_Ai ( P ) ;

       } ;

     } ;
     Father2  =  Q ;

     return Father2 ;
    }
  /*-------MODULE DE RECHERCHE DU SUIVANT POSTORDRE---------*/
  Pointeur_Ai Suiv_post (Pointeur_Ai *X , Pointeur_Ai *A)
    {
      /** Variables locales **/
      Pointeur_Ai Suiv_post2 =NULL;
      Pointeur_Ai P=NULL;
      Pointeur_Ai R=NULL;
      Pointeur_Ai Q=NULL;

      /** Corps du module **/
     P  =  *A ;
     Q  =  NULL ;
     while( ( P != *X ))  {
       Q  =  P ;
       if( ( Info_Ai ( *X ) <= Info_Ai ( P ) ))   {
         P  =  Fg_Ai ( P ) ;
         }
       else
         {
         P  =  Fd_Ai ( P ) ;

       } ;

     } ;
     if( ( Q == NULL ))   {
       Suiv_post2  =  Q ;
       }
     else
       {
       if( ( ( Fd_Ai ( Q ) == *X ) || ( Fd_Ai ( Q ) == NULL ) ))   {
         Suiv_post2  =  Q ;
         }
       else
         {
         P  =  Fd_Ai ( Q ) ;
         while( ( P != NULL ))  {
           while( ( Fg_Ai ( P ) != NULL ))  {
             P  =  Fg_Ai ( P ) ;

           } ;
           R  =  P ;
           P  =  Fd_Ai ( P ) ;

         } ;
         Suiv_post2  =  R ;

       } ;

     } ;

     return Suiv_post2 ;
    }
  /*================module pour tester le suivin=========================*/
  void Erro (Pointeur_Ai *A)
    {
      /** Variables locales **/
      Pointeur_Ai P=NULL;

      /** Corps du module **/
     P  =  *A ;
     while( ( Suivantpre ( & P , & *A ) != NULL ))  {
       printf ( " %d", Info_Ai(P) ) ;
       P  =  Suivantpre ( & P , & *A ) ;

     } ;
     printf ( " %d", Info_Ai(P) ) ;

    }
  /*---------------------------------------------------------*/
  /*-----MODULE DE PARCOUR PRE POST--------------------------*/
  void Prepost (Pointeur_Ai *A1 , Pointeur_Ai *A2 , Pointeur_Ai *A3)
    {
      /** Variables locales **/
      Pointeur_Ai R=NULL;
      Pointeur_Ai P=NULL;
      Pointeur_Ai Q=NULL;
      int _Px1;
      int _Px2;
      int _Px3;
      int _Px4;

      /** Corps du module **/
     P  =  *A1 ;
     Q  =  *A2 ;
     R  =  NULL ;
     while( ( Q != NULL ))  {
       while( ( Fg_Ai ( Q ) != NULL ))  {
         Q  =  Fg_Ai ( Q ) ;

       } ;
       R  =  Q ;
       Q  =  Fd_Ai ( Q ) ;

     } ;
     Q  =  R ;
     R  =  NULL ;
     if( ( Info_Ai ( Q ) < Info_Ai ( P ) ))   {
       Creernoeud_Ai (& R ) ;
       Aff_info_Ai ( R , Info_Ai ( Q ) ) ;
       *A3  =  R ;
       Q  =  Suiv_post ( & Q , & *A2 ) ;
       }
     else
       {
       Creernoeud_Ai (& R ) ;
       Aff_info_Ai ( R , Info_Ai ( P ) ) ;
       *A3  =  R ;
       P  =  Suivantpre ( & P , & *A1 ) ;

     } ;
     while( ( ( P != NULL ) && ( Q != NULL ) ))  {
       if( ( Info_Ai ( Q ) < Info_Ai ( P ) ))   {
         _Px1 =  Info_Ai ( Q ) ;
         Insertdouble ( & *A3 , &_Px1) ;
         Q  =  Suiv_post ( & Q , & *A2 ) ;
         }
       else
         {
         _Px2 =  Info_Ai ( P ) ;
         Insertdouble ( & *A3 , &_Px2) ;
         P  =  Suivantpre ( & P , & *A1 ) ;

       } ;

     } ;
     while( ( P != NULL ))  {
       _Px3 =  Info_Ai ( P ) ;
       Insertdouble ( & *A3 , &_Px3) ;
       P  =  Suivantpre ( & P , & *A1 ) ;

     } ;
     while( ( Q != NULL ))  {
       _Px4 =  Info_Ai ( Q ) ;
       Insertdouble ( & *A3 , &_Px4) ;
       Q  =  Suiv_post ( & Q , & *A2 ) ;

     } ;

    }
  /*---------------------------------------------------------*/
  /*-----MODULE DE PARCOUR INORDRE PRE----------------------*/
  void Inpre (Pointeur_Ai *A1 , Pointeur_Ai *A2 , Pointeur_Ai *A3)
    {
      /** Variables locales **/
      Pointeur_Ai R=NULL;
      Pointeur_Ai P=NULL;
      Pointeur_Ai Q=NULL;
      int _Px1;
      int _Px2;
      int _Px3;
      int _Px4;

      /** Corps du module **/
     P  =  *A1 ;
     Q  =  *A2 ;
     while( Fg_Ai ( Q ) != NULL)  {
       Q  =  Fg_Ai ( Q ) ;

     } ;
     if( ( Info_Ai ( Q ) < Info_Ai ( P ) ))   {
       Creernoeud_Ai (& R ) ;
       Aff_info_Ai ( R , Info_Ai ( Q ) ) ;
       *A3  =  R ;
       Q  =  Suiv_in ( & Q , & *A2 ) ;
       }
     else
       {
       Creernoeud_Ai (& R ) ;
       Aff_info_Ai ( R , Info_Ai ( P ) ) ;
       *A3  =  R ;
       P  =  Suivantpre ( & P , & *A1 ) ;

     } ;
     while( ( ( P != NULL ) && ( Q != NULL ) ))  {
       if( ( Info_Ai ( Q ) < Info_Ai ( P ) ))   {
         _Px1 =  Info_Ai ( Q ) ;
         Insertdouble ( & *A3 , &_Px1) ;
         Q  =  Suiv_in ( & Q , & *A2 ) ;
         }
       else
         {
         _Px2 =  Info_Ai ( P ) ;
         Insertdouble ( & *A3 , &_Px2) ;
         P  =  Suivantpre ( & P , & *A1 ) ;

       } ;

     } ;
     while( ( P != NULL ))  {
       _Px3 =  Info_Ai ( P ) ;
       Insertdouble ( & *A3 , &_Px3) ;
       P  =  Suivantpre ( & P , & *A1 ) ;

     } ;
     while( ( Q != NULL ))  {
       _Px4 =  Info_Ai ( Q ) ;
       Insertdouble ( & *A3 , &_Px4) ;
       Q  =  Suiv_in ( & Q , & *A2 ) ;

     } ;

    }
  /*---------------------------------------------------------*/
  /*------MODULE DE PARCOUR INORDRE POST---------------------*/
  void Inpost (Pointeur_Ai *A1 , Pointeur_Ai *A2 , Pointeur_Ai *A3)
    {
      /** Variables locales **/
      Pointeur_Ai R=NULL;
      Pointeur_Ai P=NULL;
      Pointeur_Ai Q=NULL;
      int _Px1;
      int _Px2;
      int _Px3;
      int _Px4;

      /** Corps du module **/
     P  =  *A1 ;
     Q  =  *A2 ;
     while( Fg_Ai ( Q ) != NULL)  {
       Q  =  Fg_Ai ( Q ) ;

     } ;
     R  =  NULL ;
     while( ( P != NULL ))  {
       while( ( Fg_Ai ( P ) != NULL ))  {
         P  =  Fg_Ai ( P ) ;

       } ;
       R  =  P ;
       P  =  Fd_Ai ( P ) ;

     } ;
     P  =  R ;
     if( Info_Ai ( Q ) < Info_Ai ( P ))   {
       Creernoeud_Ai (& R ) ;
       Aff_info_Ai ( R , Info_Ai ( Q ) ) ;
       *A3  =  R ;
       Q  =  Suiv_in ( & Q , & *A2 ) ;
       }
     else
       {
       Creernoeud_Ai (& R ) ;
       Aff_info_Ai ( R , Info_Ai ( P ) ) ;
       *A3  =  R ;
       P  =  Suiv_post ( & P , & *A1 ) ;

     } ;
     while( ( ( P != NULL ) && ( Q != NULL ) ))  {
       if( ( Info_Ai ( Q ) < Info_Ai ( P ) ))   {
         _Px1 =  Info_Ai ( Q ) ;
         Insertdouble ( & *A3 , &_Px1) ;
         Q  =  Suiv_in ( & Q , & *A2 ) ;
         }
       else
         {
         _Px2 =  Info_Ai ( P ) ;
         Insertdouble ( & *A3 , &_Px2) ;
         P  =  Suiv_post ( & P , & *A1 ) ;

       } ;

     } ;
     while( ( P != NULL ))  {
       _Px3 =  Info_Ai ( P ) ;
       Insertdouble ( & *A3 , &_Px3) ;
       P  =  Suiv_post ( & P , & *A1 ) ;

     } ;
     while( ( Q != NULL ))  {
       _Px4 =  Info_Ai ( Q ) ;
       Insertdouble ( & *A3 , &_Px4) ;
       Q  =  Suiv_in ( & Q , & *A2 ) ;

     } ;

    }
  /*---------------------------------------------------------*/
  /*----PROGRAMME DE VERIFICATION DES RESULTATS--------------*/
  /*---------------------------------------------------------*/
  int  Nbrn (Pointeur_Ai *A)
    {
      /** Variables locales **/
      int  Nbrn2 ;
      Pointeur_Ai _Px1=NULL;
      Pointeur_Ai _Px2=NULL;

      /** Corps du module **/
     if( ( *A == NULL ))   {
       Nbrn2  =  0 ;
       }
     else
       {
       _Px1 =  Fg_Ai ( *A ) ;
       _Px2 =  Fd_Ai ( *A ) ;
       Nbrn2  =  1 + Nbrn ( &_Px1) + Nbrn ( &_Px2) ;

     } ;

     return Nbrn2 ;
    }
  /*---------------------------------------------------------*/
  /*-------MODULE DE PARCOUR INORDRE DANS UN ARBRE-----------*/
  /*----IDEE: SI L'ARBRE EST STRUCTURE CORRECTEMENT LE-------*/
  /*--PARCOUR INORDRE NOUS DONNE LES INFOS DES NOEUDS EN-----*/
  /*---ORDRE CROISSANT---------------------------------------*/
  bool  Inordre (Pointeur_Ai *A)
    {
      /** Variables locales **/
      bool  Inordre2 ;
      Pointeur_Ai R=NULL;
      Pointeur_Ai Q=NULL;
      Pointeur_Ai _Px1=NULL;
      Pointeur_Ai _Px2=NULL;

      /** Corps du module **/
     if( ( ( Info_Ai ( *A ) > Info_Ai ( Fg_Ai ( *A ) ) ) || ( Info_Ai ( *A ) < Info_Ai ( Fd_Ai ( *A ) ) ) ))   {
       Inordre2  =  True ;
       }
     else
       {
       _Px1 =  Fg_Ai ( *A ) ;
       _Px2 =  Fd_Ai ( *A ) ;
       Inordre2  =  Inordre ( &_Px1) && Inordre ( &_Px2) ;

     } ;

     return Inordre2 ;
    }
  /*----------MODULE COMPLET DE VERIFICATION-------*/
  /*-----------------------------------------------*/
  bool  Verify (Pointeur_Ai *A , int *Noeud)
    {
      /** Variables locales **/
      bool  Verify2 ;
      int N;

      /** Corps du module **/
     N  =  *Noeud * 2 ;
     if( Nbrn ( & *A ) != N)   {
       Verify2  =  False ;
       }
     else
       {
       Verify2  =  Inordre ( & *A ) ;

     } ;

     return Verify2 ;
    }
//-------------------------------------------------
//-----MODULES ET STRUCTURES D'ANALYSE-------------
//STRUCTURE D'UN PARCOUR-------
struct parcour{
int haut[50]; //tableau de hauteur de chaque arbre generé du parcour
int niveau[50][49]; //tableau de niveau d'un arbre generé du parcour
float perniv[50]; //tableau du pourcentage nombre de noeuds par niveau de chaque arbre generé du parcour
int minhaut;
int maxhaut;
};

//MODULE QUI TROUVE LE MIN DANS UN TABLEAU D'ENTIER
int MINTAB1D(int tab[maxi], int tai){
int m=tab[1];
int i;
for (i=1; i<=tai-1; i++){
    if (m>tab[i]) m=tab[i];
}
return m;
}
//MODULE QUI TROUVE LE MAX DANS UN TABLEAU D'ENTIER
 int MAXTAB1D(int tab[maxi], int tai){
int m=tab[1];
int i;
for (i=1; i<=tai-1; i++){
    if (m<tab[i]) m=tab[i];
}
return m;
}
//MODULE DE PUISSANCE
float puiss(int x, int e){
int i;
int p=1;
if(e==0) return 1;
else{
    for (i=1; i<=e; i++){
        p=p*x;
    }
    return p;
}
}
//MODULE DE CALCULE DE PROFONDEUR D'UN ARBRE
int prof(Pointeur_Ai A){
int f;
if (A==NULL) f=-1.0;
else{
    f=max(prof(Fd_Ai(A)), prof(Fg_Ai(A)))+1;
}
return f;
}
//MODULE DE MAX ENTRE DEUX NOMBRES
int max(int x, int y){
if (x>y) return x;
else return y;
}
//MODULE QUI COMPTE LE NOMBRES DE NOEUDS PAR NIVEAU
//--!!L'idée de ce module est d'enfiler les peres prochain niveau tout en comptant le nombre de noeuds enfiler avant
void niv(Pointeur_Ai *A, Pointeur_FAi *F, struct parcour *type, int indice){
int i=0, cpt=1, n=0;
int k;
float per=0;
Pointeur_Ai P=*A;
Enfiler_FAi(*F, *A);
while ((Filevide_FAi(*F)==false)){
    i++;
    k=1;

    while(k<=cpt){
        Defiler_FAi(*F,&*A);
        if(Fd_Ai(*A)!=NULL){
            Enfiler_FAi(*F, Fd_Ai(*A));
            n++;
        }
        if(Fg_Ai(*A)!=NULL){
            Enfiler_FAi(*F, Fg_Ai(*A));
            n++;
        }
        k++;
    }
    if (n!=0){
    type->niveau[indice][i]=n;
    per= per+(n/puiss(2,i));
   }
    cpt=n;
    n=0;
}

per=per/prof(P);
type->perniv[indice]=per*100;
type->haut[indice]=prof(P);

}
//MODULE D'AFFICHAGE DANS UN FICHIER DES DONNÉES DU TYPE DE PARCOUR
void afficher(struct parcour type, int tai, int M){
    int i, k;
    FILE *outfile;
    outfile=fopen("OUT_DATA.txt", "a");
    //AFFICHAGE DES NOMBRES DE NOEUDS PAR NIVEAU DE CHAQUE ARBRE
    fprintf(outfile, "LE PARCOUR: ");
  for(i=1; i<=M;i++){
        fprintf(outfile, "ARBRE %d: ", i);
    for(k=1; k<type.haut[i]; k++){
       fprintf(outfile, "Niveau %d: %d\n", k, type.niveau[i][k]);
    }
      fprintf(outfile, "___Hauteur: %d\n", type.haut[i]);
      fprintf(outfile, "___Pourcentage de complitude: %.2f\n\n", type.perniv[i]);
  }
  fprintf(outfile, "Hauteur max: %d\nHauteur Min: %d\n\n\n", type.maxhaut, type.minhaut);
fprintf(outfile,"EXCEL DATA FORM:");
for(i=1; i<=type.haut[i]; i++){
    fprintf(outfile, "%.2f,", type.perniv[i]);
}
fprintf(outfile, "\n--------------------\n\n\n");
fclose(outfile);

}
//MODULE DE LIBÉRATION DES ARBRE
void libererarb(Pointeur_Ai *A){
Pointeur_Ai P=NULL;
Pointeur_Ai Q=NULL;
if(*A!=NULL){
P=Fd_Ai(*A);
Q=Fg_Ai(*A);
libererarb(&P);
libererarb(&Q);
Liberernoeud_Ai(*A);
*A=NULL;
}
}
//-----PROGRAMME PRINCIPAL-------
Pointeur_FAi *F=NULL;
  int main(int argc, char *argv[])
    {
    Pointeur_FAi F;
    Creerfile_FAi(&F);
    struct parcour prpr, popo, inpo, inpr, prpo;
     srand(time(NULL));
     N  =  100;
    /*Varible du nombre de noeud*/
     M  =  10;
    /*Varible de nombre d'occuration*/
     for( I  =  1 ;I <=  M ; ++I) {
       A1  =  NULL ;
       A2  =  NULL ;
       A3  =  NULL ;
       P=NULL;
       Genarb ( & A1 , & N ) ;
       Genarb ( & A2 , & N ) ;
       for( K  =  1 ;K <=  5 ; ++K) {
         if( K == 1)   {
           Inpre ( & A1 , & A2 , & A3 ) ;
           P=A3;
            niv(&P,&F,&inpr,I );
         } ;
        if( K == 2)   {
           Inpost ( & A1 , & A2 , & A3 ) ;
                    P=A3;
         niv(&P,&F,&inpo,I);

         } ;
         if( K == 3)   {
           Prepre ( & A1 , & A2 , & A3 ) ;
            P=A3;
         niv(&P,&F,&prpr,I );
         } ;
         if( K == 4)   {
           Postpost ( & A1 , & A2 , & A3 ) ;
           P=A3;
         niv(&P,&F,&popo,I );
         } ;
         if( K == 5)   {
           Prepost ( & A1 , & A2 , & A3 ) ;
           P=A3;
         niv(&P,&F,&prpo,I );
         } ;
         if( Verify ( & A3 , & N ) == True)   {
           printf ( "%s\n", "VERIFICATION RESULT: PASS" ) ;
           }
         else
           {
           printf ( "%s\n", "VERIFICATION RESULT: ERROR" ) ;

         } ;

       } ;
    //LIBERATION DE LA MEMOIRE
    libererarb(&A1);
    libererarb(&A2);
    libererarb(&A3);
     } ;
     //AFFECTATION DES HAUTEURS DES ARBRE DANS LA STRUCTURE PARCOUR ADÉQUATE
    prpr.maxhaut=MAXTAB1D(prpr.haut, N-1);
    prpr.minhaut=MINTAB1D(prpr.haut, N-1);
    popo.maxhaut=MAXTAB1D(popo.haut, N-1);
    popo.minhaut=MINTAB1D(popo.haut, N-1);
    inpr.maxhaut=MAXTAB1D(inpr.haut, N-1);
    inpr.minhaut=MINTAB1D(inpr.haut, N-1);
    inpo.maxhaut=MAXTAB1D(inpo.haut, N-1);
    inpo.minhaut=MINTAB1D(inpo.haut, N-1);
    prpo.maxhaut=MAXTAB1D(prpo.haut, N-1);
    prpo.minhaut=MINTAB1D(prpo.haut, N-1);
    //WRITING IN THE DATA_OUT FILE
   afficher(inpr, N, M);
   afficher(inpo, N, M);
   afficher(prpr, N, M);
   afficher(popo, N, M);
   afficher(prpo, N, M);
   printf("\n\nYou will find the data of your simulation in the file named: ***OUT_DATA***\n\n");
   printf("\n\n--------!! Please note: before running a new simulation delete the OUT_DATA file to avoid any error in the displays-----\n\n");
      system("PAUSE");
      return 0;
    }
