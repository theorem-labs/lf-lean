-- Comprehensive Lean translation for all required isomorphisms
set_option linter.all false

-- ============================================================
-- Basic Types
-- ============================================================

-- Custom bool to avoid Lean stdlib issues
inductive Stdlib_bool : Type where
  | true : Stdlib_bool
  | false : Stdlib_bool

def Stdlib_bool_true := Stdlib_bool.true
def Stdlib_bool_false := Stdlib_bool.false

-- Alias for bool (using Coq_bool to avoid conflict)
def Coq_bool := Stdlib_bool
def Coq_bool_true := Stdlib_bool.true
def Coq_bool_false := Stdlib_bool.false

-- Custom nat
inductive nat : Type where
  | O : nat
  | S : nat → nat

def _0 : nat := nat.O
def S : nat → nat := nat.S

-- Addition on nat
def Nat_add : nat → nat → nat
  | nat.O, m => m
  | nat.S p, m => nat.S (Nat_add p m)

-- Subtraction on nat
def Nat_sub : nat → nat → nat
  | n, nat.O => n
  | nat.O, nat.S _ => nat.O
  | nat.S n, nat.S m => Nat_sub n m

-- Multiplication on nat
def Nat_mul : nat → nat → nat
  | nat.O, _ => nat.O
  | nat.S n, m => Nat_add m (Nat_mul n m)

-- Predecessor
def Nat_pred : nat → nat
  | nat.O => nat.O
  | nat.S n => n

-- Nat equality
def Nat_eqb : nat → nat → Stdlib_bool
  | nat.O, nat.O => Stdlib_bool.true
  | nat.S n, nat.S m => Nat_eqb n m
  | _, _ => Stdlib_bool.false

-- Nat less-than-or-equal
def Nat_leb : nat → nat → Stdlib_bool
  | nat.O, _ => Stdlib_bool.true
  | nat.S _, nat.O => Stdlib_bool.false
  | nat.S n, nat.S m => Nat_leb n m

-- Bool operations
def negb : Stdlib_bool → Stdlib_bool
  | Stdlib_bool.true => Stdlib_bool.false
  | Stdlib_bool.false => Stdlib_bool.true

def andb : Stdlib_bool → Stdlib_bool → Stdlib_bool
  | Stdlib_bool.true, b => b
  | Stdlib_bool.false, _ => Stdlib_bool.false

def orb : Stdlib_bool → Stdlib_bool → Stdlib_bool
  | Stdlib_bool.true, _ => Stdlib_bool.true
  | Stdlib_bool.false, b => b

def Bool_eqb : Stdlib_bool → Stdlib_bool → Stdlib_bool
  | Stdlib_bool.true, Stdlib_bool.true => Stdlib_bool.true
  | Stdlib_bool.false, Stdlib_bool.false => Stdlib_bool.true
  | _, _ => Stdlib_bool.false

-- ============================================================
-- Ascii and String
-- ============================================================

-- Custom ascii (8 bools)
inductive Ascii_ascii : Type where
  | Ascii : Stdlib_bool → Stdlib_bool → Stdlib_bool → Stdlib_bool → Stdlib_bool → Stdlib_bool → Stdlib_bool → Stdlib_bool → Ascii_ascii

def Ascii_Ascii := Ascii_ascii.Ascii

-- Ascii equality
def Ascii_eqb : Ascii_ascii → Ascii_ascii → Stdlib_bool
  | Ascii_ascii.Ascii b0 b1 b2 b3 b4 b5 b6 b7, Ascii_ascii.Ascii c0 c1 c2 c3 c4 c5 c6 c7 =>
    andb (Bool_eqb b0 c0)
      (andb (Bool_eqb b1 c1)
        (andb (Bool_eqb b2 c2)
          (andb (Bool_eqb b3 c3)
            (andb (Bool_eqb b4 c4)
              (andb (Bool_eqb b5 c5)
                (andb (Bool_eqb b6 c6)
                  (Bool_eqb b7 c7)))))))

-- Custom string
inductive String_string : Type where
  | EmptyString : String_string
  | String : Ascii_ascii → String_string → String_string

def String_EmptyString := String_string.EmptyString
def String_String := String_string.String

-- String equality
def String_eqb : String_string → String_string → Stdlib_bool
  | String_string.EmptyString, String_string.EmptyString => Stdlib_bool.true
  | String_string.String c1 s1, String_string.String c2 s2 =>
    andb (Ascii_eqb c1 c2) (String_eqb s1 s2)
  | _, _ => Stdlib_bool.false

-- ============================================================
-- Prop-level types
-- ============================================================

-- Equality in Prop (for Type arguments)
inductive Corelib_Init_Logic_eq {A : Type} : A → A → Prop where
  | refl (a : A) : Corelib_Init_Logic_eq a a

def Corelib_Init_Logic_eq_refl (A : Type) (a : A) : Corelib_Init_Logic_eq a a :=
  Corelib_Init_Logic_eq.refl a

-- Equality in Prop (for Prop arguments)
inductive Corelib_Init_Logic_eq_Prop {A : Prop} : A → A → Prop where
  | refl (a : A) : Corelib_Init_Logic_eq_Prop a a

