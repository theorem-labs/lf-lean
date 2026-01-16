-- Comprehensive Lean translation for all required isomorphisms
set_option linter.all false

-- ============================================================
-- Basic Types
-- ============================================================

-- True and False in Prop
inductive TrueType : Prop where
  | I : TrueType

def TrueType_I := TrueType.I

inductive FalseType : Prop where

-- Boolean type (LF.Basics.bool)
inductive Original_LF__DOT__Basics_LF_Basics_bool : Type where
  | true : Original_LF__DOT__Basics_LF_Basics_bool
  | false : Original_LF__DOT__Basics_LF_Basics_bool
deriving DecidableEq

def Original_LF__DOT__Basics_LF_Basics_true : Original_LF__DOT__Basics_LF_Basics_bool :=
  Original_LF__DOT__Basics_LF_Basics_bool.true

def Original_LF__DOT__Basics_LF_Basics_false : Original_LF__DOT__Basics_LF_Basics_bool :=
  Original_LF__DOT__Basics_LF_Basics_bool.false

-- Alias for mybool (used for internal bool operations)
def mybool := Original_LF__DOT__Basics_LF_Basics_bool
def mybool_mytrue := Original_LF__DOT__Basics_LF_Basics_bool.true
def mybool_myfalse := Original_LF__DOT__Basics_LF_Basics_bool.false

-- ============================================================
-- Natural Numbers
-- ============================================================

inductive nat : Type where
  | O : nat
  | S : nat → nat

def nat_O := nat.O
def nat_S := nat.S
def S := nat.S
def O := nat.O
def _0 := nat.O

-- Nat operations
def nat_add : nat → nat → nat
  | nat.O, m => m
  | nat.S n, m => nat.S (nat_add n m)

def nat_sub : nat → nat → nat
  | n, nat.O => n
  | nat.O, nat.S _ => nat.O
  | nat.S n, nat.S m => nat_sub n m

def nat_mul : nat → nat → nat
  | nat.O, _ => nat.O
  | nat.S n, m => nat_add m (nat_mul n m)

def nat_pred : nat → nat
  | nat.O => nat.O
  | nat.S n => n

def Nat_add := nat_add
def Nat_sub := nat_sub
def Nat_mul := nat_mul
def Nat_pred := nat_pred

def nat_eqb : nat → nat → Original_LF__DOT__Basics_LF_Basics_bool
  | nat.O, nat.O => Original_LF__DOT__Basics_LF_Basics_bool.true
  | nat.S n, nat.S m => nat_eqb n m
  | _, _ => Original_LF__DOT__Basics_LF_Basics_bool.false

def nat_leb : nat → nat → Original_LF__DOT__Basics_LF_Basics_bool
  | nat.O, _ => Original_LF__DOT__Basics_LF_Basics_bool.true
  | nat.S _, nat.O => Original_LF__DOT__Basics_LF_Basics_bool.false
  | nat.S n, nat.S m => nat_leb n m

-- ============================================================
-- Boolean Operations
-- ============================================================

def bool_negb : Original_LF__DOT__Basics_LF_Basics_bool → Original_LF__DOT__Basics_LF_Basics_bool
  | Original_LF__DOT__Basics_LF_Basics_bool.true => Original_LF__DOT__Basics_LF_Basics_bool.false
  | Original_LF__DOT__Basics_LF_Basics_bool.false => Original_LF__DOT__Basics_LF_Basics_bool.true

def bool_andb : Original_LF__DOT__Basics_LF_Basics_bool → Original_LF__DOT__Basics_LF_Basics_bool → Original_LF__DOT__Basics_LF_Basics_bool
  | Original_LF__DOT__Basics_LF_Basics_bool.true, b => b
  | Original_LF__DOT__Basics_LF_Basics_bool.false, _ => Original_LF__DOT__Basics_LF_Basics_bool.false

def Original_LF__DOT__Basics_LF_Basics_negb := bool_negb
def Original_LF__DOT__Basics_LF_Basics_andb := bool_andb

-- orb function
def Original_LF__DOT__Basics_LF_Basics_orb (b1 b2 : Original_LF__DOT__Basics_LF_Basics_bool) : Original_LF__DOT__Basics_LF_Basics_bool :=
  match b1 with
  | Original_LF__DOT__Basics_LF_Basics_bool.true => Original_LF__DOT__Basics_LF_Basics_bool.true
  | Original_LF__DOT__Basics_LF_Basics_bool.false => b2

-- ============================================================
-- Equality type in Prop
-- ============================================================

inductive Corelib_Init_Logic_eq {A : Type} : A → A → Prop where
  | refl (a : A) : Corelib_Init_Logic_eq a a

