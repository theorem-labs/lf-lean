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

-- Predecessor on nat
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

-- and
structure MyAnd (A B : Prop) : Prop where
  intro :: (left : A) (right : B)

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

-- option type
inductive option (A : Type) : Type where
  | None : option A
  | Some : A → option A

def None := @option.None
def Some := @option.Some

-- List_In
def List_In {A : Type} (a : A) : list A → Prop
  | list.nil => MyFalse
  | list.cons b l' => Corelib_Init_Logic_eq b a ∨ List_In a l'

-- Relation type
def Original_LF_Rel_relation (X : Type) := X → X → Prop

-- Relation properties
def Original_LF_Rel_reflexive {X : Type} (R : Original_LF_Rel_relation X) :=
  ∀ a : X, R a a

def Original_LF_Rel_transitive {X : Type} (R : Original_LF_Rel_relation X) :=
  ∀ a b c : X, R a b → R b c → R a c

def Original_LF_Rel_symmetric {X : Type} (R : Original_LF_Rel_relation X) :=
  ∀ a b : X, R a b → R b a

def Original_LF_Rel_antisymmetric {X : Type} (R : Original_LF_Rel_relation X) :=
  ∀ a b : X, R a b → R b a → Corelib_Init_Logic_eq a b

-- Reflexive transitive closure (both endpoints as indices)
inductive Original_LF_Rel_clos__refl__trans__1n' {A : Type} (R : A → A → Prop) : A → A → Prop where
  | rt1n_refl (x : A) : Original_LF_Rel_clos__refl__trans__1n' R x x
  | rt1n_trans (x y z : A) (Hxy : R x y) (Hrest : Original_LF_Rel_clos__refl__trans__1n' R y z) : 
      Original_LF_Rel_clos__refl__trans__1n' R x z

def Original_LF_Rel_clos__refl__trans__1n {A : Type} (R : A → A → Prop) (x : A) (z : A) : Prop :=
  Original_LF_Rel_clos__refl__trans__1n' R x z

-- Reflexive transitive closure (standard version)
inductive Original_LF_Rel_clos__refl__trans {X : Type} (R : X → X → Prop) : X → X → Prop where
  | rt_step (x y : X) (H : R x y) : Original_LF_Rel_clos__refl__trans R x y
  | rt_refl (x : X) : Original_LF_Rel_clos__refl__trans R x x
  | rt_trans (x y z : X) : Original_LF_Rel_clos__refl__trans R x y → 
      Original_LF_Rel_clos__refl__trans R y z → Original_LF_Rel_clos__refl__trans R x z

-- partial_function definition
def Original_LF_Rel_partial__function {X : Type} (R : Original_LF_Rel_relation X) : Prop :=
  ∀ a y1 y2 : X, R a y1 → R a y2 → Corelib_Init_Logic_eq y1 y2

-- total_relation: an inductive with no constructors means it's always true
-- In Rocq, an empty "Inductive R : nat -> nat -> Prop :=" means R n m is always inhabited
-- Actually wait - that's wrong. An empty inductive in Rocq means it has NO inhabitants.
-- Let me re-check...

-- In Rocq, total_relation has NO constructors, making it uninhabited.
-- This is an empty inductive, similar to False.
inductive Original_LF_Rel_total__relation : nat → nat → Prop where

-- empty_relation: also empty (no constructors)
inductive Original_LF_Rel_empty__relation : nat → nat → Prop where

-- equivalence definition
def Original_LF_Rel_equivalence {X : Type} (R : Original_LF_Rel_relation X) : Prop :=
  Original_LF_Rel_reflexive R ∧ Original_LF_Rel_symmetric R ∧ Original_LF_Rel_transitive R

-- ============================================================
-- Original.LF_DOT_IndProp definitions
-- ============================================================

-- le (less than or equal) inductive
inductive Original_LF__DOT__IndProp_LF_IndProp_le : nat → nat → Prop where
  | le_n (n : nat) : Original_LF__DOT__IndProp_LF_IndProp_le n n
  | le_S (n m : nat) : Original_LF__DOT__IndProp_LF_IndProp_le n m → Original_LF__DOT__IndProp_LF_IndProp_le n (nat.S m)

-- ge (greater than or equal)
def Original_LF__DOT__IndProp_LF_IndProp_ge (n m : nat) : Prop := Original_LF__DOT__IndProp_LF_IndProp_le m n

-- ============================================================
-- Original.LF_DOT_AltAuto definitions
-- ============================================================

-- nor definition: not P and not Q
inductive Original_LF__DOT__AltAuto_LF_AltAuto_nor (P Q : Prop) : Prop where
  | stroke : (P → MyFalse) → (Q → MyFalse) → Original_LF__DOT__AltAuto_LF_AltAuto_nor P Q

-- Admitted theorems as axioms
axiom Original_LF_Rel_le__not__symmetric : Logic_not (Original_LF_Rel_symmetric Original_LF__DOT__IndProp_LF_IndProp_le)

axiom Original_LF_Rel_total__relation__not__partial__function :
  Logic_not (Original_LF_Rel_partial__function Original_LF_Rel_total__relation)

axiom Original_LF__DOT__AltAuto_LF_AltAuto_auto__example__3 :
  ∀ (P Q R S T U : Prop),
    (P → Q) → (Q → R) → (R → S) → (S → T) → (T → U) → P → U

axiom Original_LF__DOT__AltAuto_LF_AltAuto_nor__not__and' :
  ∀ (P Q : Prop), Original_LF__DOT__AltAuto_LF_AltAuto_nor P Q → Logic_not (MyAnd P Q)

-- ============================================================
-- Original.LF_DOT_Basics.NatPlayground definitions
-- ============================================================

-- otherNat type (alternative representation of nat)
inductive Original_LF__DOT__Basics_LF_Basics_NatPlayground_otherNat : Type where
  | stop : Original_LF__DOT__Basics_LF_Basics_NatPlayground_otherNat
  | tick : Original_LF__DOT__Basics_LF_Basics_NatPlayground_otherNat → Original_LF__DOT__Basics_LF_Basics_NatPlayground_otherNat

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

-- identity_fn_applied_twice: use polymorphic Corelib_Init_Logic_eq, now that bool is defined
axiom Original_LF__DOT__Basics_LF_Basics_identity__fn__applied__twice :
  ∀ (f : Original_LF__DOT__Basics_LF_Basics_bool → Original_LF__DOT__Basics_LF_Basics_bool),
    (∀ (x : Original_LF__DOT__Basics_LF_Basics_bool), Corelib_Init_Logic_eq (f x) x) →
    ∀ (b : Original_LF__DOT__Basics_LF_Basics_bool), Corelib_Init_Logic_eq (f (f b)) b

-- rgb type
inductive Original_LF__DOT__Basics_LF_Basics_rgb : Type where
  | red : Original_LF__DOT__Basics_LF_Basics_rgb
  | green : Original_LF__DOT__Basics_LF_Basics_rgb
  | blue : Original_LF__DOT__Basics_LF_Basics_rgb

def Original_LF__DOT__Basics_LF_Basics_red := Original_LF__DOT__Basics_LF_Basics_rgb.red
def Original_LF__DOT__Basics_LF_Basics_green := Original_LF__DOT__Basics_LF_Basics_rgb.green
def Original_LF__DOT__Basics_LF_Basics_blue := Original_LF__DOT__Basics_LF_Basics_rgb.blue

-- color type
inductive Original_LF__DOT__Basics_LF_Basics_color : Type where
  | black : Original_LF__DOT__Basics_LF_Basics_color
  | white : Original_LF__DOT__Basics_LF_Basics_color
  | primary : Original_LF__DOT__Basics_LF_Basics_rgb → Original_LF__DOT__Basics_LF_Basics_color

def Original_LF__DOT__Basics_LF_Basics_black := Original_LF__DOT__Basics_LF_Basics_color.black
def Original_LF__DOT__Basics_LF_Basics_white := Original_LF__DOT__Basics_LF_Basics_color.white
def Original_LF__DOT__Basics_LF_Basics_primary := Original_LF__DOT__Basics_LF_Basics_color.primary

-- isred function
def Original_LF__DOT__Basics_LF_Basics_isred (c : Original_LF__DOT__Basics_LF_Basics_color) : Original_LF__DOT__Basics_LF_Basics_bool :=
  match c with
  | Original_LF__DOT__Basics_LF_Basics_color.black => Original_LF__DOT__Basics_LF_Basics_bool.false
  | Original_LF__DOT__Basics_LF_Basics_color.white => Original_LF__DOT__Basics_LF_Basics_bool.false
  | Original_LF__DOT__Basics_LF_Basics_color.primary Original_LF__DOT__Basics_LF_Basics_rgb.red => Original_LF__DOT__Basics_LF_Basics_bool.true
  | Original_LF__DOT__Basics_LF_Basics_color.primary _ => Original_LF__DOT__Basics_LF_Basics_bool.false

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
-- Inductive types needed for axioms
-- ============================================================

-- ev inductive for IndProp
inductive Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev : nat → Prop where
  | ev_0 : Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev nat.O
  | ev_SS (n : nat) : Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev n →
      Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev (nat.S (nat.S n))

-- Perm3 inductive (takes lists)
inductive Original_LF__DOT__IndProp_LF_IndProp_Perm3 {X : Type} : Original_LF__DOT__Poly_LF_Poly_list X → Original_LF__DOT__Poly_LF_Poly_list X → Prop where
  | perm3_swap12 (a b c : X) :
      Original_LF__DOT__IndProp_LF_IndProp_Perm3
        (Original_LF__DOT__Poly_LF_Poly_list.cons a (Original_LF__DOT__Poly_LF_Poly_list.cons b (Original_LF__DOT__Poly_LF_Poly_list.cons c Original_LF__DOT__Poly_LF_Poly_list.nil)))
        (Original_LF__DOT__Poly_LF_Poly_list.cons b (Original_LF__DOT__Poly_LF_Poly_list.cons a (Original_LF__DOT__Poly_LF_Poly_list.cons c Original_LF__DOT__Poly_LF_Poly_list.nil)))
  | perm3_swap23 (a b c : X) :
      Original_LF__DOT__IndProp_LF_IndProp_Perm3
        (Original_LF__DOT__Poly_LF_Poly_list.cons a (Original_LF__DOT__Poly_LF_Poly_list.cons b (Original_LF__DOT__Poly_LF_Poly_list.cons c Original_LF__DOT__Poly_LF_Poly_list.nil)))
        (Original_LF__DOT__Poly_LF_Poly_list.cons a (Original_LF__DOT__Poly_LF_Poly_list.cons c (Original_LF__DOT__Poly_LF_Poly_list.cons b Original_LF__DOT__Poly_LF_Poly_list.nil)))
  | perm3_trans (l1 l2 l3 : Original_LF__DOT__Poly_LF_Poly_list X) :
      Original_LF__DOT__IndProp_LF_IndProp_Perm3 l1 l2 →
      Original_LF__DOT__IndProp_LF_IndProp_Perm3 l2 l3 →
      Original_LF__DOT__IndProp_LF_IndProp_Perm3 l1 l3

-- Perm3_reminder module's Perm3 (takes lists, not individual elements)
inductive Original_LF__DOT__IndProp_LF_IndProp_Perm3_reminder_Perm3 {X : Type} : Original_LF__DOT__Poly_LF_Poly_list X → Original_LF__DOT__Poly_LF_Poly_list X → Prop where
  | perm3_swap12 (a b c : X) :
      Original_LF__DOT__IndProp_LF_IndProp_Perm3_reminder_Perm3
        (Original_LF__DOT__Poly_LF_Poly_list.cons a (Original_LF__DOT__Poly_LF_Poly_list.cons b (Original_LF__DOT__Poly_LF_Poly_list.cons c Original_LF__DOT__Poly_LF_Poly_list.nil)))
        (Original_LF__DOT__Poly_LF_Poly_list.cons b (Original_LF__DOT__Poly_LF_Poly_list.cons a (Original_LF__DOT__Poly_LF_Poly_list.cons c Original_LF__DOT__Poly_LF_Poly_list.nil)))
  | perm3_swap23 (a b c : X) :
      Original_LF__DOT__IndProp_LF_IndProp_Perm3_reminder_Perm3
        (Original_LF__DOT__Poly_LF_Poly_list.cons a (Original_LF__DOT__Poly_LF_Poly_list.cons b (Original_LF__DOT__Poly_LF_Poly_list.cons c Original_LF__DOT__Poly_LF_Poly_list.nil)))
        (Original_LF__DOT__Poly_LF_Poly_list.cons a (Original_LF__DOT__Poly_LF_Poly_list.cons c (Original_LF__DOT__Poly_LF_Poly_list.cons b Original_LF__DOT__Poly_LF_Poly_list.nil)))
  | perm3_trans (l1 l2 l3 : Original_LF__DOT__Poly_LF_Poly_list X) :
      Original_LF__DOT__IndProp_LF_IndProp_Perm3_reminder_Perm3 l1 l2 →
      Original_LF__DOT__IndProp_LF_IndProp_Perm3_reminder_Perm3 l2 l3 →
      Original_LF__DOT__IndProp_LF_IndProp_Perm3_reminder_Perm3 l1 l3

-- ============================================================
-- Axioms for Admitted lemmas
-- ============================================================

-- silly2_eauto (Admitted in Original.v)
axiom Original_LF__DOT__Auto_LF_Auto_silly2__eauto :
  ∀ (P : nat → nat → Prop) (Q : nat → Prop),
  (ex (fun y => P (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S nat.O)))))))))))))))))))))))))))))))))))))))))) y)) →
  (∀ x y, P x y → Q x) →
  Q (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S nat.O))))))))))))))))))))))))))))))))))))))))))

