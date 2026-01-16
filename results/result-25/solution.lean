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

-- and (conjunction)
structure and (A B : Prop) : Prop where
  intro ::
  left : A
  right : B

def and_intro := @and.intro

-- or (disjunction)
inductive or (A B : Prop) : Prop where
  | inl (h : A) : or A B
  | inr (h : B) : or A B

def or_introl := @or.inl
def or_intror := @or.inr

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

-- leb (less than or equal - returns bool)
def Original_LF__DOT__Basics_LF_Basics_leb : nat → nat → Original_LF__DOT__Basics_LF_Basics_bool
  | nat.O, _ => Original_LF__DOT__Basics_LF_Basics_bool.true
  | nat.S _, nat.O => Original_LF__DOT__Basics_LF_Basics_bool.false
  | nat.S n', nat.S m' => Original_LF__DOT__Basics_LF_Basics_leb n' m'

-- eqb (nat equality - returns bool)
def Original_LF__DOT__Basics_LF_Basics_eqb : nat → nat → Original_LF__DOT__Basics_LF_Basics_bool
  | nat.O, nat.O => Original_LF__DOT__Basics_LF_Basics_bool.true
  | nat.S n', nat.S m' => Original_LF__DOT__Basics_LF_Basics_eqb n' m'
  | _, _ => Original_LF__DOT__Basics_LF_Basics_bool.false

-- negb (boolean negation)
def Original_LF__DOT__Basics_LF_Basics_negb : Original_LF__DOT__Basics_LF_Basics_bool → Original_LF__DOT__Basics_LF_Basics_bool
  | Original_LF__DOT__Basics_LF_Basics_bool.true => Original_LF__DOT__Basics_LF_Basics_bool.false
  | Original_LF__DOT__Basics_LF_Basics_bool.false => Original_LF__DOT__Basics_LF_Basics_bool.true

-- andb (boolean and)
def Original_LF__DOT__Basics_LF_Basics_andb : Original_LF__DOT__Basics_LF_Basics_bool → Original_LF__DOT__Basics_LF_Basics_bool → Original_LF__DOT__Basics_LF_Basics_bool
  | Original_LF__DOT__Basics_LF_Basics_bool.true, b => b
  | Original_LF__DOT__Basics_LF_Basics_bool.false, _ => Original_LF__DOT__Basics_LF_Basics_bool.false

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
-- Additional definitions for main checkers
-- ============================================================

-- le from LePlayground
inductive Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le : nat → nat → Prop where
  | le_n (n : nat) : Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le n n
  | le_S (n m : nat) (h : Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le n m) : Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le n (nat.S m)

def Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le_le_n := @Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le.le_n
def Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le_le_S := @Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le.le_S

-- le_inversion is admitted in Original.v
axiom Original_LF__DOT__IndProp_LF_IndProp_le__inversion :
  ∀ (n m : nat),
    Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le n m →
    or (Corelib_Init_Logic_eq n m) (ex fun m' => and (Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le n m') (Corelib_Init_Logic_eq m (nat.S m')))

-- leb_true_trans is admitted
axiom Original_LF__DOT__IndProp_LF_IndProp_leb__true__trans :
  ∀ (n m o : nat),
    Corelib_Init_Logic_eq (Original_LF__DOT__Basics_LF_Basics_leb n m) Original_LF__DOT__Basics_LF_Basics_true →
    Corelib_Init_Logic_eq (Original_LF__DOT__Basics_LF_Basics_leb m o) Original_LF__DOT__Basics_LF_Basics_true →
    Corelib_Init_Logic_eq (Original_LF__DOT__Basics_LF_Basics_leb n o) Original_LF__DOT__Basics_LF_Basics_true

-- double from Induction
def Original_LF__DOT__Induction_LF_Induction_double : nat → nat
  | nat.O => nat.O
  | nat.S n' => nat.S (nat.S (Original_LF__DOT__Induction_LF_Induction_double n'))

-- double_incr is admitted
axiom Original_LF__DOT__Induction_LF_Induction_double__incr :
  ∀ (n : nat), Corelib_Init_Logic_eq (Original_LF__DOT__Induction_LF_Induction_double (nat.S n)) (nat.S (nat.S (Original_LF__DOT__Induction_LF_Induction_double n)))