-- test_orb3 : orb false true = true
def Original_LF__DOT__Basics_LF_Basics_test__orb3 : 
  Corelib_Init_Logic_eq 
    (Original_LF__DOT__Basics_LF_Basics_orb Original_LF__DOT__Basics_LF_Basics_false Original_LF__DOT__Basics_LF_Basics_true)
    Original_LF__DOT__Basics_LF_Basics_true := 
  Corelib_Init_Logic_eq.refl Original_LF__DOT__Basics_LF_Basics_true

-- Equality on Prop values
inductive Corelib_Init_Logic_eq_Prop {A : Prop} : A → A → Prop where
  | refl (a : A) : Corelib_Init_Logic_eq_Prop a a

-- ============================================================
-- Option Type
-- ============================================================

inductive option (A : Type) : Type where
  | None : option A
  | Some : A → option A

def None (A : Type) : option A := option.None
def Some {A : Type} (x : A) : option A := option.Some x

-- ============================================================
-- Product Type
-- ============================================================

inductive prod (A B : Type) : Type where
  | pair : A → B → prod A B

def pair {A B : Type} (a : A) (b : B) : prod A B := prod.pair a b

-- ============================================================
-- List Type
-- ============================================================

inductive list (A : Type) : Type where
  | nil : list A
  | cons : A → list A → list A

def nil (A : Type) : list A := list.nil
def cons {A : Type} (x : A) (xs : list A) : list A := list.cons x xs

-- ============================================================
-- Logical Connectives
-- ============================================================

def or (A B : Prop) : Prop := A ∨ B
def Logic_not (A : Prop) : Prop := A → FalseType

-- And type
structure and (A B : Prop) : Prop where
  intro ::
  left : A
  right : B

-- and_commut: P /\ Q -> Q /\ P
def Original_LF__DOT__Logic_LF_Logic_and__commut (P Q : Prop) (H : and P Q) : and Q P :=
  and.intro H.right H.left

-- ============================================================
-- Existential
-- ============================================================

inductive ex {A : Type} (P : A → Prop) : Prop where
  | intro : (x : A) → P x → ex P

def ex_intro {A : Type} {P : A → Prop} (x : A) (h : P x) : ex P := ex.intro x h

-- ============================================================
-- Iff
-- ============================================================

structure iff (A B : Prop) : Prop where
  mp : A → B
  mpr : B → A

def iff_intro {A B : Prop} (h1 : A → B) (h2 : B → A) : iff A B := iff.mk h1 h2

-- ============================================================
-- Ascii Type
-- ============================================================

inductive Ascii_ascii : Type where
  | Ascii : Original_LF__DOT__Basics_LF_Basics_bool → Original_LF__DOT__Basics_LF_Basics_bool → Original_LF__DOT__Basics_LF_Basics_bool → Original_LF__DOT__Basics_LF_Basics_bool → Original_LF__DOT__Basics_LF_Basics_bool → Original_LF__DOT__Basics_LF_Basics_bool → Original_LF__DOT__Basics_LF_Basics_bool → Original_LF__DOT__Basics_LF_Basics_bool → Ascii_ascii

def Ascii := Ascii_ascii
def Ascii_Ascii := Ascii_ascii.Ascii

def bool_eqb : Original_LF__DOT__Basics_LF_Basics_bool → Original_LF__DOT__Basics_LF_Basics_bool → Original_LF__DOT__Basics_LF_Basics_bool
  | Original_LF__DOT__Basics_LF_Basics_bool.true, Original_LF__DOT__Basics_LF_Basics_bool.true => Original_LF__DOT__Basics_LF_Basics_bool.true
  | Original_LF__DOT__Basics_LF_Basics_bool.false, Original_LF__DOT__Basics_LF_Basics_bool.false => Original_LF__DOT__Basics_LF_Basics_bool.true
  | _, _ => Original_LF__DOT__Basics_LF_Basics_bool.false

def Ascii_eqb : Ascii_ascii → Ascii_ascii → Original_LF__DOT__Basics_LF_Basics_bool
  | Ascii_ascii.Ascii a0 a1 a2 a3 a4 a5 a6 a7, Ascii_ascii.Ascii b0 b1 b2 b3 b4 b5 b6 b7 =>
    bool_andb (bool_eqb a0 b0) (bool_andb (bool_eqb a1 b1) (bool_andb (bool_eqb a2 b2) 
    (bool_andb (bool_eqb a3 b3) (bool_andb (bool_eqb a4 b4) (bool_andb (bool_eqb a5 b5) 
    (bool_andb (bool_eqb a6 b6) (bool_eqb a7 b7)))))))

-- ============================================================
-- String Type
-- ============================================================

inductive String_string : Type where
  | EmptyString : String_string
  | String : Ascii_ascii → String_string → String_string