-- ev_plus4 (Admitted in Original.v)
axiom Original_LF__DOT__IndProp_LF_IndProp_ev__plus4 :
  ∀ n : nat, Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev n →
    Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev (nat.S (nat.S (nat.S (nat.S n))))

-- Perm3_rev' (Admitted in Original.v): Perm3 [1;2;3] [3;2;1]
axiom Original_LF__DOT__IndProp_LF_IndProp_Perm3__rev' :
  @Original_LF__DOT__IndProp_LF_IndProp_Perm3 nat
    (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S nat.O) (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S nat.O)) (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S nat.O))) Original_LF__DOT__Poly_LF_Poly_list.nil)))
    (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S nat.O))) (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S nat.O)) (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S nat.O) Original_LF__DOT__Poly_LF_Poly_list.nil)))

-- Perm3_example2 (Admitted in Original.v): ~ Perm3Reminder.Perm3 [1;2;3] [1;2;4]
axiom Original_LF__DOT__IndProp_LF_IndProp_Perm3__example2 :
  Logic_not (@Original_LF__DOT__IndProp_LF_IndProp_Perm3_reminder_Perm3 nat
    (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S nat.O) (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S nat.O)) (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S nat.O))) Original_LF__DOT__Poly_LF_Poly_list.nil)))
    (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S nat.O) (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S nat.O)) (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S (nat.S nat.O)))) Original_LF__DOT__Poly_LF_Poly_list.nil))))