-- cnat (church numerals) from Poly.Exercises
def Original_LF__DOT__Poly_LF_Poly_Exercises_cnat : Type 1 := ∀ X : Type, (X → X) → X → X

-- zero church numeral
def Original_LF__DOT__Poly_LF_Poly_Exercises_zero : Original_LF__DOT__Poly_LF_Poly_Exercises_cnat :=
  fun _ _ z => z

-- zero_church_peano (proved by rfl since it's definitional)
theorem Original_LF__DOT__Poly_LF_Poly_Exercises_zero__church__peano :
  Corelib_Init_Logic_eq (Original_LF__DOT__Poly_LF_Poly_Exercises_zero nat nat.S nat.O) nat.O :=
  Corelib_Init_Logic_eq.refl _

-- add_comm3_take2 is admitted
axiom Original_LF__DOT__Logic_LF_Logic_add__comm3__take2 :
  ∀ (n m p : nat), Corelib_Init_Logic_eq (Nat_add n (Nat_add m p)) (Nat_add (Nat_add n m) p)

-- Props.or from ProofObjects
def Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or : Prop → Prop → Prop := or

-- or_commut' is admitted
axiom Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or__commut' :
  ∀ (P Q : Prop), Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or P Q →
    Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or Q P

-- eq from ProofObjects
def Original_LF__DOT__ProofObjects_LF_ProofObjects_eq : ∀ {X : Type}, X → X → Prop := @Corelib_Init_Logic_eq

-- eq_add is admitted
axiom Original_LF__DOT__ProofObjects_LF_ProofObjects_eq__add :
  ∀ (n m : nat), Original_LF__DOT__ProofObjects_LF_ProofObjects_eq n m →
    Original_LF__DOT__ProofObjects_LF_ProofObjects_eq (nat.S n) (nat.S m)

-- natlist from Lists
inductive Original_LF__DOT__Lists_LF_Lists_NatList_natlist : Type where
  | nil : Original_LF__DOT__Lists_LF_Lists_NatList_natlist
  | cons : nat → Original_LF__DOT__Lists_LF_Lists_NatList_natlist → Original_LF__DOT__Lists_LF_Lists_NatList_natlist

def Original_LF__DOT__Lists_LF_Lists_NatList_nil := Original_LF__DOT__Lists_LF_Lists_NatList_natlist.nil
def Original_LF__DOT__Lists_LF_Lists_NatList_cons := Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons

-- app for natlist
def Original_LF__DOT__Lists_LF_Lists_NatList_app : Original_LF__DOT__Lists_LF_Lists_NatList_natlist → Original_LF__DOT__Lists_LF_Lists_NatList_natlist → Original_LF__DOT__Lists_LF_Lists_NatList_natlist
  | Original_LF__DOT__Lists_LF_Lists_NatList_natlist.nil, l2 => l2
  | Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons h t, l2 => Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons h (Original_LF__DOT__Lists_LF_Lists_NatList_app t l2)

-- rev for natlist
def Original_LF__DOT__Lists_LF_Lists_NatList_rev : Original_LF__DOT__Lists_LF_Lists_NatList_natlist → Original_LF__DOT__Lists_LF_Lists_NatList_natlist
  | Original_LF__DOT__Lists_LF_Lists_NatList_natlist.nil => Original_LF__DOT__Lists_LF_Lists_NatList_natlist.nil
  | Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons h t => Original_LF__DOT__Lists_LF_Lists_NatList_app (Original_LF__DOT__Lists_LF_Lists_NatList_rev t) (Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons h Original_LF__DOT__Lists_LF_Lists_NatList_natlist.nil)

-- test_rev2 is admitted
axiom Original_LF__DOT__Lists_LF_Lists_NatList_test__rev2 :
  Corelib_Init_Logic_eq 
    (Original_LF__DOT__Lists_LF_Lists_NatList_rev (Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons nat.O (Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons (nat.S nat.O) (Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons (nat.S (nat.S nat.O)) Original_LF__DOT__Lists_LF_Lists_NatList_natlist.nil))))
    (Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons (nat.S (nat.S nat.O)) (Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons (nat.S nat.O) (Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons nat.O Original_LF__DOT__Lists_LF_Lists_NatList_natlist.nil)))

-- andb and orb for Original_LF bool
def Original_andb : Original_LF__DOT__Basics_LF_Basics_bool → Original_LF__DOT__Basics_LF_Basics_bool → Original_LF__DOT__Basics_LF_Basics_bool
  | Original_LF__DOT__Basics_LF_Basics_bool.true, b => b
  | Original_LF__DOT__Basics_LF_Basics_bool.false, _ => Original_LF__DOT__Basics_LF_Basics_bool.false

def Original_orb : Original_LF__DOT__Basics_LF_Basics_bool → Original_LF__DOT__Basics_LF_Basics_bool → Original_LF__DOT__Basics_LF_Basics_bool
  | Original_LF__DOT__Basics_LF_Basics_bool.true, _ => Original_LF__DOT__Basics_LF_Basics_bool.true
  | Original_LF__DOT__Basics_LF_Basics_bool.false, b => b

-- re_not_empty from IndProp
def Original_LF__DOT__IndProp_LF_IndProp_re__not__empty {T : Type} : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T → Original_LF__DOT__Basics_LF_Basics_bool
  | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptySet => Original_LF__DOT__Basics_LF_Basics_false
  | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptyStr => Original_LF__DOT__Basics_LF_Basics_true
  | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Char _ => Original_LF__DOT__Basics_LF_Basics_true
  | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.App r1 r2 => Original_andb (Original_LF__DOT__IndProp_LF_IndProp_re__not__empty r1) (Original_LF__DOT__IndProp_LF_IndProp_re__not__empty r2)
  | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Union r1 r2 => Original_orb (Original_LF__DOT__IndProp_LF_IndProp_re__not__empty r1) (Original_LF__DOT__IndProp_LF_IndProp_re__not__empty r2)
  | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Star _ => Original_LF__DOT__Basics_LF_Basics_true

-- re_opt from AltAuto - optimizes regular expressions
def Original_LF__DOT__AltAuto_LF_AltAuto_re__opt {T : Type} : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T → Original_LF__DOT__IndProp_LF_IndProp_reg__exp T
  | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.App _ Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptySet => Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptySet
  | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.App Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptyStr re2 => Original_LF__DOT__AltAuto_LF_AltAuto_re__opt re2
  | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.App re1 Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptyStr => Original_LF__DOT__AltAuto_LF_AltAuto_re__opt re1
  | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.App re1 re2 => Original_LF__DOT__IndProp_LF_IndProp_reg__exp.App (Original_LF__DOT__AltAuto_LF_AltAuto_re__opt re1) (Original_LF__DOT__AltAuto_LF_AltAuto_re__opt re2)
  | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Union Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptySet re2 => Original_LF__DOT__AltAuto_LF_AltAuto_re__opt re2
  | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Union re1 Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptySet => Original_LF__DOT__AltAuto_LF_AltAuto_re__opt re1
  | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Union re1 re2 => Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Union (Original_LF__DOT__AltAuto_LF_AltAuto_re__opt re1) (Original_LF__DOT__AltAuto_LF_AltAuto_re__opt re2)
  | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Star Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptySet => Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptyStr
  | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Star Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptyStr => Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptyStr
  | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Star re => Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Star (Original_LF__DOT__AltAuto_LF_AltAuto_re__opt re)
  | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptySet => Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptySet
  | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptyStr => Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptyStr
  | Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Char x => Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Char x

-- tl (tail) for natlist
def Original_LF__DOT__Lists_LF_Lists_NatList_tl : Original_LF__DOT__Lists_LF_Lists_NatList_natlist → Original_LF__DOT__Lists_LF_Lists_NatList_natlist
  | Original_LF__DOT__Lists_LF_Lists_NatList_natlist.nil => Original_LF__DOT__Lists_LF_Lists_NatList_natlist.nil
  | Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons _ t => t

-- doit3times
def Original_LF__DOT__Poly_LF_Poly_doit3times {X : Type} (f : X → X) (n : X) : X :=
  f (f (f n))

-- fold
def Original_LF__DOT__Poly_LF_Poly_fold {X Y : Type} (f : X → Y → Y) : Original_LF__DOT__Poly_LF_Poly_list X → Y → Y
  | Original_LF__DOT__Poly_LF_Poly_list.nil, b => b
  | Original_LF__DOT__Poly_LF_Poly_list.cons h t, b => f h (Original_LF__DOT__Poly_LF_Poly_fold f t b)

-- fold_length
def Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length {X : Type} (l : Original_LF__DOT__Poly_LF_Poly_list X) : nat :=
  Original_LF__DOT__Poly_LF_Poly_fold (fun _ n => nat.S n) l nat.O

-- Perm3 inductive
inductive Original_LF__DOT__IndProp_LF_IndProp_Perm3 {X : Type} : Original_LF__DOT__Poly_LF_Poly_list X → Original_LF__DOT__Poly_LF_Poly_list X → Prop where
  | perm3_swap12 (a b c : X) :
      Original_LF__DOT__IndProp_LF_IndProp_Perm3
        (Original_LF__DOT__Poly_LF_Poly_cons X a (Original_LF__DOT__Poly_LF_Poly_cons X b (Original_LF__DOT__Poly_LF_Poly_cons X c (Original_LF__DOT__Poly_LF_Poly_nil X))))
        (Original_LF__DOT__Poly_LF_Poly_cons X b (Original_LF__DOT__Poly_LF_Poly_cons X a (Original_LF__DOT__Poly_LF_Poly_cons X c (Original_LF__DOT__Poly_LF_Poly_nil X))))
  | perm3_swap23 (a b c : X) :
      Original_LF__DOT__IndProp_LF_IndProp_Perm3
        (Original_LF__DOT__Poly_LF_Poly_cons X a (Original_LF__DOT__Poly_LF_Poly_cons X b (Original_LF__DOT__Poly_LF_Poly_cons X c (Original_LF__DOT__Poly_LF_Poly_nil X))))
        (Original_LF__DOT__Poly_LF_Poly_cons X a (Original_LF__DOT__Poly_LF_Poly_cons X c (Original_LF__DOT__Poly_LF_Poly_cons X b (Original_LF__DOT__Poly_LF_Poly_nil X))))
  | perm3_trans (l1 l2 l3 : Original_LF__DOT__Poly_LF_Poly_list X) :
      Original_LF__DOT__IndProp_LF_IndProp_Perm3 l1 l2 →
      Original_LF__DOT__IndProp_LF_IndProp_Perm3 l2 l3 →
      Original_LF__DOT__IndProp_LF_IndProp_Perm3 l1 l3

-- Perm3_refl (Admitted in Original.v)
axiom Original_LF__DOT__IndProp_LF_IndProp_Perm3__refl :
  ∀ (X : Type) (a b c : X),
    @Original_LF__DOT__IndProp_LF_IndProp_Perm3 X
      (Original_LF__DOT__Poly_LF_Poly_cons X a (Original_LF__DOT__Poly_LF_Poly_cons X b (Original_LF__DOT__Poly_LF_Poly_cons X c (Original_LF__DOT__Poly_LF_Poly_nil X))))
      (Original_LF__DOT__Poly_LF_Poly_cons X a (Original_LF__DOT__Poly_LF_Poly_cons X b (Original_LF__DOT__Poly_LF_Poly_cons X c (Original_LF__DOT__Poly_LF_Poly_nil X))))

-- test_tl (Admitted in Original.v)
axiom Original_LF__DOT__Lists_LF_Lists_NatList_test__tl :
  Corelib_Init_Logic_eq
    (Original_LF__DOT__Lists_LF_Lists_NatList_tl
      (Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons (nat.S nat.O)
        (Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons (nat.S (nat.S nat.O))
          (Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons (nat.S (nat.S (nat.S nat.O)))
            Original_LF__DOT__Lists_LF_Lists_NatList_natlist.nil))))
    (Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons (nat.S (nat.S nat.O))
      (Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons (nat.S (nat.S (nat.S nat.O)))
        Original_LF__DOT__Lists_LF_Lists_NatList_natlist.nil))

-- test_fold_length1 (Admitted in Original.v)
axiom Original_LF__DOT__Poly_LF_Poly_Exercises_test__fold__length1 :
  Corelib_Init_Logic_eq
    (Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length
      (Original_LF__DOT__Poly_LF_Poly_cons nat (nat.S (nat.S (nat.S (nat.S nat.O))))
        (Original_LF__DOT__Poly_LF_Poly_cons nat (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S nat.O)))))))
          (Original_LF__DOT__Poly_LF_Poly_cons nat nat.O
            (Original_LF__DOT__Poly_LF_Poly_nil nat)))))
    (nat.S (nat.S (nat.S nat.O)))