def Corelib_Init_Logic_eq_Prop_refl (A : Prop) (a : A) : Corelib_Init_Logic_eq_Prop a a :=
  Corelib_Init_Logic_eq_Prop.refl a

-- MyTrue (maps to Coq's True)
inductive MyTrue : Prop where
  | intro : MyTrue

def MyTrue_intro : MyTrue := MyTrue.intro

-- MyFalse (maps to Coq's False)
inductive MyFalse : Prop where

-- not
def Logic_not (P : Prop) : Prop := P → MyFalse

-- iff
structure iff (A B : Prop) : Prop where
  mp : A → B
  mpr : B → A

-- ex (existential)
inductive ex {A : Type} (P : A → Prop) : Prop where
  | intro (x : A) (h : P x) : ex P

-- prod
inductive prod (A B : Type) : Type where
  | pair : A → B → prod A B

def prod_pair := @prod.pair

-- list (stdlib version)
inductive list (A : Type) : Type where
  | nil : list A
  | cons : A → list A → list A

def nil := @list.nil
def cons := @list.cons

-- ============================================================
-- Original.LF_DOT_Basics definitions
-- ============================================================

inductive Original_LF__DOT__Basics_LF_Basics_bool : Type where
  | true : Original_LF__DOT__Basics_LF_Basics_bool
  | false : Original_LF__DOT__Basics_LF_Basics_bool

def Original_LF__DOT__Basics_LF_Basics_true : Original_LF__DOT__Basics_LF_Basics_bool :=
  Original_LF__DOT__Basics_LF_Basics_bool.true

def Original_LF__DOT__Basics_LF_Basics_false : Original_LF__DOT__Basics_LF_Basics_bool :=
  Original_LF__DOT__Basics_LF_Basics_bool.false

-- negb for Basics bool
def Original_LF__DOT__Basics_LF_Basics_negb (b : Original_LF__DOT__Basics_LF_Basics_bool) : Original_LF__DOT__Basics_LF_Basics_bool :=
  match b with
  | .true => .false
  | .false => .true

-- even function
def Original_LF__DOT__Basics_LF_Basics_even : nat → Original_LF__DOT__Basics_LF_Basics_bool
  | nat.O => .true
  | nat.S nat.O => .false
  | nat.S (nat.S n') => Original_LF__DOT__Basics_LF_Basics_even n'

-- odd function
def Original_LF__DOT__Basics_LF_Basics_odd (n : nat) : Original_LF__DOT__Basics_LF_Basics_bool :=
  Original_LF__DOT__Basics_LF_Basics_negb (Original_LF__DOT__Basics_LF_Basics_even n)

-- ============================================================
-- Original.LF_DOT_Poly definitions (polymorphic list)
-- ============================================================

inductive Original_LF__DOT__Poly_LF_Poly_list (X : Type) : Type where
  | nil : Original_LF__DOT__Poly_LF_Poly_list X
  | cons : X → Original_LF__DOT__Poly_LF_Poly_list X → Original_LF__DOT__Poly_LF_Poly_list X

def Original_LF__DOT__Poly_LF_Poly_nil (X : Type) : Original_LF__DOT__Poly_LF_Poly_list X :=
  Original_LF__DOT__Poly_LF_Poly_list.nil

def Original_LF__DOT__Poly_LF_Poly_cons (X : Type) : X → Original_LF__DOT__Poly_LF_Poly_list X → Original_LF__DOT__Poly_LF_Poly_list X :=
  Original_LF__DOT__Poly_LF_Poly_list.cons

def Original_LF__DOT__Poly_LF_Poly_app (X : Type) : Original_LF__DOT__Poly_LF_Poly_list X → Original_LF__DOT__Poly_LF_Poly_list X → Original_LF__DOT__Poly_LF_Poly_list X
  | Original_LF__DOT__Poly_LF_Poly_list.nil, l2 => l2
  | Original_LF__DOT__Poly_LF_Poly_list.cons h t, l2 => Original_LF__DOT__Poly_LF_Poly_list.cons h (Original_LF__DOT__Poly_LF_Poly_app X t l2)

-- prod type for Poly
inductive Original_LF__DOT__Poly_LF_Poly_prod (X Y : Type) : Type where
  | pair : X → Y → Original_LF__DOT__Poly_LF_Poly_prod X Y

def Original_LF__DOT__Poly_LF_Poly_pair (X Y : Type) (x : X) (y : Y) : Original_LF__DOT__Poly_LF_Poly_prod X Y :=
  Original_LF__DOT__Poly_LF_Poly_prod.pair x y

-- length function
def Original_LF__DOT__Poly_LF_Poly_length (X : Type) : Original_LF__DOT__Poly_LF_Poly_list X → nat
  | Original_LF__DOT__Poly_LF_Poly_list.nil => nat.O
  | Original_LF__DOT__Poly_LF_Poly_list.cons _ t => nat.S (Original_LF__DOT__Poly_LF_Poly_length X t)

-- filter function
def Original_LF__DOT__Poly_LF_Poly_filter (X : Type) (test : X → Original_LF__DOT__Basics_LF_Basics_bool) : Original_LF__DOT__Poly_LF_Poly_list X → Original_LF__DOT__Poly_LF_Poly_list X
  | Original_LF__DOT__Poly_LF_Poly_list.nil => Original_LF__DOT__Poly_LF_Poly_list.nil
  | Original_LF__DOT__Poly_LF_Poly_list.cons h t =>
    match test h with
    | Original_LF__DOT__Basics_LF_Basics_bool.true => Original_LF__DOT__Poly_LF_Poly_list.cons h (Original_LF__DOT__Poly_LF_Poly_filter X test t)
    | Original_LF__DOT__Basics_LF_Basics_bool.false => Original_LF__DOT__Poly_LF_Poly_filter X test t

-- repeat function
def Original_LF__DOT__Poly_LF_Poly_repeat (X : Type) (x : X) : nat → Original_LF__DOT__Poly_LF_Poly_list X
  | nat.O => Original_LF__DOT__Poly_LF_Poly_list.nil
  | nat.S count' => Original_LF__DOT__Poly_LF_Poly_list.cons x (Original_LF__DOT__Poly_LF_Poly_repeat X x count')

-- countoddmembers' function
def Original_LF__DOT__Poly_LF_Poly_countoddmembers' (l : Original_LF__DOT__Poly_LF_Poly_list nat) : nat :=
  Original_LF__DOT__Poly_LF_Poly_length nat (Original_LF__DOT__Poly_LF_Poly_filter nat Original_LF__DOT__Basics_LF_Basics_odd l)

-- split function (Admitted in Original.v, so axiom)
axiom Original_LF__DOT__Poly_LF_Poly_split : ∀ (X Y : Type),
  Original_LF__DOT__Poly_LF_Poly_list (Original_LF__DOT__Poly_LF_Poly_prod X Y) →
  Original_LF__DOT__Poly_LF_Poly_prod (Original_LF__DOT__Poly_LF_Poly_list X) (Original_LF__DOT__Poly_LF_Poly_list Y)

-- filter_even_gt7 (Admitted in Original.v, so axiom)
axiom Original_LF__DOT__Poly_LF_Poly_filter__even__gt7 : Original_LF__DOT__Poly_LF_Poly_list nat → Original_LF__DOT__Poly_LF_Poly_list nat

-- test_countoddmembers'2: countoddmembers' [0;2;4] = 0 (Admitted in Original.v)
axiom Original_LF__DOT__Poly_LF_Poly_test__countoddmembers'2 :
  Corelib_Init_Logic_eq
    (Original_LF__DOT__Poly_LF_Poly_countoddmembers'
      (Original_LF__DOT__Poly_LF_Poly_list.cons nat.O
        (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S nat.O))
          (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S (nat.S nat.O))))
            Original_LF__DOT__Poly_LF_Poly_list.nil))))
    nat.O

