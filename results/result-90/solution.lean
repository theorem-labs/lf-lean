-- Comprehensive Lean translation merging all required definitions
set_option linter.all false
set_option autoImplicit false

-- ============================================================
-- Basic Types
-- ============================================================

-- True in Prop
inductive MyTrue : Prop where
  | intro : MyTrue

-- False in Prop (empty type)
inductive MyFalse : Prop where

-- Standard list type
inductive list (A : Type) : Type where
  | nil : list A
  | cons : A → list A → list A

def list_nil {A : Type} : list A := list.nil
def list_cons {A : Type} (x : A) (xs : list A) : list A := list.cons x xs

-- Equality in Prop (will be exported to SProp in Rocq)
inductive Corelib_Init_Logic_eq {A : Type} : A → A → Prop where
  | refl (a : A) : Corelib_Init_Logic_eq a a

-- Equality for Prop (also exported to SProp)
inductive Corelib_Init_Logic_eq_Prop {A : Prop} : A → A → Prop where
  | refl (a : A) : Corelib_Init_Logic_eq_Prop a a

-- Custom nat
inductive nat : Type where
  | O : nat
  | S : nat → nat

def _0 : nat := nat.O
def S : nat → nat := nat.S

-- Addition on nat
def PeanoNat_Nat_add : nat → nat → nat
  | nat.O, m => m
  | nat.S n, m => nat.S (PeanoNat_Nat_add n m)

-- Custom bool for Stdlib
inductive Stdlib_bool : Type where
  | true : Stdlib_bool
  | false : Stdlib_bool

-- Ascii type (8 booleans)
inductive Ascii_ascii : Type where
  | Ascii : Stdlib_bool → Stdlib_bool → Stdlib_bool → Stdlib_bool → 
            Stdlib_bool → Stdlib_bool → Stdlib_bool → Stdlib_bool → Ascii_ascii

-- Existential quantifier in Prop
inductive ex {A : Type} (P : A → Prop) : Prop where
  | intro (w : A) (h : P w) : ex P

-- Iff type
structure iff (a b : Prop) : Prop where
  intro ::
  mp : a → b
  mpr : b → a

-- And type
structure «and» (a b : Prop) : Prop where
  intro ::
  left : a
  right : b

-- ============================================================
-- String type
-- ============================================================

inductive String_string : Type where
  | EmptyString : String_string
  | String : Ascii_ascii → String_string → String_string

-- ============================================================
-- Original.LF_DOT_Basics types (letter, modifier, grade)
-- ============================================================

inductive Original_LF__DOT__Basics_LF_Basics_letter : Type where
  | A : Original_LF__DOT__Basics_LF_Basics_letter
  | B : Original_LF__DOT__Basics_LF_Basics_letter
  | C : Original_LF__DOT__Basics_LF_Basics_letter
  | D : Original_LF__DOT__Basics_LF_Basics_letter
  | F : Original_LF__DOT__Basics_LF_Basics_letter

inductive Original_LF__DOT__Basics_LF_Basics_modifier : Type where
  | Plus : Original_LF__DOT__Basics_LF_Basics_modifier
  | Natural : Original_LF__DOT__Basics_LF_Basics_modifier
  | Minus : Original_LF__DOT__Basics_LF_Basics_modifier

inductive Original_LF__DOT__Basics_LF_Basics_grade : Type where
  | Grade : Original_LF__DOT__Basics_LF_Basics_letter → Original_LF__DOT__Basics_LF_Basics_modifier → Original_LF__DOT__Basics_LF_Basics_grade

def Original_LF__DOT__Basics_LF_Basics_A : Original_LF__DOT__Basics_LF_Basics_letter := 
  Original_LF__DOT__Basics_LF_Basics_letter.A

def Original_LF__DOT__Basics_LF_Basics_Plus : Original_LF__DOT__Basics_LF_Basics_modifier := 
  Original_LF__DOT__Basics_LF_Basics_modifier.Plus

