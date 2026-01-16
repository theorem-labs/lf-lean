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

-- Predecessor on nat
def Nat_pred : nat → nat
  | nat.O => nat.O
  | nat.S n => n

-- Multiplication on nat
def Nat_mul : nat → nat → nat
  | nat.O, _ => nat.O
  | nat.S n, m => Nat_add m (Nat_mul n m)

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

-- Stdlib option
inductive option (A : Type) : Type where
  | None : option A
  | Some : A → option A

def None {A : Type} : option A := option.None
def Some {A : Type} (a : A) : option A := option.Some a

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

-- List_In (membership in list)
def List_In {A : Type} (a : A) : list A → Prop
  | list.nil => MyFalse
  | list.cons h t => Corelib_Init_Logic_eq a h ∨ List_In a t

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

-- Option type
inductive Original_LF__DOT__Poly_LF_Poly_option (X : Type) : Type where
  | Some : X → Original_LF__DOT__Poly_LF_Poly_option X
  | None : Original_LF__DOT__Poly_LF_Poly_option X

def Original_LF__DOT__Poly_LF_Poly_Some (X : Type) (x : X) : Original_LF__DOT__Poly_LF_Poly_option X :=
  Original_LF__DOT__Poly_LF_Poly_option.Some x

def Original_LF__DOT__Poly_LF_Poly_None (X : Type) : Original_LF__DOT__Poly_LF_Poly_option X :=
  Original_LF__DOT__Poly_LF_Poly_option.None

-- Prod type
inductive Original_LF__DOT__Poly_LF_Poly_prod (X Y : Type) : Type where
  | pair : X → Y → Original_LF__DOT__Poly_LF_Poly_prod X Y

def Original_LF__DOT__Poly_LF_Poly_prod_mk (X Y : Type) (x : X) (y : Y) : Original_LF__DOT__Poly_LF_Poly_prod X Y :=
  Original_LF__DOT__Poly_LF_Poly_prod.pair x y

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
-- Original.LF_DOT_Basics additional definitions
-- ============================================================

-- leb (less-or-equal on nat returning bool)
def Original_LF__DOT__Basics_LF_Basics_leb : nat → nat → Original_LF__DOT__Basics_LF_Basics_bool
  | nat.O, _ => Original_LF__DOT__Basics_LF_Basics_bool.true
  | nat.S _, nat.O => Original_LF__DOT__Basics_LF_Basics_bool.false
  | nat.S n', nat.S m' => Original_LF__DOT__Basics_LF_Basics_leb n' m'

-- eqb (equality test on nat returning bool)
def Original_LF__DOT__Basics_LF_Basics_eqb : nat → nat → Original_LF__DOT__Basics_LF_Basics_bool
  | nat.O, nat.O => Original_LF__DOT__Basics_LF_Basics_bool.true
  | nat.O, nat.S _ => Original_LF__DOT__Basics_LF_Basics_bool.false
  | nat.S _, nat.O => Original_LF__DOT__Basics_LF_Basics_bool.false
  | nat.S n', nat.S m' => Original_LF__DOT__Basics_LF_Basics_eqb n' m'

-- andb for Original bool
def Original_LF__DOT__Basics_LF_Basics_andb : Original_LF__DOT__Basics_LF_Basics_bool → Original_LF__DOT__Basics_LF_Basics_bool → Original_LF__DOT__Basics_LF_Basics_bool
  | Original_LF__DOT__Basics_LF_Basics_bool.true, b => b
  | Original_LF__DOT__Basics_LF_Basics_bool.false, _ => Original_LF__DOT__Basics_LF_Basics_bool.false

-- ============================================================
-- Original.LF_DOT_Lists.NatList definitions
-- ============================================================

-- natlist (list of nats)
inductive Original_LF__DOT__Lists_LF_Lists_NatList_natlist : Type where
  | nil : Original_LF__DOT__Lists_LF_Lists_NatList_natlist
  | cons : nat → Original_LF__DOT__Lists_LF_Lists_NatList_natlist → Original_LF__DOT__Lists_LF_Lists_NatList_natlist