-- test_filter_even_gt7_2: filter_even_gt7 [5;2;6;19;129] = [] (Admitted in Original.v)
axiom Original_LF__DOT__Poly_LF_Poly_test__filter__even__gt7__2 :
  Corelib_Init_Logic_eq
    (Original_LF__DOT__Poly_LF_Poly_filter__even__gt7
      (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S (nat.S (nat.S nat.O)))))
        (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S nat.O))
          (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S nat.O))))))
            (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S nat.O)))))))))))))))))))
              (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S nat.O)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
                Original_LF__DOT__Poly_LF_Poly_list.nil))))))
    Original_LF__DOT__Poly_LF_Poly_list.nil

-- test_split (Admitted in Original.v)
axiom Original_LF__DOT__Poly_LF_Poly_test__split :
  Corelib_Init_Logic_eq
    (Original_LF__DOT__Poly_LF_Poly_split nat Original_LF__DOT__Basics_LF_Basics_bool
      (Original_LF__DOT__Poly_LF_Poly_list.cons (Original_LF__DOT__Poly_LF_Poly_prod.pair (nat.S nat.O) Original_LF__DOT__Basics_LF_Basics_bool.false)
        (Original_LF__DOT__Poly_LF_Poly_list.cons (Original_LF__DOT__Poly_LF_Poly_prod.pair (nat.S (nat.S nat.O)) Original_LF__DOT__Basics_LF_Basics_bool.false)
          Original_LF__DOT__Poly_LF_Poly_list.nil)))
    (Original_LF__DOT__Poly_LF_Poly_prod.pair
      (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S nat.O) (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S nat.O)) Original_LF__DOT__Poly_LF_Poly_list.nil))
      (Original_LF__DOT__Poly_LF_Poly_list.cons Original_LF__DOT__Basics_LF_Basics_bool.false (Original_LF__DOT__Poly_LF_Poly_list.cons Original_LF__DOT__Basics_LF_Basics_bool.false Original_LF__DOT__Poly_LF_Poly_list.nil)))

-- test_repeat1 (Admitted in Original.v)
axiom Original_LF__DOT__Poly_LF_Poly_test__repeat1 :
  Corelib_Init_Logic_eq
    (Original_LF__DOT__Poly_LF_Poly_repeat nat (nat.S (nat.S (nat.S (nat.S nat.O)))) (nat.S (nat.S nat.O)))
    (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S (nat.S nat.O))))
      (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S (nat.S nat.O))))
        Original_LF__DOT__Poly_LF_Poly_list.nil))