def String_EmptyString := String_string.EmptyString
def String_String := String_string.String

def String_eqb : String_string → String_string → Original_LF__DOT__Basics_LF_Basics_bool
  | String_string.EmptyString, String_string.EmptyString => Original_LF__DOT__Basics_LF_Basics_bool.true
  | String_string.String a s1, String_string.String b s2 => bool_andb (Ascii_eqb a b) (String_eqb s1 s2)
  | _, _ => Original_LF__DOT__Basics_LF_Basics_bool.false

-- Variable names X, Y, Z
def char_X : Ascii_ascii := Ascii_ascii.Ascii Original_LF__DOT__Basics_LF_Basics_bool.false Original_LF__DOT__Basics_LF_Basics_bool.false Original_LF__DOT__Basics_LF_Basics_bool.false Original_LF__DOT__Basics_LF_Basics_bool.true Original_LF__DOT__Basics_LF_Basics_bool.true Original_LF__DOT__Basics_LF_Basics_bool.false Original_LF__DOT__Basics_LF_Basics_bool.true Original_LF__DOT__Basics_LF_Basics_bool.false
def char_Y : Ascii_ascii := Ascii_ascii.Ascii Original_LF__DOT__Basics_LF_Basics_bool.true Original_LF__DOT__Basics_LF_Basics_bool.false Original_LF__DOT__Basics_LF_Basics_bool.false Original_LF__DOT__Basics_LF_Basics_bool.true Original_LF__DOT__Basics_LF_Basics_bool.true Original_LF__DOT__Basics_LF_Basics_bool.false Original_LF__DOT__Basics_LF_Basics_bool.true Original_LF__DOT__Basics_LF_Basics_bool.false
def char_Z : Ascii_ascii := Ascii_ascii.Ascii Original_LF__DOT__Basics_LF_Basics_bool.false Original_LF__DOT__Basics_LF_Basics_bool.true Original_LF__DOT__Basics_LF_Basics_bool.false Original_LF__DOT__Basics_LF_Basics_bool.true Original_LF__DOT__Basics_LF_Basics_bool.true Original_LF__DOT__Basics_LF_Basics_bool.false Original_LF__DOT__Basics_LF_Basics_bool.true Original_LF__DOT__Basics_LF_Basics_bool.false

def Original_LF__DOT__Imp_LF_Imp_X : String_string := String_string.String char_X String_string.EmptyString
def Original_LF__DOT__Imp_LF_Imp_Y : String_string := String_string.String char_Y String_string.EmptyString
def Original_LF__DOT__Imp_LF_Imp_Z : String_string := String_string.String char_Z String_string.EmptyString

-- ============================================================
-- Maps
-- ============================================================

def Original_LF__DOT__Maps_LF_Maps_total__map (A : Type) : Type := String_string → A

def Original_LF__DOT__Maps_LF_Maps_t__empty (A : Type) (v : A) : Original_LF__DOT__Maps_LF_Maps_total__map A :=
  fun _ => v

def Original_LF__DOT__Maps_LF_Maps_t__update (A : Type) (m : Original_LF__DOT__Maps_LF_Maps_total__map A) (x : String_string) (v : A) : Original_LF__DOT__Maps_LF_Maps_total__map A :=
  fun x' => match String_eqb x x' with
    | Original_LF__DOT__Basics_LF_Basics_bool.true => v
    | Original_LF__DOT__Basics_LF_Basics_bool.false => m x'

-- ============================================================
-- State
-- ============================================================

def Original_LF__DOT__Imp_LF_Imp_state : Type := Original_LF__DOT__Maps_LF_Maps_total__map nat

def Original_LF__DOT__Imp_LF_Imp_empty__st : Original_LF__DOT__Imp_LF_Imp_state := 
  Original_LF__DOT__Maps_LF_Maps_t__empty nat nat.O

-- ============================================================
-- Imp Expressions
-- ============================================================

-- Arithmetic expressions
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
def Original_LF__DOT__Imp_LF_Imp_AMult := Original_LF__DOT__Imp_LF_Imp_aexp.AMult

-- Boolean expressions
inductive Original_LF__DOT__Imp_LF_Imp_bexp : Type where
  | BTrue : Original_LF__DOT__Imp_LF_Imp_bexp
  | BFalse : Original_LF__DOT__Imp_LF_Imp_bexp
  | BEq : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_bexp
  | BNeq : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_bexp
  | BLe : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_bexp
  | BGt : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_bexp
  | BNot : Original_LF__DOT__Imp_LF_Imp_bexp → Original_LF__DOT__Imp_LF_Imp_bexp
  | BAnd : Original_LF__DOT__Imp_LF_Imp_bexp → Original_LF__DOT__Imp_LF_Imp_bexp → Original_LF__DOT__Imp_LF_Imp_bexp