-- cons constructor
def Original_LF__DOT__Lists_LF_Lists_NatList_cons : nat → Original_LF__DOT__Lists_LF_Lists_NatList_natlist → Original_LF__DOT__Lists_LF_Lists_NatList_natlist :=
  Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons

-- bag is alias for natlist
def Original_LF__DOT__Lists_LF_Lists_NatList_bag : Type := Original_LF__DOT__Lists_LF_Lists_NatList_natlist

-- NatList nil
def Original_LF__DOT__Lists_LF_Lists_NatList_nil : Original_LF__DOT__Lists_LF_Lists_NatList_natlist := 
  Original_LF__DOT__Lists_LF_Lists_NatList_natlist.nil

-- NatList count (admitted in Original.v, so we define it here)
def Original_LF__DOT__Lists_LF_Lists_NatList_count : nat → Original_LF__DOT__Lists_LF_Lists_NatList_natlist → nat
  | _, Original_LF__DOT__Lists_LF_Lists_NatList_natlist.nil => nat.O
  | v, Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons h t =>
    match Nat_eqb v h with
    | Stdlib_bool.true => nat.S (Original_LF__DOT__Lists_LF_Lists_NatList_count v t)
    | Stdlib_bool.false => Original_LF__DOT__Lists_LF_Lists_NatList_count v t

-- NatList member (admitted in Original.v, so we define it here)
def Original_LF__DOT__Lists_LF_Lists_NatList_member : nat → Original_LF__DOT__Lists_LF_Lists_NatList_natlist → Original_LF__DOT__Basics_LF_Basics_bool
  | _, Original_LF__DOT__Lists_LF_Lists_NatList_natlist.nil => Original_LF__DOT__Basics_LF_Basics_bool.false
  | v, Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons h t =>
    match Original_LF__DOT__Basics_LF_Basics_eqb v h with
    | Original_LF__DOT__Basics_LF_Basics_bool.true => Original_LF__DOT__Basics_LF_Basics_bool.true
    | Original_LF__DOT__Basics_LF_Basics_bool.false => Original_LF__DOT__Lists_LF_Lists_NatList_member v t

-- count_member_nonzero is Admitted in Original.v
axiom Original_LF__DOT__Lists_LF_Lists_NatList_count__member__nonzero :
  ∀ (x : Original_LF__DOT__Lists_LF_Lists_NatList_natlist),
    Corelib_Init_Logic_eq
      (Original_LF__DOT__Basics_LF_Basics_leb (S _0)
         (Original_LF__DOT__Lists_LF_Lists_NatList_count (S _0) (Original_LF__DOT__Lists_LF_Lists_NatList_cons (S _0) x)))
      Original_LF__DOT__Basics_LF_Basics_true

-- ============================================================
-- Original.LF_DOT_Induction definitions (bin type)
-- ============================================================

-- bin inductive type
inductive Original_LF__DOT__Induction_LF_Induction_bin : Type where
  | Z : Original_LF__DOT__Induction_LF_Induction_bin
  | B0 : Original_LF__DOT__Induction_LF_Induction_bin → Original_LF__DOT__Induction_LF_Induction_bin
  | B1 : Original_LF__DOT__Induction_LF_Induction_bin → Original_LF__DOT__Induction_LF_Induction_bin

-- Z constructor
def Original_LF__DOT__Induction_LF_Induction_Z : Original_LF__DOT__Induction_LF_Induction_bin :=
  Original_LF__DOT__Induction_LF_Induction_bin.Z

-- double_bin is Admitted in Rocq, so axiomatize it
axiom Original_LF__DOT__Induction_LF_Induction_double__bin : Original_LF__DOT__Induction_LF_Induction_bin → Original_LF__DOT__Induction_LF_Induction_bin

-- double_bin_zero: double_bin Z = Z (Admitted in Rocq)
axiom Original_LF__DOT__Induction_LF_Induction_double__bin__zero :
  Corelib_Init_Logic_eq
    (Original_LF__DOT__Induction_LF_Induction_double__bin Original_LF__DOT__Induction_LF_Induction_Z)
    Original_LF__DOT__Induction_LF_Induction_Z