-- test_doit3times' (Admitted in Original.v)
axiom Original_LF__DOT__Poly_LF_Poly_test__doit3times' :
  Corelib_Init_Logic_eq
    (Original_LF__DOT__Poly_LF_Poly_doit3times Original_LF__DOT__Basics_LF_Basics_negb Original_LF__DOT__Basics_LF_Basics_true)
    Original_LF__DOT__Basics_LF_Basics_false

-- app_nil_r (Admitted in Original.v)
axiom Original_LF__DOT__Poly_LF_Poly_app__nil__r :
  ∀ (X : Type) (l : Original_LF__DOT__Poly_LF_Poly_list X),
    Corelib_Init_Logic_eq (Original_LF__DOT__Poly_LF_Poly_app X l (Original_LF__DOT__Poly_LF_Poly_nil X)) l

-- trans_eq_example (Admitted in Original.v)
axiom Original_LF__DOT__Tactics_LF_Tactics_trans__eq__example :
  ∀ (a b c d e f : nat),
    Corelib_Init_Logic_eq
      (Original_LF__DOT__Poly_LF_Poly_cons nat a (Original_LF__DOT__Poly_LF_Poly_cons nat b (Original_LF__DOT__Poly_LF_Poly_nil nat)))
      (Original_LF__DOT__Poly_LF_Poly_cons nat c (Original_LF__DOT__Poly_LF_Poly_cons nat d (Original_LF__DOT__Poly_LF_Poly_nil nat))) →
    Corelib_Init_Logic_eq
      (Original_LF__DOT__Poly_LF_Poly_cons nat c (Original_LF__DOT__Poly_LF_Poly_cons nat d (Original_LF__DOT__Poly_LF_Poly_nil nat)))
      (Original_LF__DOT__Poly_LF_Poly_cons nat e (Original_LF__DOT__Poly_LF_Poly_cons nat f (Original_LF__DOT__Poly_LF_Poly_nil nat))) →
    Corelib_Init_Logic_eq
      (Original_LF__DOT__Poly_LF_Poly_cons nat a (Original_LF__DOT__Poly_LF_Poly_cons nat b (Original_LF__DOT__Poly_LF_Poly_nil nat)))
      (Original_LF__DOT__Poly_LF_Poly_cons nat e (Original_LF__DOT__Poly_LF_Poly_cons nat f (Original_LF__DOT__Poly_LF_Poly_nil nat)))