-- test_repeat2 (Admitted in Original.v)
axiom Original_LF__DOT__Poly_LF_Poly_test__repeat2 :
  Corelib_Init_Logic_eq
    (Original_LF__DOT__Poly_LF_Poly_repeat Original_LF__DOT__Basics_LF_Basics_bool Original_LF__DOT__Basics_LF_Basics_bool.false (nat.S nat.O))
    (Original_LF__DOT__Poly_LF_Poly_list.cons Original_LF__DOT__Basics_LF_Basics_bool.false Original_LF__DOT__Poly_LF_Poly_list.nil)

-- partition (Admitted in Original.v, so axiom)
axiom Original_LF__DOT__Poly_LF_Poly_partition : ∀ (X : Type),
  (X → Original_LF__DOT__Basics_LF_Basics_bool) →
  Original_LF__DOT__Poly_LF_Poly_list X →
  Original_LF__DOT__Poly_LF_Poly_prod (Original_LF__DOT__Poly_LF_Poly_list X) (Original_LF__DOT__Poly_LF_Poly_list X)

-- test_partition1 (Admitted in Original.v)
axiom Original_LF__DOT__Poly_LF_Poly_test__partition1 :
  Corelib_Init_Logic_eq 
    (Original_LF__DOT__Poly_LF_Poly_partition nat Original_LF__DOT__Basics_LF_Basics_odd 
       (Original_LF__DOT__Poly_LF_Poly_cons nat (S _0) 
         (Original_LF__DOT__Poly_LF_Poly_cons nat (S (S _0))
           (Original_LF__DOT__Poly_LF_Poly_cons nat (S (S (S _0)))
             (Original_LF__DOT__Poly_LF_Poly_cons nat (S (S (S (S _0))))
               (Original_LF__DOT__Poly_LF_Poly_cons nat (S (S (S (S (S _0)))))
                 (Original_LF__DOT__Poly_LF_Poly_nil nat)))))))
    (Original_LF__DOT__Poly_LF_Poly_pair 
       (Original_LF__DOT__Poly_LF_Poly_list nat) (Original_LF__DOT__Poly_LF_Poly_list nat)
       (Original_LF__DOT__Poly_LF_Poly_cons nat (S _0)
         (Original_LF__DOT__Poly_LF_Poly_cons nat (S (S (S _0)))
           (Original_LF__DOT__Poly_LF_Poly_cons nat (S (S (S (S (S _0)))))
             (Original_LF__DOT__Poly_LF_Poly_nil nat))))
       (Original_LF__DOT__Poly_LF_Poly_cons nat (S (S _0))
         (Original_LF__DOT__Poly_LF_Poly_cons nat (S (S (S (S _0))))
           (Original_LF__DOT__Poly_LF_Poly_nil nat))))

-- ============================================================
-- Original.LF_DOT_Maps definitions
-- ============================================================

def Original_LF__DOT__Maps_LF_Maps_total__map (A : Type) : Type := String_string → A

def Original_LF__DOT__Maps_LF_Maps_t__empty (A : Type) (v : A) : Original_LF__DOT__Maps_LF_Maps_total__map A :=
  fun _ => v

def Original_LF__DOT__Maps_LF_Maps_t__update (A : Type) (m : Original_LF__DOT__Maps_LF_Maps_total__map A)
    (x : String_string) (v : A) : Original_LF__DOT__Maps_LF_Maps_total__map A :=
  fun x' => match String_eqb x x' with
    | Stdlib_bool.true => v
    | Stdlib_bool.false => m x'

-- ============================================================
-- Original.LF_DOT_Imp definitions
-- ============================================================

-- state
def Original_LF__DOT__Imp_LF_Imp_state := Original_LF__DOT__Maps_LF_Maps_total__map nat

-- Character definitions for X, Y, Z
-- 'X' = 88 = 0b01011000, LSB first: 0,0,0,1,1,0,1,0
def charX : Ascii_ascii := Ascii_ascii.Ascii Stdlib_bool.false Stdlib_bool.false Stdlib_bool.false Stdlib_bool.true Stdlib_bool.true Stdlib_bool.false Stdlib_bool.true Stdlib_bool.false
-- 'Y' = 89 = 0b01011001, LSB first: 1,0,0,1,1,0,1,0
def charY : Ascii_ascii := Ascii_ascii.Ascii Stdlib_bool.true Stdlib_bool.false Stdlib_bool.false Stdlib_bool.true Stdlib_bool.true Stdlib_bool.false Stdlib_bool.true Stdlib_bool.false
-- 'Z' = 90 = 0b01011010, LSB first: 0,1,0,1,1,0,1,0
def charZ : Ascii_ascii := Ascii_ascii.Ascii Stdlib_bool.false Stdlib_bool.true Stdlib_bool.false Stdlib_bool.true Stdlib_bool.true Stdlib_bool.false Stdlib_bool.true Stdlib_bool.false