-- mult_0_plus': forall n m : nat, (n + 0 + 0) * m = n * m (Admitted in Rocq)
axiom Original_LF__DOT__Induction_LF_Induction_mult__0__plus' :
  ∀ (n m : nat), Corelib_Init_Logic_eq (Nat_mul (Nat_add (Nat_add n _0) _0) m) (Nat_mul n m)

-- ============================================================
-- Original.LF_DOT_IndProp.EvPlayground definitions
-- ============================================================

-- ev inductive type
inductive Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev : nat → Prop where
  | ev_0 : Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev nat.O
  | ev_SS : (n : nat) → Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev n → Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev (nat.S (nat.S n))

-- one_not_even: ~ ev 1 (Admitted in Rocq)
axiom Original_LF__DOT__IndProp_LF_IndProp_one__not__even : Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev (S _0) → MyFalse

-- ============================================================
-- Original.LF_DOT_Poly additional definitions
-- ============================================================

-- filter_even_gt7 is Admitted in Rocq
axiom Original_LF__DOT__Poly_LF_Poly_filter__even__gt7 :
  Original_LF__DOT__Poly_LF_Poly_list nat → Original_LF__DOT__Poly_LF_Poly_list nat

-- test_filter_even_gt7_2: filter_even_gt7 [5;2;6;19;129] = [] (Admitted in Rocq)
axiom Original_LF__DOT__Poly_LF_Poly_test__filter__even__gt7__2 :
  Corelib_Init_Logic_eq
    (Original_LF__DOT__Poly_LF_Poly_filter__even__gt7
       (Original_LF__DOT__Poly_LF_Poly_cons nat (S (S (S (S (S _0)))))
          (Original_LF__DOT__Poly_LF_Poly_cons nat (S (S _0))
             (Original_LF__DOT__Poly_LF_Poly_cons nat (S (S (S (S (S (S _0))))))
                (Original_LF__DOT__Poly_LF_Poly_cons nat (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S _0)))))))))))))))))))
                   (Original_LF__DOT__Poly_LF_Poly_cons nat (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S _0)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
                      (Original_LF__DOT__Poly_LF_Poly_nil nat)))))))
    (Original_LF__DOT__Poly_LF_Poly_nil nat)

-- ============================================================
-- Original.LF_DOT_Tactics definitions
-- ============================================================

-- eqb_true: forall n m, n =? m = true -> n = m (Admitted in Rocq)
axiom Original_LF__DOT__Tactics_LF_Tactics_eqb__true :
  ∀ (n m : nat),
    Corelib_Init_Logic_eq (Original_LF__DOT__Basics_LF_Basics_eqb n m) Original_LF__DOT__Basics_LF_Basics_true →
    Corelib_Init_Logic_eq n m

-- ============================================================
-- Original.LF_DOT_AltAuto definitions
-- ============================================================

-- contras: forall P : Prop, P -> ~ P -> 0 = 1 (Admitted in Rocq)
-- This derives a contradiction (0 = 1) from having both P and ~P
axiom Original_LF__DOT__AltAuto_LF_AltAuto_contras :
  ∀ (P : Prop), P → Logic_not P → Corelib_Init_Logic_eq _0 (S _0)

-- andb3_exchange': forall b1 b2 b3, andb (andb b1 b2) b3 = andb (andb b1 b3) b2
axiom Original_LF__DOT__AltAuto_LF_AltAuto_andb3__exchange' :
  ∀ (b1 b2 b3 : Original_LF__DOT__Basics_LF_Basics_bool),
    Corelib_Init_Logic_eq
      (Original_LF__DOT__Basics_LF_Basics_andb (Original_LF__DOT__Basics_LF_Basics_andb b1 b2) b3)
      (Original_LF__DOT__Basics_LF_Basics_andb (Original_LF__DOT__Basics_LF_Basics_andb b1 b3) b2)