-- auto_example_4 (Admitted in Original.v)
axiom Original_LF__DOT__Auto_LF_Auto_auto__example__4 :
  ∀ (P Q R : Prop), Q → (Q → R) → or P (and Q R)

-- andb3_exchange (Admitted in Original.v)
axiom Original_LF__DOT__AltAuto_LF_AltAuto_andb3__exchange :
  ∀ (b c d : Original_LF__DOT__Basics_LF_Basics_bool),
    Corelib_Init_Logic_eq
      (Original_LF__DOT__Basics_LF_Basics_andb (Original_LF__DOT__Basics_LF_Basics_andb b c) d)
      (Original_LF__DOT__Basics_LF_Basics_andb (Original_LF__DOT__Basics_LF_Basics_andb b d) c)

-- many_eq (Admitted in Original.v)
axiom Original_LF__DOT__AltAuto_LF_AltAuto_many__eq :
  ∀ (n m o p : nat),
    Corelib_Init_Logic_eq n m →
    Corelib_Init_Logic_eq o p →
    Corelib_Init_Logic_eq
      (Original_LF__DOT__Poly_LF_Poly_cons nat n (Original_LF__DOT__Poly_LF_Poly_cons nat o (Original_LF__DOT__Poly_LF_Poly_nil nat)))
      (Original_LF__DOT__Poly_LF_Poly_cons nat m (Original_LF__DOT__Poly_LF_Poly_cons nat p (Original_LF__DOT__Poly_LF_Poly_nil nat)))