def Original_LF__DOT__Imp_LF_Imp_BTrue := Original_LF__DOT__Imp_LF_Imp_bexp.BTrue
def Original_LF__DOT__Imp_LF_Imp_BFalse := Original_LF__DOT__Imp_LF_Imp_bexp.BFalse
def Original_LF__DOT__Imp_LF_Imp_BEq := Original_LF__DOT__Imp_LF_Imp_bexp.BEq
def Original_LF__DOT__Imp_LF_Imp_BNeq := Original_LF__DOT__Imp_LF_Imp_bexp.BNeq
def Original_LF__DOT__Imp_LF_Imp_BLe := Original_LF__DOT__Imp_LF_Imp_bexp.BLe
def Original_LF__DOT__Imp_LF_Imp_BGt := Original_LF__DOT__Imp_LF_Imp_bexp.BGt
def Original_LF__DOT__Imp_LF_Imp_BNot := Original_LF__DOT__Imp_LF_Imp_bexp.BNot
def Original_LF__DOT__Imp_LF_Imp_BAnd := Original_LF__DOT__Imp_LF_Imp_bexp.BAnd

-- Commands
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

-- ============================================================
-- Evaluation Functions
-- ============================================================

def Original_LF__DOT__Imp_LF_Imp_aeval (st : Original_LF__DOT__Imp_LF_Imp_state) : Original_LF__DOT__Imp_LF_Imp_aexp → nat
  | Original_LF__DOT__Imp_LF_Imp_aexp.ANum n => n
  | Original_LF__DOT__Imp_LF_Imp_aexp.AId x => st x
  | Original_LF__DOT__Imp_LF_Imp_aexp.APlus a1 a2 => nat_add (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2)
  | Original_LF__DOT__Imp_LF_Imp_aexp.AMinus a1 a2 => nat_sub (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2)
  | Original_LF__DOT__Imp_LF_Imp_aexp.AMult a1 a2 => nat_mul (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2)

def Original_LF__DOT__Imp_LF_Imp_beval (st : Original_LF__DOT__Imp_LF_Imp_state) : Original_LF__DOT__Imp_LF_Imp_bexp → Original_LF__DOT__Basics_LF_Basics_bool
  | Original_LF__DOT__Imp_LF_Imp_bexp.BTrue => Original_LF__DOT__Basics_LF_Basics_bool.true
  | Original_LF__DOT__Imp_LF_Imp_bexp.BFalse => Original_LF__DOT__Basics_LF_Basics_bool.false
  | Original_LF__DOT__Imp_LF_Imp_bexp.BEq a1 a2 => nat_eqb (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2)
  | Original_LF__DOT__Imp_LF_Imp_bexp.BNeq a1 a2 => bool_negb (nat_eqb (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2))
  | Original_LF__DOT__Imp_LF_Imp_bexp.BLe a1 a2 => nat_leb (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2)
  | Original_LF__DOT__Imp_LF_Imp_bexp.BGt a1 a2 => bool_negb (nat_leb (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2))
  | Original_LF__DOT__Imp_LF_Imp_bexp.BNot b => bool_negb (Original_LF__DOT__Imp_LF_Imp_beval st b)
  | Original_LF__DOT__Imp_LF_Imp_bexp.BAnd b1 b2 => bool_andb (Original_LF__DOT__Imp_LF_Imp_beval st b1) (Original_LF__DOT__Imp_LF_Imp_beval st b2)