-- re_opt is Admitted in Rocq
def Original_LF__DOT__AltAuto_LF_AltAuto_re__opt (T : Type) : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T → Original_LF__DOT__IndProp_LF_IndProp_reg__exp T
  | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptySet => Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptySet
  | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptyStr => Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptyStr
  | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Char t => Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Char t
  | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.App re1 re2 =>
      match Original_LF__DOT__AltAuto_LF_AltAuto_re__opt T re1 with
      | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptySet => Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptySet
      | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptyStr => Original_LF__DOT__AltAuto_LF_AltAuto_re__opt T re2
      | re1' => match Original_LF__DOT__AltAuto_LF_AltAuto_re__opt T re2 with
                | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptySet => Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptySet
                | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptyStr => re1'
                | re2' => Original_LF__DOT__IndProp_LF_IndProp_reg__exp.App re1' re2'
  | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Union re1 re2 =>
      match Original_LF__DOT__AltAuto_LF_AltAuto_re__opt T re1 with
      | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptySet => Original_LF__DOT__AltAuto_LF_AltAuto_re__opt T re2
      | re1' => match Original_LF__DOT__AltAuto_LF_AltAuto_re__opt T re2 with
                | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptySet => re1'
                | re2' => Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Union re1' re2'
  | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Star re =>
      match Original_LF__DOT__AltAuto_LF_AltAuto_re__opt T re with
      | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptySet => Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptyStr
      | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptyStr => Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptyStr
      | re' => Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Star re'

-- string (alias for list of ascii)
def Original_LF__DOT__IndProp_LF_IndProp_string : Type := Original_LF__DOT__Poly_LF_Poly_list Ascii_ascii

-- re_opt_match' is Admitted in Rocq
-- Original type: forall (T : Type) (re : reg_exp T) (s : list T), exp_match s re -> exp_match s (re_opt re)
axiom Original_LF__DOT__AltAuto_LF_AltAuto_re__opt__match' :
  ∀ (T : Type) (re : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T) (s : Original_LF__DOT__Poly_LF_Poly_list T),
    Original_LF__DOT__IndProp_LF_IndProp_exp__match s re →
    Original_LF__DOT__IndProp_LF_IndProp_exp__match s (Original_LF__DOT__AltAuto_LF_AltAuto_re__opt T re)

-- manual_grade_for_pumping_redux is a definition returning True (Admitted)
-- manual_grade_for_pumping_redux = None : option (prod nat string)
def Original_LF__DOT__AltAuto_LF_AltAuto_manual__grade__for__pumping__redux : 
  Original_LF__DOT__Poly_LF_Poly_option (Original_LF__DOT__Poly_LF_Poly_prod nat (Original_LF__DOT__Poly_LF_Poly_list Ascii_ascii)) :=
  Original_LF__DOT__Poly_LF_Poly_option.None

-- test_leb3: leb 4 2 = false (Admitted in Original.v)
def Original_LF__DOT__Basics_LF_Basics_test__leb3 : 
  Corelib_Init_Logic_eq (Original_LF__DOT__Basics_LF_Basics_leb (S (S (S (S _0)))) (S (S _0))) Original_LF__DOT__Basics_LF_Basics_false := 
  Corelib_Init_Logic_eq.refl Original_LF__DOT__Basics_LF_Basics_false

-- mylist3 := [1;2;3]
def Original_LF__DOT__Lists_LF_Lists_NatList_mylist3 : Original_LF__DOT__Lists_LF_Lists_NatList_natlist :=
  Original_LF__DOT__Lists_LF_Lists_NatList_cons (S _0)
    (Original_LF__DOT__Lists_LF_Lists_NatList_cons (S (S _0))
      (Original_LF__DOT__Lists_LF_Lists_NatList_cons (S (S (S _0)))
        Original_LF__DOT__Lists_LF_Lists_NatList_nil))

-- test_count2: count 6 [1;2;3;1;4;1] = 0 (Admitted in Original.v)
def Original_LF__DOT__Lists_LF_Lists_NatList_test__count2 :
  Corelib_Init_Logic_eq 
    (Original_LF__DOT__Lists_LF_Lists_NatList_count 
      (S (S (S (S (S (S _0))))))
      (Original_LF__DOT__Lists_LF_Lists_NatList_cons (S _0)
        (Original_LF__DOT__Lists_LF_Lists_NatList_cons (S (S _0))
          (Original_LF__DOT__Lists_LF_Lists_NatList_cons (S (S (S _0)))
            (Original_LF__DOT__Lists_LF_Lists_NatList_cons (S _0)
              (Original_LF__DOT__Lists_LF_Lists_NatList_cons (S (S (S (S _0))))
                (Original_LF__DOT__Lists_LF_Lists_NatList_cons (S _0)
                  Original_LF__DOT__Lists_LF_Lists_NatList_nil)))))))
    _0 :=
  Corelib_Init_Logic_eq.refl _0