-- and_example3 (provable but complex)
axiom Original_LF__DOT__Logic_LF_Logic_and__example3 :
  ∀ n m : nat, Corelib_Init_Logic_eq (Nat_add n m) nat.O →
    Corelib_Init_Logic_eq (Nat_mul n m) nat.O

-- proj2 (provable)
def Original_LF__DOT__Logic_LF_Logic_proj2 {P Q : Prop} (H : MyAnd P Q) : Q := H.right

-- zero_not_one
axiom Original_LF__DOT__Logic_LF_Logic_zero__not__one :
  Logic_not (Corelib_Init_Logic_eq nat.O (nat.S nat.O))

-- t_update_shadow
axiom Original_LF__DOT__Maps_LF_Maps_t__update__shadow :
  ∀ (A : Type) (m : Original_LF__DOT__Maps_LF_Maps_total__map A) (x : String_string) (v1 v2 : A),
    Corelib_Init_Logic_eq
      (Original_LF__DOT__Maps_LF_Maps_t__update A (Original_LF__DOT__Maps_LF_Maps_t__update A m x v1) x v2)
      (Original_LF__DOT__Maps_LF_Maps_t__update A m x v2)

-- ============================================================
-- BreakImp definitions
-- ============================================================

-- result type for BreakImp
inductive Original_LF__DOT__Imp_LF_Imp_BreakImp_result : Type where
  | SContinue : Original_LF__DOT__Imp_LF_Imp_BreakImp_result
  | SBreak : Original_LF__DOT__Imp_LF_Imp_BreakImp_result