def Original_LF__DOT__Imp_LF_Imp_X : String_string := String_string.String charX String_string.EmptyString
def Original_LF__DOT__Imp_LF_Imp_Y : String_string := String_string.String charY String_string.EmptyString

-- aexp: arithmetic expressions
inductive Original_LF__DOT__Imp_LF_Imp_aexp : Type where
  | ANum : nat → Original_LF__DOT__Imp_LF_Imp_aexp
  | AId : String_string → Original_LF__DOT__Imp_LF_Imp_aexp
  | APlus : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp
  | AMinus : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp
  | AMult : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp

def Original_LF__DOT__Imp_LF_Imp_ANum := Original_LF__DOT__Imp_LF_Imp_aexp.ANum
def Original_LF__DOT__Imp_LF_Imp_AId := Original_LF__DOT__Imp_LF_Imp_aexp.AId

-- bexp: boolean expressions
inductive Original_LF__DOT__Imp_LF_Imp_bexp : Type where
  | BTrue : Original_LF__DOT__Imp_LF_Imp_bexp
  | BFalse : Original_LF__DOT__Imp_LF_Imp_bexp
  | BEq : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_bexp
  | BNeq : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_bexp
  | BLe : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_bexp
  | BGt : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_bexp
  | BNot : Original_LF__DOT__Imp_LF_Imp_bexp → Original_LF__DOT__Imp_LF_Imp_bexp
  | BAnd : Original_LF__DOT__Imp_LF_Imp_bexp → Original_LF__DOT__Imp_LF_Imp_bexp → Original_LF__DOT__Imp_LF_Imp_bexp

-- com: commands
inductive Original_LF__DOT__Imp_LF_Imp_com : Type where
  | CSkip : Original_LF__DOT__Imp_LF_Imp_com
  | CAsgn : String_string → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_com
  | CSeq : Original_LF__DOT__Imp_LF_Imp_com → Original_LF__DOT__Imp_LF_Imp_com → Original_LF__DOT__Imp_LF_Imp_com
  | CIf : Original_LF__DOT__Imp_LF_Imp_bexp → Original_LF__DOT__Imp_LF_Imp_com → Original_LF__DOT__Imp_LF_Imp_com → Original_LF__DOT__Imp_LF_Imp_com
  | CWhile : Original_LF__DOT__Imp_LF_Imp_bexp → Original_LF__DOT__Imp_LF_Imp_com → Original_LF__DOT__Imp_LF_Imp_com

def Original_LF__DOT__Imp_LF_Imp_CSkip := Original_LF__DOT__Imp_LF_Imp_com.CSkip
def Original_LF__DOT__Imp_LF_Imp_CAsgn := Original_LF__DOT__Imp_LF_Imp_com.CAsgn
def Original_LF__DOT__Imp_LF_Imp_CSeq := Original_LF__DOT__Imp_LF_Imp_com.CSeq
def Original_LF__DOT__Imp_LF_Imp_CIf := Original_LF__DOT__Imp_LF_Imp_com.CIf
def Original_LF__DOT__Imp_LF_Imp_CWhile := Original_LF__DOT__Imp_LF_Imp_com.CWhile

-- aeval
def Original_LF__DOT__Imp_LF_Imp_aeval (st : Original_LF__DOT__Imp_LF_Imp_state) : Original_LF__DOT__Imp_LF_Imp_aexp → nat
  | Original_LF__DOT__Imp_LF_Imp_aexp.ANum n => n
  | Original_LF__DOT__Imp_LF_Imp_aexp.AId x => st x
  | Original_LF__DOT__Imp_LF_Imp_aexp.APlus a1 a2 => Nat_add (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2)
  | Original_LF__DOT__Imp_LF_Imp_aexp.AMinus a1 a2 => Nat_sub (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2)
  | Original_LF__DOT__Imp_LF_Imp_aexp.AMult a1 a2 => Nat_mul (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2)

-- beval
def Original_LF__DOT__Imp_LF_Imp_beval (st : Original_LF__DOT__Imp_LF_Imp_state) : Original_LF__DOT__Imp_LF_Imp_bexp → Stdlib_bool
  | Original_LF__DOT__Imp_LF_Imp_bexp.BTrue => Stdlib_bool.true
  | Original_LF__DOT__Imp_LF_Imp_bexp.BFalse => Stdlib_bool.false
  | Original_LF__DOT__Imp_LF_Imp_bexp.BEq a1 a2 => Nat_eqb (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2)
  | Original_LF__DOT__Imp_LF_Imp_bexp.BNeq a1 a2 => negb (Nat_eqb (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2))
  | Original_LF__DOT__Imp_LF_Imp_bexp.BLe a1 a2 => Nat_leb (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2)
  | Original_LF__DOT__Imp_LF_Imp_bexp.BGt a1 a2 => negb (Nat_leb (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2))
  | Original_LF__DOT__Imp_LF_Imp_bexp.BNot b1 => negb (Original_LF__DOT__Imp_LF_Imp_beval st b1)
  | Original_LF__DOT__Imp_LF_Imp_bexp.BAnd b1 b2 => andb (Original_LF__DOT__Imp_LF_Imp_beval st b1) (Original_LF__DOT__Imp_LF_Imp_beval st b2)