def Original_LF__DOT__Basics_LF_Basics_Natural : Original_LF__DOT__Basics_LF_Basics_modifier := 
  Original_LF__DOT__Basics_LF_Basics_modifier.Natural

def Original_LF__DOT__Basics_LF_Basics_Grade : Original_LF__DOT__Basics_LF_Basics_letter → Original_LF__DOT__Basics_LF_Basics_modifier → Original_LF__DOT__Basics_LF_Basics_grade :=
  Original_LF__DOT__Basics_LF_Basics_grade.Grade

-- lower_grade is Admitted in Original.v
axiom Original_LF__DOT__Basics_LF_Basics_lower__grade : Original_LF__DOT__Basics_LF_Basics_grade → Original_LF__DOT__Basics_LF_Basics_grade

-- lower_grade_A_Plus is Admitted in Original.v
axiom Original_LF__DOT__Basics_LF_Basics_lower__grade__A__Plus : 
  Corelib_Init_Logic_eq 
    (Original_LF__DOT__Basics_LF_Basics_lower__grade 
       (Original_LF__DOT__Basics_LF_Basics_Grade Original_LF__DOT__Basics_LF_Basics_A Original_LF__DOT__Basics_LF_Basics_Plus))
    (Original_LF__DOT__Basics_LF_Basics_Grade Original_LF__DOT__Basics_LF_Basics_A Original_LF__DOT__Basics_LF_Basics_Natural)

-- ============================================================
-- Original.LF_DOT_Poly types (list)
-- ============================================================

inductive Original_LF__DOT__Poly_LF_Poly_list (X : Type) : Type where
  | nil : Original_LF__DOT__Poly_LF_Poly_list X
  | cons : X → Original_LF__DOT__Poly_LF_Poly_list X → Original_LF__DOT__Poly_LF_Poly_list X

def Original_LF__DOT__Poly_LF_Poly_nil (X : Type) : Original_LF__DOT__Poly_LF_Poly_list X :=
  Original_LF__DOT__Poly_LF_Poly_list.nil

def Original_LF__DOT__Poly_LF_Poly_cons (X : Type) (x : X) (xs : Original_LF__DOT__Poly_LF_Poly_list X) : Original_LF__DOT__Poly_LF_Poly_list X :=
  Original_LF__DOT__Poly_LF_Poly_list.cons x xs

def Original_LF__DOT__Poly_LF_Poly_app (X : Type) (l1 l2 : Original_LF__DOT__Poly_LF_Poly_list X) : Original_LF__DOT__Poly_LF_Poly_list X :=
  match l1 with
  | .nil => l2
  | .cons x xs => .cons x (Original_LF__DOT__Poly_LF_Poly_app X xs l2)

-- ============================================================
-- Original.LF_DOT_Lists.LF.Lists.NatList types
-- ============================================================

inductive Original_LF__DOT__Lists_LF_Lists_NatList_natlist : Type where
  | nil : Original_LF__DOT__Lists_LF_Lists_NatList_natlist
  | cons : nat → Original_LF__DOT__Lists_LF_Lists_NatList_natlist → Original_LF__DOT__Lists_LF_Lists_NatList_natlist

def Original_LF__DOT__Lists_LF_Lists_NatList_nil : Original_LF__DOT__Lists_LF_Lists_NatList_natlist :=
  Original_LF__DOT__Lists_LF_Lists_NatList_natlist.nil

def Original_LF__DOT__Lists_LF_Lists_NatList_cons : nat → Original_LF__DOT__Lists_LF_Lists_NatList_natlist → Original_LF__DOT__Lists_LF_Lists_NatList_natlist :=
  Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons

def Original_LF__DOT__Lists_LF_Lists_NatList_app : Original_LF__DOT__Lists_LF_Lists_NatList_natlist → Original_LF__DOT__Lists_LF_Lists_NatList_natlist → Original_LF__DOT__Lists_LF_Lists_NatList_natlist
  | Original_LF__DOT__Lists_LF_Lists_NatList_natlist.nil, l2 => l2
  | Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons h t, l2 => 
      Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons h (Original_LF__DOT__Lists_LF_Lists_NatList_app t l2)

def Original_LF__DOT__Lists_LF_Lists_NatList_rev : Original_LF__DOT__Lists_LF_Lists_NatList_natlist → Original_LF__DOT__Lists_LF_Lists_NatList_natlist
  | Original_LF__DOT__Lists_LF_Lists_NatList_natlist.nil => Original_LF__DOT__Lists_LF_Lists_NatList_natlist.nil
  | Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons h t => 
      Original_LF__DOT__Lists_LF_Lists_NatList_app 
        (Original_LF__DOT__Lists_LF_Lists_NatList_rev t) 
        (Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons h Original_LF__DOT__Lists_LF_Lists_NatList_natlist.nil)

-- alternate is Admitted in Original.v
axiom Original_LF__DOT__Lists_LF_Lists_NatList_alternate : 
  Original_LF__DOT__Lists_LF_Lists_NatList_natlist → 
  Original_LF__DOT__Lists_LF_Lists_NatList_natlist → 
  Original_LF__DOT__Lists_LF_Lists_NatList_natlist

-- rev_injective is Admitted in Original.v
axiom Original_LF__DOT__Lists_LF_Lists_NatList_rev__injective : 
  ∀ (l1 l2 : Original_LF__DOT__Lists_LF_Lists_NatList_natlist),
    Corelib_Init_Logic_eq (Original_LF__DOT__Lists_LF_Lists_NatList_rev l1) (Original_LF__DOT__Lists_LF_Lists_NatList_rev l2) →
    Corelib_Init_Logic_eq l1 l2

-- test_alternate4 is Admitted in Original.v
-- test_alternate4 : alternate [] [20;30] = [20;30]
axiom Original_LF__DOT__Lists_LF_Lists_NatList_test__alternate4 : 
  Corelib_Init_Logic_eq
    (Original_LF__DOT__Lists_LF_Lists_NatList_alternate
       Original_LF__DOT__Lists_LF_Lists_NatList_nil
       (Original_LF__DOT__Lists_LF_Lists_NatList_cons (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S _0))))))))))))))))))))
          (Original_LF__DOT__Lists_LF_Lists_NatList_cons (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S _0))))))))))))))))))))))))))))))
             Original_LF__DOT__Lists_LF_Lists_NatList_nil)))
    (Original_LF__DOT__Lists_LF_Lists_NatList_cons (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S _0))))))))))))))))))))
       (Original_LF__DOT__Lists_LF_Lists_NatList_cons (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S _0))))))))))))))))))))))))))))))
          Original_LF__DOT__Lists_LF_Lists_NatList_nil))

-- ============================================================
-- Original.LF_DOT_Imp types
-- ============================================================

-- aexp type (arithmetic expressions)
inductive Original_LF__DOT__Imp_LF_Imp_aexp : Type where
  | ANum : nat → Original_LF__DOT__Imp_LF_Imp_aexp
  | AId : String_string → Original_LF__DOT__Imp_LF_Imp_aexp
  | APlus : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp
  | AMinus : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp
  | AMult : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp

def Original_LF__DOT__Imp_LF_Imp_ANum := Original_LF__DOT__Imp_LF_Imp_aexp.ANum
def Original_LF__DOT__Imp_LF_Imp_AId := Original_LF__DOT__Imp_LF_Imp_aexp.AId
def Original_LF__DOT__Imp_LF_Imp_APlus := Original_LF__DOT__Imp_LF_Imp_aexp.APlus
def Original_LF__DOT__Imp_LF_Imp_AMinus := Original_LF__DOT__Imp_LF_Imp_aexp.AMinus