-- plus_1_neq_0 (Admitted in Original.v)
axiom Original_LF__DOT__AltAuto_LF_AltAuto_plus__1__neq__0 :
  ∀ (n : nat), Corelib_Init_Logic_eq (Original_LF__DOT__Basics_LF_Basics_eqb (Nat_add n (nat.S nat.O)) nat.O) Original_LF__DOT__Basics_LF_Basics_false

-- re_opt_match (Admitted in Original.v)
axiom Original_LF__DOT__AltAuto_LF_AltAuto_re__opt__match :
  ∀ (T : Type) (re : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T) (s : Original_LF__DOT__Poly_LF_Poly_list T),
    Original_LF__DOT__IndProp_LF_IndProp_exp__match s re →
    Original_LF__DOT__IndProp_LF_IndProp_exp__match s (Original_LF__DOT__AltAuto_LF_AltAuto_re__opt re)

-- re_not_empty_correct is admitted
axiom Original_LF__DOT__IndProp_LF_IndProp_re__not__empty__correct :
  ∀ (T : Type) (re : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T),
    iff
      (Corelib_Init_Logic_eq (Original_LF__DOT__IndProp_LF_IndProp_re__not__empty re) Original_LF__DOT__Basics_LF_Basics_true)
      (ex fun s => Original_LF__DOT__IndProp_LF_IndProp_exp__match s re)