-- empty_st
def Original_LF__DOT__Imp_LF_Imp_empty__st : Original_LF__DOT__Imp_LF_Imp_state :=
  Original_LF__DOT__Maps_LF_Maps_t__empty nat nat.O

-- ceval_fun_no_while
def Original_LF__DOT__Imp_LF_Imp_ceval__fun__no__while (st : Original_LF__DOT__Imp_LF_Imp_state) : Original_LF__DOT__Imp_LF_Imp_com → Original_LF__DOT__Imp_LF_Imp_state
  | Original_LF__DOT__Imp_LF_Imp_com.CSkip => st
  | Original_LF__DOT__Imp_LF_Imp_com.CAsgn x a => Original_LF__DOT__Maps_LF_Maps_t__update nat st x (Original_LF__DOT__Imp_LF_Imp_aeval st a)
  | Original_LF__DOT__Imp_LF_Imp_com.CSeq c1 c2 =>
      let st' := Original_LF__DOT__Imp_LF_Imp_ceval__fun__no__while st c1
      Original_LF__DOT__Imp_LF_Imp_ceval__fun__no__while st' c2
  | Original_LF__DOT__Imp_LF_Imp_com.CIf b c1 c2 =>
      match Original_LF__DOT__Imp_LF_Imp_beval st b with
      | Stdlib_bool.true => Original_LF__DOT__Imp_LF_Imp_ceval__fun__no__while st c1
      | Stdlib_bool.false => Original_LF__DOT__Imp_LF_Imp_ceval__fun__no__while st c2
  | Original_LF__DOT__Imp_LF_Imp_com.CWhile _ _ => st

-- ============================================================
-- Original.LF_DOT_IndProp definitions (regular expressions)
-- ============================================================

inductive Original_LF__DOT__IndProp_LF_IndProp_reg__exp (T : Type) : Type where
  | EmptySet : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T
  | EmptyStr : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T
  | Char : T → Original_LF__DOT__IndProp_LF_IndProp_reg__exp T
  | App : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T → Original_LF__DOT__IndProp_LF_IndProp_reg__exp T → Original_LF__DOT__IndProp_LF_IndProp_reg__exp T
  | Union : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T → Original_LF__DOT__IndProp_LF_IndProp_reg__exp T → Original_LF__DOT__IndProp_LF_IndProp_reg__exp T
  | Star : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T → Original_LF__DOT__IndProp_LF_IndProp_reg__exp T

def Original_LF__DOT__IndProp_LF_IndProp_EmptySet (T : Type) : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T :=
  Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptySet

def Original_LF__DOT__IndProp_LF_IndProp_EmptyStr (T : Type) : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T :=
  Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptyStr

def Original_LF__DOT__IndProp_LF_IndProp_Char (T : Type) (t : T) : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T :=
  Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Char t

def Original_LF__DOT__IndProp_LF_IndProp_App (T : Type) (r1 r2 : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T) : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T :=
  Original_LF__DOT__IndProp_LF_IndProp_reg__exp.App r1 r2

def Original_LF__DOT__IndProp_LF_IndProp_Union (T : Type) (r1 r2 : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T) : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T :=
  Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Union r1 r2

def Original_LF__DOT__IndProp_LF_IndProp_Star (T : Type) (r : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T) : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T :=
  Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Star r

-- exp_match
inductive Original_LF__DOT__IndProp_LF_IndProp_exp__match {T : Type} : Original_LF__DOT__Poly_LF_Poly_list T → Original_LF__DOT__IndProp_LF_IndProp_reg__exp T → Prop where
  | MEmpty : Original_LF__DOT__IndProp_LF_IndProp_exp__match (Original_LF__DOT__Poly_LF_Poly_list.nil) (Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptyStr)
  | MChar (x : T) : Original_LF__DOT__IndProp_LF_IndProp_exp__match (Original_LF__DOT__Poly_LF_Poly_list.cons x Original_LF__DOT__Poly_LF_Poly_list.nil) (Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Char x)
  | MApp (s1 : Original_LF__DOT__Poly_LF_Poly_list T) (re1 : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T) (s2 : Original_LF__DOT__Poly_LF_Poly_list T) (re2 : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T)
         (H1 : Original_LF__DOT__IndProp_LF_IndProp_exp__match s1 re1)
         (H2 : Original_LF__DOT__IndProp_LF_IndProp_exp__match s2 re2)
       : Original_LF__DOT__IndProp_LF_IndProp_exp__match (Original_LF__DOT__Poly_LF_Poly_app T s1 s2) (Original_LF__DOT__IndProp_LF_IndProp_reg__exp.App re1 re2)
  | MUnionL (s1 : Original_LF__DOT__Poly_LF_Poly_list T) (re1 re2 : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T)
            (H1 : Original_LF__DOT__IndProp_LF_IndProp_exp__match s1 re1)
          : Original_LF__DOT__IndProp_LF_IndProp_exp__match s1 (Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Union re1 re2)
  | MUnionR (s2 : Original_LF__DOT__Poly_LF_Poly_list T) (re1 re2 : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T)
            (H2 : Original_LF__DOT__IndProp_LF_IndProp_exp__match s2 re2)
          : Original_LF__DOT__IndProp_LF_IndProp_exp__match s2 (Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Union re1 re2)
  | MStar0 (re : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T) : Original_LF__DOT__IndProp_LF_IndProp_exp__match (Original_LF__DOT__Poly_LF_Poly_list.nil) (Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Star re)
  | MStarApp (s1 s2 : Original_LF__DOT__Poly_LF_Poly_list T) (re : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T)
             (H1 : Original_LF__DOT__IndProp_LF_IndProp_exp__match s1 re)
             (H2 : Original_LF__DOT__IndProp_LF_IndProp_exp__match s2 (Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Star re))
           : Original_LF__DOT__IndProp_LF_IndProp_exp__match (Original_LF__DOT__Poly_LF_Poly_app T s1 s2) (Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Star re)