-- bexp type (boolean expressions)
inductive Original_LF__DOT__Imp_LF_Imp_bexp : Type where
  | BTrue : Original_LF__DOT__Imp_LF_Imp_bexp
  | BFalse : Original_LF__DOT__Imp_LF_Imp_bexp
  | BEq : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_bexp
  | BNeq : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_bexp
  | BLe : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_bexp
  | BGt : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_bexp
  | BNot : Original_LF__DOT__Imp_LF_Imp_bexp → Original_LF__DOT__Imp_LF_Imp_bexp
  | BAnd : Original_LF__DOT__Imp_LF_Imp_bexp → Original_LF__DOT__Imp_LF_Imp_bexp → Original_LF__DOT__Imp_LF_Imp_bexp

-- com type (commands)
inductive Original_LF__DOT__Imp_LF_Imp_com : Type where
  | CSkip : Original_LF__DOT__Imp_LF_Imp_com
  | CAsgn : String_string → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_com
  | CSeq : Original_LF__DOT__Imp_LF_Imp_com → Original_LF__DOT__Imp_LF_Imp_com → Original_LF__DOT__Imp_LF_Imp_com
  | CIf : Original_LF__DOT__Imp_LF_Imp_bexp → Original_LF__DOT__Imp_LF_Imp_com → Original_LF__DOT__Imp_LF_Imp_com → Original_LF__DOT__Imp_LF_Imp_com
  | CWhile : Original_LF__DOT__Imp_LF_Imp_bexp → Original_LF__DOT__Imp_LF_Imp_com → Original_LF__DOT__Imp_LF_Imp_com

def Original_LF__DOT__Imp_LF_Imp_CAsgn := Original_LF__DOT__Imp_LF_Imp_com.CAsgn
def Original_LF__DOT__Imp_LF_Imp_CSeq := Original_LF__DOT__Imp_LF_Imp_com.CSeq
def Original_LF__DOT__Imp_LF_Imp_CWhile := Original_LF__DOT__Imp_LF_Imp_com.CWhile

-- Variable names X, Y, Z as strings
-- "X" = Ascii 88 = 01011000
def charX : Ascii_ascii := Ascii_ascii.Ascii Stdlib_bool.false Stdlib_bool.false Stdlib_bool.false Stdlib_bool.true Stdlib_bool.true Stdlib_bool.false Stdlib_bool.true Stdlib_bool.false
-- "Y" = Ascii 89 = 01011001
def charY : Ascii_ascii := Ascii_ascii.Ascii Stdlib_bool.true Stdlib_bool.false Stdlib_bool.false Stdlib_bool.true Stdlib_bool.true Stdlib_bool.false Stdlib_bool.true Stdlib_bool.false
-- "Z" = Ascii 90 = 01011010
def charZ : Ascii_ascii := Ascii_ascii.Ascii Stdlib_bool.false Stdlib_bool.true Stdlib_bool.false Stdlib_bool.true Stdlib_bool.true Stdlib_bool.false Stdlib_bool.true Stdlib_bool.false

def Original_LF__DOT__Imp_LF_Imp_X : String_string := String_string.String charX String_string.EmptyString
def Original_LF__DOT__Imp_LF_Imp_Y : String_string := String_string.String charY String_string.EmptyString
def Original_LF__DOT__Imp_LF_Imp_Z : String_string := String_string.String charZ String_string.EmptyString