-- ceval
inductive Original_LF__DOT__Imp_LF_Imp_ceval : Original_LF__DOT__Imp_LF_Imp_com → Original_LF__DOT__Imp_LF_Imp_state → Original_LF__DOT__Imp_LF_Imp_state → Prop where
  | E_Skip : ∀ st, Original_LF__DOT__Imp_LF_Imp_ceval Original_LF__DOT__Imp_LF_Imp_com.CSkip st st
  | E_Asgn : ∀ st x a, Original_LF__DOT__Imp_LF_Imp_ceval (Original_LF__DOT__Imp_LF_Imp_com.CAsgn x a)
      st (Original_LF__DOT__Maps_LF_Maps_t__update nat st x (Original_LF__DOT__Imp_LF_Imp_aeval st a))
  | E_Seq : ∀ c1 c2 st st' st'', Original_LF__DOT__Imp_LF_Imp_ceval c1 st st' →
      Original_LF__DOT__Imp_LF_Imp_ceval c2 st' st'' → Original_LF__DOT__Imp_LF_Imp_ceval (Original_LF__DOT__Imp_LF_Imp_com.CSeq c1 c2) st st''
  | E_IfTrue : ∀ st st' b c1 c2, Original_LF__DOT__Imp_LF_Imp_beval st b = Original_LF__DOT__Basics_LF_Basics_bool.true →
      Original_LF__DOT__Imp_LF_Imp_ceval c1 st st' → Original_LF__DOT__Imp_LF_Imp_ceval (Original_LF__DOT__Imp_LF_Imp_com.CIf b c1 c2) st st'
  | E_IfFalse : ∀ st st' b c1 c2, Original_LF__DOT__Imp_LF_Imp_beval st b = Original_LF__DOT__Basics_LF_Basics_bool.false →
      Original_LF__DOT__Imp_LF_Imp_ceval c2 st st' → Original_LF__DOT__Imp_LF_Imp_ceval (Original_LF__DOT__Imp_LF_Imp_com.CIf b c1 c2) st st'
  | E_WhileFalse : ∀ b st c, Original_LF__DOT__Imp_LF_Imp_beval st b = Original_LF__DOT__Basics_LF_Basics_bool.false →
      Original_LF__DOT__Imp_LF_Imp_ceval (Original_LF__DOT__Imp_LF_Imp_com.CWhile b c) st st
  | E_WhileTrue : ∀ st st' st'' b c, Original_LF__DOT__Imp_LF_Imp_beval st b = Original_LF__DOT__Basics_LF_Basics_bool.true →
      Original_LF__DOT__Imp_LF_Imp_ceval c st st' → Original_LF__DOT__Imp_LF_Imp_ceval (Original_LF__DOT__Imp_LF_Imp_com.CWhile b c) st' st'' →
      Original_LF__DOT__Imp_LF_Imp_ceval (Original_LF__DOT__Imp_LF_Imp_com.CWhile b c) st st''

-- ============================================================
-- bexp1: beval (X !-> 5) (true && ~(X <= 4)) = true
-- ============================================================

def Original_LF__DOT__Imp_LF_Imp_bexp1 : Corelib_Init_Logic_eq
    (Original_LF__DOT__Imp_LF_Imp_beval
       (Original_LF__DOT__Maps_LF_Maps_t__update nat Original_LF__DOT__Imp_LF_Imp_empty__st Original_LF__DOT__Imp_LF_Imp_X (nat.S (nat.S (nat.S (nat.S (nat.S nat.O))))))
       (Original_LF__DOT__Imp_LF_Imp_bexp.BAnd
          Original_LF__DOT__Imp_LF_Imp_bexp.BTrue
          (Original_LF__DOT__Imp_LF_Imp_bexp.BNot
             (Original_LF__DOT__Imp_LF_Imp_bexp.BLe
                (Original_LF__DOT__Imp_LF_Imp_aexp.AId Original_LF__DOT__Imp_LF_Imp_X)
                (Original_LF__DOT__Imp_LF_Imp_aexp.ANum (nat.S (nat.S (nat.S (nat.S nat.O)))))))))
    Original_LF__DOT__Basics_LF_Basics_bool.true :=
  Corelib_Init_Logic_eq.refl _

-- ============================================================
-- NatList (list of nat)
-- ============================================================

inductive Original_LF__DOT__Lists_LF_Lists_NatList_natlist : Type where
  | nil : Original_LF__DOT__Lists_LF_Lists_NatList_natlist
  | cons : nat → Original_LF__DOT__Lists_LF_Lists_NatList_natlist → Original_LF__DOT__Lists_LF_Lists_NatList_natlist

def Original_LF__DOT__Lists_LF_Lists_NatList_nil : Original_LF__DOT__Lists_LF_Lists_NatList_natlist :=
  Original_LF__DOT__Lists_LF_Lists_NatList_natlist.nil

def Original_LF__DOT__Lists_LF_Lists_NatList_cons : nat → Original_LF__DOT__Lists_LF_Lists_NatList_natlist → Original_LF__DOT__Lists_LF_Lists_NatList_natlist :=
  Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons

-- mylist = [1, 2, 3]
def Original_LF__DOT__Lists_LF_Lists_NatList_mylist : Original_LF__DOT__Lists_LF_Lists_NatList_natlist :=
  Original_LF__DOT__Lists_LF_Lists_NatList_cons (nat.S nat.O)
    (Original_LF__DOT__Lists_LF_Lists_NatList_cons (nat.S (nat.S nat.O))
      (Original_LF__DOT__Lists_LF_Lists_NatList_cons (nat.S (nat.S (nat.S nat.O)))
        Original_LF__DOT__Lists_LF_Lists_NatList_nil))

-- ============================================================
-- Poly List and Option
-- ============================================================