-- ============================================================
-- Original.LF_DOT_Lists.LF.Lists.NatList definitions
-- ============================================================

-- natlist type (custom list of nats)
inductive Original_LF__DOT__Lists_LF_Lists_NatList_natlist : Type where
  | nil : Original_LF__DOT__Lists_LF_Lists_NatList_natlist
  | cons : nat → Original_LF__DOT__Lists_LF_Lists_NatList_natlist → Original_LF__DOT__Lists_LF_Lists_NatList_natlist

-- natlist constructors
def Original_LF__DOT__Lists_LF_Lists_NatList_nil : Original_LF__DOT__Lists_LF_Lists_NatList_natlist :=
  Original_LF__DOT__Lists_LF_Lists_NatList_natlist.nil

def Original_LF__DOT__Lists_LF_Lists_NatList_cons : nat → Original_LF__DOT__Lists_LF_Lists_NatList_natlist → Original_LF__DOT__Lists_LF_Lists_NatList_natlist :=
  Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons

-- bag is a type alias
def Original_LF__DOT__Lists_LF_Lists_NatList_bag : Type := Original_LF__DOT__Lists_LF_Lists_NatList_natlist

-- count is admitted (axiom) in the original Rocq code
axiom Original_LF__DOT__Lists_LF_Lists_NatList_count : nat → Original_LF__DOT__Lists_LF_Lists_NatList_bag → nat

-- remove_one is admitted (axiom) in the original Rocq code
axiom Original_LF__DOT__Lists_LF_Lists_NatList_remove__one : nat → Original_LF__DOT__Lists_LF_Lists_NatList_bag → Original_LF__DOT__Lists_LF_Lists_NatList_bag

-- test_remove_one3: count 4 (remove_one 5 [2;1;4;5;1;4]) = 2
axiom Original_LF__DOT__Lists_LF_Lists_NatList_test__remove__one3 :
  Corelib_Init_Logic_eq
    (Original_LF__DOT__Lists_LF_Lists_NatList_count 
       (S (S (S (S _0))))  -- 4
       (Original_LF__DOT__Lists_LF_Lists_NatList_remove__one 
          (S (S (S (S (S _0)))))  -- 5
          (Original_LF__DOT__Lists_LF_Lists_NatList_cons (S (S _0))  -- 2
             (Original_LF__DOT__Lists_LF_Lists_NatList_cons (S _0)  -- 1
                (Original_LF__DOT__Lists_LF_Lists_NatList_cons (S (S (S (S _0))))  -- 4
                   (Original_LF__DOT__Lists_LF_Lists_NatList_cons (S (S (S (S (S _0)))))  -- 5
                      (Original_LF__DOT__Lists_LF_Lists_NatList_cons (S _0)  -- 1
                         (Original_LF__DOT__Lists_LF_Lists_NatList_cons (S (S (S (S _0))))  -- 4
                            Original_LF__DOT__Lists_LF_Lists_NatList_nil))))))))
    (S (S _0))  -- 2

-- ============================================================
-- Original.LF_DOT_ImpParser definitions
-- ============================================================

-- token
def Original_LF__DOT__ImpParser_LF_ImpParser_token : Type := String_string

-- optionE
inductive Original_LF__DOT__ImpParser_LF_ImpParser_optionE (X : Type) : Type where
  | SomeE : X → Original_LF__DOT__ImpParser_LF_ImpParser_optionE X
  | NoneE : String_string → Original_LF__DOT__ImpParser_LF_ImpParser_optionE X

-- ============================================================
-- Original.False (different from Prop False)
-- ============================================================

inductive Original_False : Prop where

-- ============================================================
-- Original.LF_DOT_Logic definitions
-- ============================================================

-- not_true_iff_false: b <> true <-> b = false
-- This is Admitted in Original.v, so we use axiom
axiom Original_LF__DOT__Logic_LF_Logic_not__true__iff__false :
  ∀ (b : Original_LF__DOT__Basics_LF_Basics_bool), iff 
    (Corelib_Init_Logic_eq b Original_LF__DOT__Basics_LF_Basics_true → MyFalse)
    (Corelib_Init_Logic_eq b Original_LF__DOT__Basics_LF_Basics_false)

-- function_equality_ex1: plus 3 = plus (pred 4)
-- This is Admitted in Original.v
axiom Original_LF__DOT__Logic_LF_Logic_function__equality__ex1 :
  Corelib_Init_Logic_eq (Nat_add (S (S (S _0)))) (Nat_add (Nat_pred (S (S (S (S _0))))))