-- add_comm'' from IndPrinciples
axiom Original_LF__DOT__IndPrinciples_LF_IndPrinciples_add__comm'' :
  ∀ (n m : nat), Corelib_Init_Logic_eq (Nat_add n m) (Nat_add m n)

-- match_ex2 from AltAuto (can be proved by rfl)
theorem Original_LF__DOT__AltAuto_LF_AltAuto_match__ex2 :
  ∀ (n : nat), Corelib_Init_Logic_eq
    (match nat.S n with
     | nat.O => nat.S (nat.S nat.O)
     | nat.S n' => nat.S n')
    (nat.S n) :=
  fun _ => Corelib_Init_Logic_eq.refl _

-- natlist' from IndPrinciples
def Original_LF__DOT__IndPrinciples_LF_IndPrinciples_natlist' : Type := Original_LF__DOT__Lists_LF_Lists_NatList_natlist

-- ============================================================
-- minustwo
-- ============================================================
def Original_LF__DOT__Basics_LF_Basics_minustwo : nat → nat
  | nat.O => nat.O
  | nat.S nat.O => nat.O
  | nat.S (nat.S n') => n'

-- ============================================================
-- nonzeros: filters out zeros from a list of nats
-- ============================================================
def Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros : Original_LF__DOT__Poly_LF_Poly_list nat → Original_LF__DOT__Poly_LF_Poly_list nat
  | Original_LF__DOT__Poly_LF_Poly_list.nil => Original_LF__DOT__Poly_LF_Poly_list.nil
  | Original_LF__DOT__Poly_LF_Poly_list.cons h t => 
    match h with
    | nat.O => Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros t
    | nat.S _ => Original_LF__DOT__Poly_LF_Poly_list.cons h (Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros t)

-- nonzeros_app is Admitted in Original.v, so we axiomatize it
axiom Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros__app :
  ∀ (lst1 lst2 : Original_LF__DOT__Poly_LF_Poly_list nat),
    Corelib_Init_Logic_eq
      (Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros (Original_LF__DOT__Poly_LF_Poly_app nat lst1 lst2))
      (Original_LF__DOT__Poly_LF_Poly_app nat (Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros lst1) (Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros lst2))

-- app_nil_r is Admitted in Original.v
axiom Original_LF__DOT__AltAuto_LF_AltAuto_app__nil__r :
  ∀ (X : Type) (l : Original_LF__DOT__Poly_LF_Poly_list X),
    Corelib_Init_Logic_eq (Original_LF__DOT__Poly_LF_Poly_app X l Original_LF__DOT__Poly_LF_Poly_list.nil) l

-- ============================================================
-- ev_playground ev predicate
-- ============================================================
inductive Original_LF__DOT__IndProp_LF_IndProp_ev__playground_ev : nat → Prop where
  | ev_0 : Original_LF__DOT__IndProp_LF_IndProp_ev__playground_ev nat.O
  | ev_SS : ∀ n, Original_LF__DOT__IndProp_LF_IndProp_ev__playground_ev n → 
      Original_LF__DOT__IndProp_LF_IndProp_ev__playground_ev (nat.S (nat.S n))

def Original_LF__DOT__IndProp_LF_IndProp_ev__playground_ev_ev__0 := Original_LF__DOT__IndProp_LF_IndProp_ev__playground_ev.ev_0
def Original_LF__DOT__IndProp_LF_IndProp_ev__playground_ev_ev__SS := Original_LF__DOT__IndProp_LF_IndProp_ev__playground_ev.ev_SS

-- ev_sum is Admitted in Original.v
axiom Original_LF__DOT__IndProp_LF_IndProp_ev__sum :
  ∀ (n m : nat),
    Original_LF__DOT__IndProp_LF_IndProp_ev__playground_ev n →
    Original_LF__DOT__IndProp_LF_IndProp_ev__playground_ev m →
    Original_LF__DOT__IndProp_LF_IndProp_ev__playground_ev (Nat_add n m)

-- ============================================================
-- filter_even_gt7 (Admitted in Original.v)
-- ============================================================
axiom Original_LF__DOT__Poly_LF_Poly_filter__even__gt7 : 
  Original_LF__DOT__Poly_LF_Poly_list nat → Original_LF__DOT__Poly_LF_Poly_list nat

-- test_filter_even_gt7_1 (Admitted in Original.v)
axiom Original_LF__DOT__Poly_LF_Poly_test__filter__even__gt7__1 :
  Corelib_Init_Logic_eq
    (Original_LF__DOT__Poly_LF_Poly_filter__even__gt7
      (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S nat.O)
        (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S nat.O))
          (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S nat.O))))))
            (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S nat.O)))))))))
              (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S nat.O))))))))))
                (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S nat.O)))
                  (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S nat.O))))))))))))
                    (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S nat.O))))))))
                      Original_LF__DOT__Poly_LF_Poly_list.nil)))))))))
    (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S nat.O))))))))))
      (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S nat.O))))))))))))
        (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S nat.O))))))))
          Original_LF__DOT__Poly_LF_Poly_list.nil)))