inductive Original_LF__DOT__Poly_LF_Poly_list (X : Type) : Type where
  | nil : Original_LF__DOT__Poly_LF_Poly_list X
  | cons : X → Original_LF__DOT__Poly_LF_Poly_list X → Original_LF__DOT__Poly_LF_Poly_list X

def Original_LF__DOT__Poly_LF_Poly_nil (X : Type) : Original_LF__DOT__Poly_LF_Poly_list X :=
  Original_LF__DOT__Poly_LF_Poly_list.nil

def Original_LF__DOT__Poly_LF_Poly_cons {X : Type} (x : X) (l : Original_LF__DOT__Poly_LF_Poly_list X) : Original_LF__DOT__Poly_LF_Poly_list X :=
  Original_LF__DOT__Poly_LF_Poly_list.cons x l

inductive Original_LF__DOT__Poly_LF_Poly_option (X : Type) : Type where
  | Some : X → Original_LF__DOT__Poly_LF_Poly_option X
  | None : Original_LF__DOT__Poly_LF_Poly_option X

def Original_LF__DOT__Poly_LF_Poly_None (X : Type) : Original_LF__DOT__Poly_LF_Poly_option X :=
  Original_LF__DOT__Poly_LF_Poly_option.None

def Original_LF__DOT__Poly_LF_Poly_Some {X : Type} (x : X) : Original_LF__DOT__Poly_LF_Poly_option X :=
  Original_LF__DOT__Poly_LF_Poly_option.Some x

-- length function
def Original_LF__DOT__Poly_LF_Poly_length {X : Type} : Original_LF__DOT__Poly_LF_Poly_list X → nat
  | Original_LF__DOT__Poly_LF_Poly_list.nil => nat.O
  | Original_LF__DOT__Poly_LF_Poly_list.cons _ t => nat.S (Original_LF__DOT__Poly_LF_Poly_length t)

-- nth_error function
def Original_LF__DOT__Poly_LF_Poly_nth__error {X : Type} : Original_LF__DOT__Poly_LF_Poly_list X → nat → Original_LF__DOT__Poly_LF_Poly_option X
  | Original_LF__DOT__Poly_LF_Poly_list.nil, _ => Original_LF__DOT__Poly_LF_Poly_option.None
  | Original_LF__DOT__Poly_LF_Poly_list.cons h _, nat.O => Original_LF__DOT__Poly_LF_Poly_option.Some h
  | Original_LF__DOT__Poly_LF_Poly_list.cons _ t, nat.S n' => Original_LF__DOT__Poly_LF_Poly_nth__error t n'

-- nth_error_after_last is Admitted in Original.v
axiom Original_LF__DOT__Tactics_LF_Tactics_nth__error__after__last :
  ∀ (n : nat) (X : Type) (l : Original_LF__DOT__Poly_LF_Poly_list X),
  Corelib_Init_Logic_eq (Original_LF__DOT__Poly_LF_Poly_length l) n →
  Corelib_Init_Logic_eq (Original_LF__DOT__Poly_LF_Poly_nth__error l n) (Original_LF__DOT__Poly_LF_Poly_None X)

-- ============================================================
-- Double function
-- ============================================================

def Original_LF__DOT__Induction_LF_Induction_double : nat → nat
  | nat.O => nat.O
  | nat.S n' => nat.S (nat.S (Original_LF__DOT__Induction_LF_Induction_double n'))

-- ============================================================
-- ev inductive type from EvPlayground
-- ============================================================

inductive Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev : nat → Prop where
  | ev_0 : Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev nat.O
  | ev_SS : (n : nat) → Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev n → 
            Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev (nat.S (nat.S n))

-- ev_double is Admitted in Original.v
axiom Original_LF__DOT__IndProp_LF_IndProp_ev__double : 
  (n : nat) → Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev (Original_LF__DOT__Induction_LF_Induction_double n)

-- ============================================================
-- AExp module definitions (simple aexp without state)
-- ============================================================

inductive Original_LF__DOT__Imp_LF_Imp_AExp_aexp : Type where
  | ANum : nat → Original_LF__DOT__Imp_LF_Imp_AExp_aexp
  | APlus : Original_LF__DOT__Imp_LF_Imp_AExp_aexp → Original_LF__DOT__Imp_LF_Imp_AExp_aexp → Original_LF__DOT__Imp_LF_Imp_AExp_aexp
  | AMinus : Original_LF__DOT__Imp_LF_Imp_AExp_aexp → Original_LF__DOT__Imp_LF_Imp_AExp_aexp → Original_LF__DOT__Imp_LF_Imp_AExp_aexp
  | AMult : Original_LF__DOT__Imp_LF_Imp_AExp_aexp → Original_LF__DOT__Imp_LF_Imp_AExp_aexp → Original_LF__DOT__Imp_LF_Imp_AExp_aexp