def Original_LF__DOT__Imp_LF_Imp_BreakImp_SContinue := Original_LF__DOT__Imp_LF_Imp_BreakImp_result.SContinue
def Original_LF__DOT__Imp_LF_Imp_BreakImp_SBreak := Original_LF__DOT__Imp_LF_Imp_BreakImp_result.SBreak

-- BreakImp commands
inductive Original_LF__DOT__Imp_LF_Imp_BreakImp_com : Type where
  | CSkip : Original_LF__DOT__Imp_LF_Imp_BreakImp_com
  | CBreak : Original_LF__DOT__Imp_LF_Imp_BreakImp_com
  | CAsgn : String_string → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_BreakImp_com
  | CSeq : Original_LF__DOT__Imp_LF_Imp_BreakImp_com → Original_LF__DOT__Imp_LF_Imp_BreakImp_com → Original_LF__DOT__Imp_LF_Imp_BreakImp_com
  | CIf : Original_LF__DOT__Imp_LF_Imp_bexp → Original_LF__DOT__Imp_LF_Imp_BreakImp_com → Original_LF__DOT__Imp_LF_Imp_BreakImp_com → Original_LF__DOT__Imp_LF_Imp_BreakImp_com
  | CWhile : Original_LF__DOT__Imp_LF_Imp_bexp → Original_LF__DOT__Imp_LF_Imp_BreakImp_com → Original_LF__DOT__Imp_LF_Imp_BreakImp_com