-- ============================================================
-- rgb from IndPrinciples
-- ============================================================
inductive Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb : Type where
  | red : Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb
  | green : Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb
  | blue : Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb

def Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb_red := Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb.red
def Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb_green := Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb.green
def Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb_blue := Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb.blue

-- ============================================================
-- Perm3_ex1 and Perm3_rev (Admitted in Original.v)
-- ============================================================
axiom Original_LF__DOT__IndProp_LF_IndProp_Perm3__ex1 :
  Original_LF__DOT__IndProp_LF_IndProp_Perm3
    (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S nat.O)
      (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S nat.O))
        (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S nat.O)))
          Original_LF__DOT__Poly_LF_Poly_list.nil)))
    (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S nat.O))
      (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S nat.O)))
        (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S nat.O)
          Original_LF__DOT__Poly_LF_Poly_list.nil)))

-- Perm3_rev is a concrete proof of Perm3 [1,2,3] [3,2,1]
-- In Original.v this is Admitted
axiom Original_LF__DOT__IndProp_LF_IndProp_Perm3__rev :
  Original_LF__DOT__IndProp_LF_IndProp_Perm3
    (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S nat.O)
      (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S nat.O))
        (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S nat.O)))
          Original_LF__DOT__Poly_LF_Poly_list.nil)))
    (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S nat.O)))
      (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S nat.O))
        (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S nat.O)
          Original_LF__DOT__Poly_LF_Poly_list.nil)))