-- test_member2: member 2 [1;4;1] = false (Admitted in Original.v)
def Original_LF__DOT__Lists_LF_Lists_NatList_test__member2 :
  Corelib_Init_Logic_eq
    (Original_LF__DOT__Lists_LF_Lists_NatList_member
      (S (S _0))
      (Original_LF__DOT__Lists_LF_Lists_NatList_cons (S _0)
        (Original_LF__DOT__Lists_LF_Lists_NatList_cons (S (S (S (S _0))))
          (Original_LF__DOT__Lists_LF_Lists_NatList_cons (S _0)
            Original_LF__DOT__Lists_LF_Lists_NatList_nil))))
    Original_LF__DOT__Basics_LF_Basics_false :=
  Corelib_Init_Logic_eq.refl Original_LF__DOT__Basics_LF_Basics_false

-- leb_refl: forall n, leb n n = true (Admitted in Original.v)
def Original_LF__DOT__Induction_LF_Induction_leb__refl (n : nat) :
  Corelib_Init_Logic_eq (Original_LF__DOT__Basics_LF_Basics_leb n n) Original_LF__DOT__Basics_LF_Basics_true :=
  match n with
  | nat.O => Corelib_Init_Logic_eq.refl Original_LF__DOT__Basics_LF_Basics_true
  | nat.S n' => Original_LF__DOT__Induction_LF_Induction_leb__refl n'

-- manual_grade_for_double_neg_informal := None
def Original_LF__DOT__Logic_LF_Logic_manual__grade__for__double__neg__informal :
  Original_LF__DOT__Poly_LF_Poly_option (Original_LF__DOT__Poly_LF_Poly_prod nat String_string) :=
  Original_LF__DOT__Poly_LF_Poly_option.None

-- manual_grade_for_beval_rules := None (uses stdlib option and prod)
def Original_LF__DOT__Imp_LF_Imp_AExp_manual__grade__for__beval__rules :
  option (prod nat String_string) :=
  option.None

-- manual_grade_for_fold_map := None
def Original_LF__DOT__Poly_LF_Poly_Exercises_manual__grade__for__fold__map :
  Original_LF__DOT__Poly_LF_Poly_option (Original_LF__DOT__Poly_LF_Poly_prod nat String_string) :=
  Original_LF__DOT__Poly_LF_Poly_option.None

-- and (conjunction)
inductive and (A B : Prop) : Prop where
  | intro : A → B → and A B

-- and_example2 axiom
-- and_example2: forall n m : nat, n = 0 /\ m = 0 -> n + m = 0
axiom Original_LF__DOT__Logic_LF_Logic_and__example2 :
  ∀ (n m : nat),
    and (Corelib_Init_Logic_eq n _0) (Corelib_Init_Logic_eq m _0) →
    Corelib_Init_Logic_eq (Nat_add n m) _0

-- uncurry theorem
axiom Original_LF__DOT__ProofObjects_LF_ProofObjects_uncurry :
  ∀ (P Q R : Prop), (P → Q → R) → (and P Q → R)

-- provable_equiv_true: forall P : Prop, P -> P <-> True
axiom Original_LF__DOT__IndProp_LF_IndProp_provable__equiv__true :
  ∀ (P : Prop), P → iff P MyTrue

-- Sn_le_Sm__n_le_m
-- le is defined in terms of nat
inductive le : nat → nat → Prop where
  | le_n (n : nat) : le n n
  | le_S (n m : nat) : le n m → le n (nat.S m)

axiom Original_LF__DOT__IndProp_LF_IndProp_Sn__le__Sm____n__le__m :
  ∀ (n m : nat), le (S n) (S m) → le n m