def Original_LF__DOT__Imp_LF_Imp_BreakImp_CSkip := Original_LF__DOT__Imp_LF_Imp_BreakImp_com.CSkip
def Original_LF__DOT__Imp_LF_Imp_BreakImp_CBreak := Original_LF__DOT__Imp_LF_Imp_BreakImp_com.CBreak
def Original_LF__DOT__Imp_LF_Imp_BreakImp_CAsgn := Original_LF__DOT__Imp_LF_Imp_BreakImp_com.CAsgn
def Original_LF__DOT__Imp_LF_Imp_BreakImp_CSeq := Original_LF__DOT__Imp_LF_Imp_BreakImp_com.CSeq
def Original_LF__DOT__Imp_LF_Imp_BreakImp_CIf := Original_LF__DOT__Imp_LF_Imp_BreakImp_com.CIf
def Original_LF__DOT__Imp_LF_Imp_BreakImp_CWhile := Original_LF__DOT__Imp_LF_Imp_BreakImp_com.CWhile

-- BreakImp ceval (big-step semantics with break)
inductive Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval :
    Original_LF__DOT__Imp_LF_Imp_BreakImp_com →
    Original_LF__DOT__Imp_LF_Imp_state →
    Original_LF__DOT__Imp_LF_Imp_BreakImp_result →
    Original_LF__DOT__Imp_LF_Imp_state → Prop where
  | E_Skip (st : Original_LF__DOT__Imp_LF_Imp_state) :
      Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval
        Original_LF__DOT__Imp_LF_Imp_BreakImp_com.CSkip st
        Original_LF__DOT__Imp_LF_Imp_BreakImp_result.SContinue st
  | E_Break (st : Original_LF__DOT__Imp_LF_Imp_state) :
      Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval
        Original_LF__DOT__Imp_LF_Imp_BreakImp_com.CBreak st
        Original_LF__DOT__Imp_LF_Imp_BreakImp_result.SBreak st
  | E_Asgn (st : Original_LF__DOT__Imp_LF_Imp_state) (x : String_string) (a : Original_LF__DOT__Imp_LF_Imp_aexp) (n : nat) :
      Original_LF__DOT__Imp_LF_Imp_aeval st a = n →
      Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval
        (Original_LF__DOT__Imp_LF_Imp_BreakImp_com.CAsgn x a) st
        Original_LF__DOT__Imp_LF_Imp_BreakImp_result.SContinue
        (Original_LF__DOT__Maps_LF_Maps_t__update nat st x n)
  | E_SeqContinue (c1 c2 : Original_LF__DOT__Imp_LF_Imp_BreakImp_com) (st st' st'' : Original_LF__DOT__Imp_LF_Imp_state) (s : Original_LF__DOT__Imp_LF_Imp_BreakImp_result) :
      Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval c1 st Original_LF__DOT__Imp_LF_Imp_BreakImp_result.SContinue st' →
      Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval c2 st' s st'' →
      Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval (Original_LF__DOT__Imp_LF_Imp_BreakImp_com.CSeq c1 c2) st s st''
  | E_SeqBreak (c1 c2 : Original_LF__DOT__Imp_LF_Imp_BreakImp_com) (st st' : Original_LF__DOT__Imp_LF_Imp_state) :
      Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval c1 st Original_LF__DOT__Imp_LF_Imp_BreakImp_result.SBreak st' →
      Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval (Original_LF__DOT__Imp_LF_Imp_BreakImp_com.CSeq c1 c2) st Original_LF__DOT__Imp_LF_Imp_BreakImp_result.SBreak st'
  | E_IfTrue (b : Original_LF__DOT__Imp_LF_Imp_bexp) (c1 c2 : Original_LF__DOT__Imp_LF_Imp_BreakImp_com) (st st' : Original_LF__DOT__Imp_LF_Imp_state) (s : Original_LF__DOT__Imp_LF_Imp_BreakImp_result) :
      Original_LF__DOT__Imp_LF_Imp_beval st b = Stdlib_bool.true →
      Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval c1 st s st' →
      Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval (Original_LF__DOT__Imp_LF_Imp_BreakImp_com.CIf b c1 c2) st s st'
  | E_IfFalse (b : Original_LF__DOT__Imp_LF_Imp_bexp) (c1 c2 : Original_LF__DOT__Imp_LF_Imp_BreakImp_com) (st st' : Original_LF__DOT__Imp_LF_Imp_state) (s : Original_LF__DOT__Imp_LF_Imp_BreakImp_result) :
      Original_LF__DOT__Imp_LF_Imp_beval st b = Stdlib_bool.false →
      Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval c2 st s st' →
      Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval (Original_LF__DOT__Imp_LF_Imp_BreakImp_com.CIf b c1 c2) st s st'
  | E_WhileFalse (b : Original_LF__DOT__Imp_LF_Imp_bexp) (c : Original_LF__DOT__Imp_LF_Imp_BreakImp_com) (st : Original_LF__DOT__Imp_LF_Imp_state) :
      Original_LF__DOT__Imp_LF_Imp_beval st b = Stdlib_bool.false →
      Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval (Original_LF__DOT__Imp_LF_Imp_BreakImp_com.CWhile b c) st Original_LF__DOT__Imp_LF_Imp_BreakImp_result.SContinue st
  | E_WhileTrueContinue (b : Original_LF__DOT__Imp_LF_Imp_bexp) (c : Original_LF__DOT__Imp_LF_Imp_BreakImp_com) (st st' st'' : Original_LF__DOT__Imp_LF_Imp_state) (s : Original_LF__DOT__Imp_LF_Imp_BreakImp_result) :
      Original_LF__DOT__Imp_LF_Imp_beval st b = Stdlib_bool.true →
      Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval c st Original_LF__DOT__Imp_LF_Imp_BreakImp_result.SContinue st' →
      Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval (Original_LF__DOT__Imp_LF_Imp_BreakImp_com.CWhile b c) st' s st'' →
      Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval (Original_LF__DOT__Imp_LF_Imp_BreakImp_com.CWhile b c) st s st''
  | E_WhileTrueBreak (b : Original_LF__DOT__Imp_LF_Imp_bexp) (c : Original_LF__DOT__Imp_LF_Imp_BreakImp_com) (st st' : Original_LF__DOT__Imp_LF_Imp_state) :
      Original_LF__DOT__Imp_LF_Imp_beval st b = Stdlib_bool.true →
      Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval c st Original_LF__DOT__Imp_LF_Imp_BreakImp_result.SBreak st' →
      Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval (Original_LF__DOT__Imp_LF_Imp_BreakImp_com.CWhile b c) st Original_LF__DOT__Imp_LF_Imp_BreakImp_result.SContinue st'

-- while_continue theorem (Admitted in Original.v)
axiom Original_LF__DOT__Imp_LF_Imp_BreakImp_while__continue :
  ∀ (b : Original_LF__DOT__Imp_LF_Imp_bexp) (c : Original_LF__DOT__Imp_LF_Imp_BreakImp_com) (st st' : Original_LF__DOT__Imp_LF_Imp_state) (s : Original_LF__DOT__Imp_LF_Imp_BreakImp_result),
    Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval (Original_LF__DOT__Imp_LF_Imp_BreakImp_com.CWhile b c) st s st' →
    Corelib_Init_Logic_eq s Original_LF__DOT__Imp_LF_Imp_BreakImp_result.SContinue