def Original_LF__DOT__Imp_LF_Imp_AExp_ANum := Original_LF__DOT__Imp_LF_Imp_AExp_aexp.ANum
def Original_LF__DOT__Imp_LF_Imp_AExp_APlus := Original_LF__DOT__Imp_LF_Imp_AExp_aexp.APlus

-- Evaluation function for AExp
def Original_LF__DOT__Imp_LF_Imp_AExp_aeval : Original_LF__DOT__Imp_LF_Imp_AExp_aexp → nat
  | Original_LF__DOT__Imp_LF_Imp_AExp_aexp.ANum n => n
  | Original_LF__DOT__Imp_LF_Imp_AExp_aexp.APlus a1 a2 => nat_add (Original_LF__DOT__Imp_LF_Imp_AExp_aeval a1) (Original_LF__DOT__Imp_LF_Imp_AExp_aeval a2)
  | Original_LF__DOT__Imp_LF_Imp_AExp_aexp.AMinus a1 a2 => nat_sub (Original_LF__DOT__Imp_LF_Imp_AExp_aeval a1) (Original_LF__DOT__Imp_LF_Imp_AExp_aeval a2)
  | Original_LF__DOT__Imp_LF_Imp_AExp_aexp.AMult a1 a2 => nat_mul (Original_LF__DOT__Imp_LF_Imp_AExp_aeval a1) (Original_LF__DOT__Imp_LF_Imp_AExp_aeval a2)

-- silly2: forall ae : aexp, aeval ae = aeval ae (Admitted in Original)
axiom Original_LF__DOT__Imp_LF_Imp_AExp_silly2 : ∀ (ae : Original_LF__DOT__Imp_LF_Imp_AExp_aexp),
  Corelib_Init_Logic_eq (Original_LF__DOT__Imp_LF_Imp_AExp_aeval ae) (Original_LF__DOT__Imp_LF_Imp_AExp_aeval ae)

-- invert_example1: forall {a b c: nat}, [a ;b] = [a;c] -> b = c (Admitted in Original)
axiom Original_LF__DOT__Imp_LF_Imp_AExp_invert__example1 : ∀ (a b c : nat),
  Corelib_Init_Logic_eq (list.cons a (list.cons b list.nil)) (list.cons a (list.cons c list.nil)) →
  Corelib_Init_Logic_eq b c

-- ============================================================
-- List_In
-- ============================================================

def List_In {A : Type} (x : A) : list A → Prop
  | list.nil => FalseType
  | list.cons h t => or (Corelib_Init_Logic_eq x h) (List_In x t)

-- ============================================================
-- example_bexp: true && ~(X <= 4)
-- ============================================================

def Original_LF__DOT__Imp_LF_Imp_example__bexp : Original_LF__DOT__Imp_LF_Imp_bexp :=
  Original_LF__DOT__Imp_LF_Imp_bexp.BAnd
    Original_LF__DOT__Imp_LF_Imp_bexp.BTrue
    (Original_LF__DOT__Imp_LF_Imp_bexp.BNot
      (Original_LF__DOT__Imp_LF_Imp_bexp.BLe
        (Original_LF__DOT__Imp_LF_Imp_aexp.AId Original_LF__DOT__Imp_LF_Imp_X)
        (Original_LF__DOT__Imp_LF_Imp_aexp.ANum (nat.S (nat.S (nat.S (nat.S nat.O)))))))

-- ============================================================
-- BreakImp: result type
-- ============================================================

inductive Original_LF__DOT__Imp_LF_Imp_BreakImp_result : Type where
  | SContinue : Original_LF__DOT__Imp_LF_Imp_BreakImp_result
  | SBreak : Original_LF__DOT__Imp_LF_Imp_BreakImp_result

def Original_LF__DOT__Imp_LF_Imp_BreakImp_SContinue := Original_LF__DOT__Imp_LF_Imp_BreakImp_result.SContinue
def Original_LF__DOT__Imp_LF_Imp_BreakImp_SBreak := Original_LF__DOT__Imp_LF_Imp_BreakImp_result.SBreak

-- ============================================================
-- BreakImp: com type with CBreak
-- ============================================================

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

-- ============================================================
-- BreakImp: ceval relation (inductive matching Original.v)
-- ============================================================

-- The ceval relation for BreakImp - matches Original.v which only has E_Skip
inductive Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval :
  Original_LF__DOT__Imp_LF_Imp_BreakImp_com →
  Original_LF__DOT__Imp_LF_Imp_state →
  Original_LF__DOT__Imp_LF_Imp_BreakImp_result →
  Original_LF__DOT__Imp_LF_Imp_state →
  Prop where
  | E_Skip : ∀ st, Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval
      Original_LF__DOT__Imp_LF_Imp_BreakImp_com.CSkip st
      Original_LF__DOT__Imp_LF_Imp_BreakImp_result.SContinue st