-- subtract_slowly_body: Z := Z - 1; X := X - 1
def Original_LF__DOT__Imp_LF_Imp_subtract__slowly__body : Original_LF__DOT__Imp_LF_Imp_com :=
  Original_LF__DOT__Imp_LF_Imp_com.CSeq
    (Original_LF__DOT__Imp_LF_Imp_com.CAsgn 
      Original_LF__DOT__Imp_LF_Imp_Z
      (Original_LF__DOT__Imp_LF_Imp_aexp.AMinus 
        (Original_LF__DOT__Imp_LF_Imp_aexp.AId Original_LF__DOT__Imp_LF_Imp_Z)
        (Original_LF__DOT__Imp_LF_Imp_aexp.ANum (S _0))))
    (Original_LF__DOT__Imp_LF_Imp_com.CAsgn
      Original_LF__DOT__Imp_LF_Imp_X
      (Original_LF__DOT__Imp_LF_Imp_aexp.AMinus
        (Original_LF__DOT__Imp_LF_Imp_aexp.AId Original_LF__DOT__Imp_LF_Imp_X)
        (Original_LF__DOT__Imp_LF_Imp_aexp.ANum (S _0))))

-- subtract_slowly: while X <> 0 do subtract_slowly_body end
def Original_LF__DOT__Imp_LF_Imp_subtract__slowly : Original_LF__DOT__Imp_LF_Imp_com :=
  Original_LF__DOT__Imp_LF_Imp_com.CWhile
    (Original_LF__DOT__Imp_LF_Imp_bexp.BNeq
      (Original_LF__DOT__Imp_LF_Imp_aexp.AId Original_LF__DOT__Imp_LF_Imp_X)
      (Original_LF__DOT__Imp_LF_Imp_aexp.ANum _0))
    Original_LF__DOT__Imp_LF_Imp_subtract__slowly__body

-- subtract_3_from_5_slowly: X := 3; Z := 5; subtract_slowly
def Original_LF__DOT__Imp_LF_Imp_subtract__3__from__5__slowly : Original_LF__DOT__Imp_LF_Imp_com :=
  Original_LF__DOT__Imp_LF_Imp_com.CSeq
    (Original_LF__DOT__Imp_LF_Imp_com.CAsgn
      Original_LF__DOT__Imp_LF_Imp_X
      (Original_LF__DOT__Imp_LF_Imp_aexp.ANum (S (S (S _0))))) -- 3
    (Original_LF__DOT__Imp_LF_Imp_com.CSeq
      (Original_LF__DOT__Imp_LF_Imp_com.CAsgn
        Original_LF__DOT__Imp_LF_Imp_Z
        (Original_LF__DOT__Imp_LF_Imp_aexp.ANum (S (S (S (S (S _0))))))) -- 5
      Original_LF__DOT__Imp_LF_Imp_subtract__slowly)

-- add_comm__lia is Admitted in Original.v
axiom Original_LF__DOT__Imp_LF_Imp_AExp_add__comm____lia : 
  ∀ (x x0 : nat), Corelib_Init_Logic_eq (PeanoNat_Nat_add x x0) (PeanoNat_Nat_add x0 x)

-- ============================================================
-- Original.LF_DOT_IndProp types (reg_exp, exp_match, derive)
-- ============================================================

-- Regular expression type
inductive Original_LF__DOT__IndProp_LF_IndProp_reg__exp (T : Type) : Type where
  | EmptySet : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T
  | EmptyStr : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T
  | Char : T → Original_LF__DOT__IndProp_LF_IndProp_reg__exp T
  | App : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T → Original_LF__DOT__IndProp_LF_IndProp_reg__exp T → Original_LF__DOT__IndProp_LF_IndProp_reg__exp T
  | Union : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T → Original_LF__DOT__IndProp_LF_IndProp_reg__exp T → Original_LF__DOT__IndProp_LF_IndProp_reg__exp T
  | Star : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T → Original_LF__DOT__IndProp_LF_IndProp_reg__exp T

def Original_LF__DOT__IndProp_LF_IndProp_EmptySet (T : Type) : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T := Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptySet
def Original_LF__DOT__IndProp_LF_IndProp_EmptyStr (T : Type) : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T := Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptyStr
def Original_LF__DOT__IndProp_LF_IndProp_Char (T : Type) (t : T) : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T := Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Char t
def Original_LF__DOT__IndProp_LF_IndProp_App (T : Type) (r1 r2 : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T) : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T := Original_LF__DOT__IndProp_LF_IndProp_reg__exp.App r1 r2
def Original_LF__DOT__IndProp_LF_IndProp_Union (T : Type) (r1 r2 : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T) : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T := Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Union r1 r2
def Original_LF__DOT__IndProp_LF_IndProp_Star (T : Type) (r : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T) : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T := Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Star r