-- ============================================================
-- Original.LF_DOT_IndProp definitions
-- ============================================================

-- ev inductive for EvPlayground
inductive Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev : nat → Prop where
  | ev_0 : Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev nat.O
  | ev_SS : (n : nat) → Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev n → Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev (nat.S (nat.S n))

-- R relation
inductive Original_LF__DOT__IndProp_LF_IndProp_R : nat → nat → nat → Prop where
  | c1 : Original_LF__DOT__IndProp_LF_IndProp_R nat.O nat.O nat.O
  | c2 : (m n o : nat) → Original_LF__DOT__IndProp_LF_IndProp_R m n o → Original_LF__DOT__IndProp_LF_IndProp_R (nat.S m) n (nat.S o)
  | c3 : (m n o : nat) → Original_LF__DOT__IndProp_LF_IndProp_R m n o → Original_LF__DOT__IndProp_LF_IndProp_R m (nat.S n) (nat.S o)
  | c4 : (m n o : nat) → Original_LF__DOT__IndProp_LF_IndProp_R (nat.S m) (nat.S n) (nat.S (nat.S o)) → Original_LF__DOT__IndProp_LF_IndProp_R m n o
  | c5 : (m n o : nat) → Original_LF__DOT__IndProp_LF_IndProp_R m n o → Original_LF__DOT__IndProp_LF_IndProp_R n m o

-- fR function (Admitted in Original.v)
axiom Original_LF__DOT__IndProp_LF_IndProp_fR : nat → nat → nat

-- R_equiv_fR (Admitted in Original.v)
axiom Original_LF__DOT__IndProp_LF_IndProp_R__equiv__fR :
  ∀ (m n o : nat), iff (Original_LF__DOT__IndProp_LF_IndProp_R m n o) (Corelib_Init_Logic_eq (Original_LF__DOT__IndProp_LF_IndProp_fR m n) o)

-- one_not_even' (Admitted in Original.v)
axiom Original_LF__DOT__IndProp_LF_IndProp_one__not__even' :
  Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev (nat.S nat.O) → MyFalse

-- ============================================================
-- Original.LF_DOT_ProofObjects definitions
-- ============================================================

-- ev inductive for ProofObjects (same structure as EvPlayground.ev)
inductive Original_LF__DOT__ProofObjects_LF_ProofObjects_ev : nat → Prop where
  | ev_0 : Original_LF__DOT__ProofObjects_LF_ProofObjects_ev nat.O
  | ev_SS : (n : nat) → Original_LF__DOT__ProofObjects_LF_ProofObjects_ev n → Original_LF__DOT__ProofObjects_LF_ProofObjects_ev (nat.S (nat.S n))

-- ev_4: proof that 4 is even
def Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__4 : Original_LF__DOT__ProofObjects_LF_ProofObjects_ev (nat.S (nat.S (nat.S (nat.S nat.O)))) :=
  Original_LF__DOT__ProofObjects_LF_ProofObjects_ev.ev_SS (nat.S (nat.S nat.O))
    (Original_LF__DOT__ProofObjects_LF_ProofObjects_ev.ev_SS nat.O Original_LF__DOT__ProofObjects_LF_ProofObjects_ev.ev_0)

-- ev_8': proof that 8 is even (Admitted in Original.v)
axiom Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__8' :
  Original_LF__DOT__ProofObjects_LF_ProofObjects_ev (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S nat.O))))))))

-- ============================================================
-- Original.LF_DOT_Tactics definitions
-- ============================================================

-- forallb function (Admitted in Original.v, so axiom)
axiom Original_LF__DOT__Tactics_LF_Tactics_forallb : ∀ (X : Type),
  (X → Original_LF__DOT__Basics_LF_Basics_bool) → Original_LF__DOT__Poly_LF_Poly_list X → Original_LF__DOT__Basics_LF_Basics_bool

-- test_forallb_3: forallb even [0;2;4;5] = false (Admitted in Original.v)
axiom Original_LF__DOT__Tactics_LF_Tactics_test__forallb__3 :
  Corelib_Init_Logic_eq
    (Original_LF__DOT__Tactics_LF_Tactics_forallb nat Original_LF__DOT__Basics_LF_Basics_even
      (Original_LF__DOT__Poly_LF_Poly_list.cons nat.O
        (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S nat.O))
          (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S (nat.S nat.O))))
            (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S (nat.S (nat.S nat.O)))))
              Original_LF__DOT__Poly_LF_Poly_list.nil)))))
    Original_LF__DOT__Basics_LF_Basics_bool.false

-- ============================================================
-- Original.LF_DOT_Logic definitions
-- ============================================================

-- even_42_bool: even 42 = true (Admitted in Original.v)
axiom Original_LF__DOT__Logic_LF_Logic_even__42__bool :
  Corelib_Init_Logic_eq
    (Original_LF__DOT__Basics_LF_Basics_even
      (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S nat.O)))))))))))))))))))))))))))))))))))))))))))
    Original_LF__DOT__Basics_LF_Basics_bool.true