-- ============================================================
-- BreakImp theorems (all Admitted in Original.v)
-- ============================================================

-- while_continue: forall b c st st' s, st =[ while b do c end ]=> st' / s -> s = SContinue
axiom Original_LF__DOT__Imp_LF_Imp_BreakImp_while__continue :
  ∀ (b : Original_LF__DOT__Imp_LF_Imp_bexp) (c : Original_LF__DOT__Imp_LF_Imp_BreakImp_com)
    (st st' : Original_LF__DOT__Imp_LF_Imp_state) (s : Original_LF__DOT__Imp_LF_Imp_BreakImp_result),
    Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval (Original_LF__DOT__Imp_LF_Imp_BreakImp_com.CWhile b c) st s st' →
    Corelib_Init_Logic_eq s Original_LF__DOT__Imp_LF_Imp_BreakImp_result.SContinue

-- while_stops_on_break: forall b c st st', beval st b = true -> st =[ c ]=> st' / SBreak -> st =[ while b do c end ]=> st' / SContinue
axiom Original_LF__DOT__Imp_LF_Imp_BreakImp_while__stops__on__break :
  ∀ (b : Original_LF__DOT__Imp_LF_Imp_bexp) (c : Original_LF__DOT__Imp_LF_Imp_BreakImp_com)
    (st st' : Original_LF__DOT__Imp_LF_Imp_state),
    Corelib_Init_Logic_eq (Original_LF__DOT__Imp_LF_Imp_beval st b) Original_LF__DOT__Basics_LF_Basics_bool.true →
    Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval c st Original_LF__DOT__Imp_LF_Imp_BreakImp_result.SBreak st' →
    Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval (Original_LF__DOT__Imp_LF_Imp_BreakImp_com.CWhile b c) st Original_LF__DOT__Imp_LF_Imp_BreakImp_result.SContinue st'

-- seq_continue: forall c1 c2 st st' st'', st =[ c1 ]=> st' / SContinue -> st' =[ c2 ]=> st'' / SContinue -> st =[ c1 ; c2 ]=> st'' / SContinue
axiom Original_LF__DOT__Imp_LF_Imp_BreakImp_seq__continue :
  ∀ (c1 c2 : Original_LF__DOT__Imp_LF_Imp_BreakImp_com)
    (st st' st'' : Original_LF__DOT__Imp_LF_Imp_state),
    Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval c1 st Original_LF__DOT__Imp_LF_Imp_BreakImp_result.SContinue st' →
    Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval c2 st' Original_LF__DOT__Imp_LF_Imp_BreakImp_result.SContinue st'' →
    Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval (Original_LF__DOT__Imp_LF_Imp_BreakImp_com.CSeq c1 c2) st Original_LF__DOT__Imp_LF_Imp_BreakImp_result.SContinue st''

-- seq_stops_on_break: forall c1 c2 st st', st =[ c1 ]=> st' / SBreak -> st =[ c1 ; c2 ]=> st' / SBreak
axiom Original_LF__DOT__Imp_LF_Imp_BreakImp_seq__stops__on__break :
  ∀ (c1 c2 : Original_LF__DOT__Imp_LF_Imp_BreakImp_com)
    (st st' : Original_LF__DOT__Imp_LF_Imp_state),
    Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval c1 st Original_LF__DOT__Imp_LF_Imp_BreakImp_result.SBreak st' →
    Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval (Original_LF__DOT__Imp_LF_Imp_BreakImp_com.CSeq c1 c2) st Original_LF__DOT__Imp_LF_Imp_BreakImp_result.SBreak st'

-- while_break_true: forall b c st st', st =[ while b do c end ]=> st' / SContinue -> beval st' b = true -> exists st'', st'' =[ c ]=> st' / SBreak
axiom Original_LF__DOT__Imp_LF_Imp_BreakImp_while__break__true :
  ∀ (b : Original_LF__DOT__Imp_LF_Imp_bexp) (c : Original_LF__DOT__Imp_LF_Imp_BreakImp_com)
    (st st' : Original_LF__DOT__Imp_LF_Imp_state),
    Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval (Original_LF__DOT__Imp_LF_Imp_BreakImp_com.CWhile b c) st Original_LF__DOT__Imp_LF_Imp_BreakImp_result.SContinue st' →
    Corelib_Init_Logic_eq (Original_LF__DOT__Imp_LF_Imp_beval st' b) Original_LF__DOT__Basics_LF_Basics_bool.true →
    ex (fun st'' => Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval c st'' Original_LF__DOT__Imp_LF_Imp_BreakImp_result.SBreak st')