-- ============================================================
-- add_shuffle3 (Admitted in Original.v)
-- ============================================================
axiom Original_LF__DOT__Induction_LF_Induction_add__shuffle3 :
  ∀ (n m p : nat), Corelib_Init_Logic_eq (Nat_add n (Nat_add m p)) (Nat_add m (Nat_add n p))

-- ============================================================
-- fold_example3 (Admitted in Original.v)
-- ============================================================
-- fold_example3: fold app [[1];[];[2;3];[4]] [] = [1;2;3;4]
axiom Original_LF__DOT__Poly_LF_Poly_fold__example3 :
  Corelib_Init_Logic_eq
    (Original_LF__DOT__Poly_LF_Poly_fold 
      (fun (x : Original_LF__DOT__Poly_LF_Poly_list nat) (acc : Original_LF__DOT__Poly_LF_Poly_list nat) => 
        Original_LF__DOT__Poly_LF_Poly_app nat x acc)
      -- [[1];[];[2;3];[4]]
      (Original_LF__DOT__Poly_LF_Poly_list.cons 
        (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S nat.O) Original_LF__DOT__Poly_LF_Poly_list.nil)
        (Original_LF__DOT__Poly_LF_Poly_list.cons 
          Original_LF__DOT__Poly_LF_Poly_list.nil
          (Original_LF__DOT__Poly_LF_Poly_list.cons 
            (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S nat.O)) 
              (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S nat.O))) 
                Original_LF__DOT__Poly_LF_Poly_list.nil))
            (Original_LF__DOT__Poly_LF_Poly_list.cons 
              (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S (nat.S nat.O)))) 
                Original_LF__DOT__Poly_LF_Poly_list.nil)
              Original_LF__DOT__Poly_LF_Poly_list.nil))))
      Original_LF__DOT__Poly_LF_Poly_list.nil)
    -- [1;2;3;4]
    (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S nat.O)
      (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S nat.O))
        (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S nat.O)))
          (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S (nat.S nat.O))))
            Original_LF__DOT__Poly_LF_Poly_list.nil))))

-- silly1 : forall (n m : nat), n = m -> n = m
theorem Original_LF__DOT__Tactics_LF_Tactics_silly1 :
  ∀ (n m : nat), Corelib_Init_Logic_eq n m → Corelib_Init_Logic_eq n m :=
  fun _ _ h => h

-- silly4 (Admitted in Original.v)
-- forall (n m p q : nat), (n = m -> p = q) -> m = n -> q = p
axiom Original_LF__DOT__Tactics_LF_Tactics_silly4 :
  ∀ (n m p q : nat),
    (Corelib_Init_Logic_eq n m → Corelib_Init_Logic_eq p q) →
    Corelib_Init_Logic_eq m n →
    Corelib_Init_Logic_eq q p

-- discriminate_ex3 (Admitted in Original.v)
axiom Original_LF__DOT__Tactics_LF_Tactics_discriminate__ex3 :
  ∀ (X : Type) (x y z : X) (l j : Original_LF__DOT__Poly_LF_Poly_list X),
    Corelib_Init_Logic_eq 
      (Original_LF__DOT__Poly_LF_Poly_list.cons x (Original_LF__DOT__Poly_LF_Poly_list.cons y l))
      (Original_LF__DOT__Poly_LF_Poly_list.nil) →
    Corelib_Init_Logic_eq x z

-- f_equal (Admitted in Original.v)
axiom Original_LF__DOT__Tactics_LF_Tactics_f__equal :
  ∀ (A B : Type) (f : A → B) (x y : A),
    Corelib_Init_Logic_eq x y →
    Corelib_Init_Logic_eq (f x) (f y)

-- trans_eq_exercise (Admitted in Original.v)
axiom Original_LF__DOT__Tactics_LF_Tactics_trans__eq__exercise :
  ∀ (n m o p : nat),
    Corelib_Init_Logic_eq m (Original_LF__DOT__Basics_LF_Basics_minustwo o) →
    Corelib_Init_Logic_eq (Nat_add n p) m →
    Corelib_Init_Logic_eq (Nat_add n p) (Original_LF__DOT__Basics_LF_Basics_minustwo o)