-- string type alias
def Original_LF__DOT__IndProp_LF_IndProp_string : Type := Original_LF__DOT__Poly_LF_Poly_list Ascii_ascii

-- exp_match inductive predicate
inductive Original_LF__DOT__IndProp_LF_IndProp_exp__match {T : Type} : Original_LF__DOT__Poly_LF_Poly_list T → Original_LF__DOT__IndProp_LF_IndProp_reg__exp T → Prop where
  | MEmpty : Original_LF__DOT__IndProp_LF_IndProp_exp__match (Original_LF__DOT__Poly_LF_Poly_list.nil) (Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptyStr)
  | MChar (x : T) : Original_LF__DOT__IndProp_LF_IndProp_exp__match (Original_LF__DOT__Poly_LF_Poly_list.cons x Original_LF__DOT__Poly_LF_Poly_list.nil) (Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Char x)
  | MApp (s1 s2 : Original_LF__DOT__Poly_LF_Poly_list T) (re1 re2 : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T)
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

-- is_der: a character derivative relation
def Original_LF__DOT__IndProp_LF_IndProp_is__der 
    (re : Original_LF__DOT__IndProp_LF_IndProp_reg__exp Ascii_ascii)
    (a : Ascii_ascii)
    (re' : Original_LF__DOT__IndProp_LF_IndProp_reg__exp Ascii_ascii) : Prop :=
  ∀ (s : Original_LF__DOT__Poly_LF_Poly_list Ascii_ascii),
    iff (Original_LF__DOT__IndProp_LF_IndProp_exp__match (Original_LF__DOT__Poly_LF_Poly_list.cons a s) re)
        (Original_LF__DOT__IndProp_LF_IndProp_exp__match s re')

-- derives: a derivative function is correct
def Original_LF__DOT__IndProp_LF_IndProp_derives 
    (d : Ascii_ascii → Original_LF__DOT__IndProp_LF_IndProp_reg__exp Ascii_ascii → Original_LF__DOT__IndProp_LF_IndProp_reg__exp Ascii_ascii) : Prop :=
  ∀ (a : Ascii_ascii) (re : Original_LF__DOT__IndProp_LF_IndProp_reg__exp Ascii_ascii),
    Original_LF__DOT__IndProp_LF_IndProp_is__der re a (d a re)

-- derive function (axiom since Admitted in Original.v)
axiom Original_LF__DOT__IndProp_LF_IndProp_derive : 
  Ascii_ascii → Original_LF__DOT__IndProp_LF_IndProp_reg__exp Ascii_ascii → Original_LF__DOT__IndProp_LF_IndProp_reg__exp Ascii_ascii

-- derive_corr (axiom since Admitted in Original.v)
axiom Original_LF__DOT__IndProp_LF_IndProp_derive__corr :
  ∀ (x : Ascii_ascii) (x0 : Original_LF__DOT__IndProp_LF_IndProp_reg__exp Ascii_ascii) 
    (x1 : Original_LF__DOT__Poly_LF_Poly_list Ascii_ascii),
  iff (Original_LF__DOT__IndProp_LF_IndProp_exp__match (Original_LF__DOT__Poly_LF_Poly_list.cons x x1) x0)
      (Original_LF__DOT__IndProp_LF_IndProp_exp__match x1 (Original_LF__DOT__IndProp_LF_IndProp_derive x x0))

-- app_exists (axiom since Admitted in Original.v)
-- s =~ App re0 re1 <-> exists s0 s1, s = s0 ++ s1 /\ s0 =~ re0 /\ s1 =~ re1
axiom Original_LF__DOT__IndProp_LF_IndProp_app__exists :
  ∀ (s : Original_LF__DOT__Poly_LF_Poly_list Ascii_ascii) 
    (re0 re1 : Original_LF__DOT__IndProp_LF_IndProp_reg__exp Ascii_ascii),
  iff (Original_LF__DOT__IndProp_LF_IndProp_exp__match s (Original_LF__DOT__IndProp_LF_IndProp_reg__exp.App re0 re1))
      (ex (fun s0 : Original_LF__DOT__Poly_LF_Poly_list Ascii_ascii =>
        ex (fun s1 : Original_LF__DOT__Poly_LF_Poly_list Ascii_ascii =>
          «and» (Corelib_Init_Logic_eq s (Original_LF__DOT__Poly_LF_Poly_app Ascii_ascii s0 s1))
                («and» (Original_LF__DOT__IndProp_LF_IndProp_exp__match s0 re0)
                       (Original_LF__DOT__IndProp_LF_IndProp_exp__match s1 re1)))))

-- char_eps_suffix (axiom since Admitted in Original.v)
-- a :: s =~ Char a <-> s = [ ]
axiom Original_LF__DOT__IndProp_LF_IndProp_char__eps__suffix :
  ∀ (a : Ascii_ascii) (s : Original_LF__DOT__Poly_LF_Poly_list Ascii_ascii),
  iff (Original_LF__DOT__IndProp_LF_IndProp_exp__match (Original_LF__DOT__Poly_LF_Poly_list.cons a s) (Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Char a))
      (Corelib_Init_Logic_eq s Original_LF__DOT__Poly_LF_Poly_list.nil)

-- empty_matches_eps (axiom since Admitted in Original.v)
-- s =~ EmptyStr <-> s = [ ]
axiom Original_LF__DOT__IndProp_LF_IndProp_empty__matches__eps :
  ∀ (s : Original_LF__DOT__Poly_LF_Poly_list Ascii_ascii),
  iff (Original_LF__DOT__IndProp_LF_IndProp_exp__match s Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptyStr)
      (Corelib_Init_Logic_eq s Original_LF__DOT__Poly_LF_Poly_list.nil)

-- ============================================================
-- Original.LF_DOT_ProofObjects and IndPrinciples (ev, ev')
-- ============================================================

-- The ev predicate: ev n holds when n is even
inductive Original_LF__DOT__ProofObjects_LF_ProofObjects_ev : nat → Prop where
  | ev_0 : Original_LF__DOT__ProofObjects_LF_ProofObjects_ev nat.O
  | ev_SS : ∀ (n : nat), Original_LF__DOT__ProofObjects_LF_ProofObjects_ev n → Original_LF__DOT__ProofObjects_LF_ProofObjects_ev (nat.S (nat.S n))

-- The ev' predicate: alternative definition of evenness
inductive Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev' : nat → Prop where
  | ev'_0 : Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev' nat.O
  | ev'_2 : Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev' (nat.S (nat.S nat.O))
  | ev'_sum : ∀ (n m : nat), Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev' n → Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev' m → Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev' (PeanoNat_Nat_add n m)

-- ev_ev' is Admitted in Original.v
axiom Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev__ev' : ∀ (n : nat), Original_LF__DOT__ProofObjects_LF_ProofObjects_ev n → Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev' n

-- ============================================================
-- Original.LF_DOT_Auto (silly2_fixed)
-- ============================================================

-- silly2_fixed is Admitted in Original.v
axiom Original_LF__DOT__Auto_LF_Auto_silly2__fixed :
  ∀ (P : nat → nat → Prop) (Q : nat → Prop),
    ex (fun y : nat => P (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S _0)))))))))))))))))))))))))))))))))))))))))) y) →
    (∀ x y : nat, P x y → Q x) →
    Q (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S _0))))))))))))))))))))))))))))))))))))))))))


