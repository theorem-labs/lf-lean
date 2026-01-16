-- Comprehensive Lean translation for Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp and all dependencies
set_option linter.all false

-- ============================================================
-- Basic Types
-- ============================================================

def nat := Nat
def nat_O := Nat.zero
def nat_S := Nat.succ
def Nat_add := Nat.add
def Nat_mul := Nat.mul
def Nat_pred (n : Nat) : Nat :=
  match n with
  | Nat.zero => Nat.zero
  | Nat.succ n' => n'
def Nat_sub := Nat.sub
def Nat_eqb (n m : Nat) : Bool := n == m
def Nat_leb (n m : Nat) : Bool := n ≤ m
def Nat_ltb (n m : Nat) : Bool := n < m

-- Custom mynat type for isDigit, isLowerAlpha, etc.
inductive mynat2 : Type where
  | O : mynat2
  | S : mynat2 → mynat2

-- Alias for nat to match Rocq naming
def mynat := nat

inductive list (α : Type) : Type where
  | nil : list α
  | cons : α → list α → list α

inductive prod (α β : Type) : Type where
  | mk : α → β → prod α β

inductive unit : Type where
  | tt : unit

inductive option (α : Type) : Type where
  | None : option α
  | Some : α → option α

def option_None {α : Type} : option α := option.None
def option_Some {α : Type} (a : α) : option α := option.Some a
def None {α : Type} : option α := option.None
def Some {α : Type} (a : α) : option α := option.Some a

-- Prop True
inductive CoqTrue : Prop where
  | I : CoqTrue

def CoqTrue_I := CoqTrue.I

-- Prop-level equality
inductive Corelib_Init_Logic_eq_Prop (A : Prop) : A → A → Prop where
  | refl : (x : A) → Corelib_Init_Logic_eq_Prop A x x

def Corelib_Init_Logic_eq_Prop_refl (A : Prop) (x : A) : Corelib_Init_Logic_eq_Prop A x x :=
  Corelib_Init_Logic_eq_Prop.refl x

-- Type-level equality
inductive Corelib_Init_Logic_eq (A : Type) : A → A → Prop where
  | refl : (x : A) → Corelib_Init_Logic_eq A x x

def Corelib_Init_Logic_eq_refl (A : Type) (x : A) : Corelib_Init_Logic_eq A x x :=
  Corelib_Init_Logic_eq.refl x

-- Prop False
inductive CoqFalse : Prop where

-- List.In
def List_In {A : Type} (a : A) : list A → Prop
  | list.nil => CoqFalse
  | list.cons x xs => Corelib_Init_Logic_eq A a x ∨ List_In a xs

-- Logic.not
def Logic_not (P : Prop) : Prop := P → CoqFalse

inductive mybool : Type where
  | mytrue : mybool
  | myfalse : mybool
deriving DecidableEq

-- Alias for mybool to match Rocq bool naming
def Coqbool := mybool
def Coqbool_Coqtrue := mybool.mytrue
def Coqbool_Coqfalse := mybool.myfalse

inductive ascii : Type where
  | Ascii : mybool → mybool → mybool → mybool → mybool → mybool → mybool → mybool → ascii

-- Alias for ascii to match Rocq naming
def Ascii_ascii := ascii
def Ascii_Ascii := ascii.Ascii
def Ascii_ascii_Ascii := ascii.Ascii

inductive mystring : Type where
  | EmptyString : mystring
  | String : ascii → mystring → mystring

-- Alias for string to match Rocq naming
def String_string := mystring
def String_EmptyString := mystring.EmptyString
def String_String := mystring.String

-- ============================================================
-- Token and optionE
-- ============================================================

def Original_LF__DOT__ImpParser_LF_ImpParser_token : Type := mystring

inductive Original_LF__DOT__ImpParser_LF_ImpParser_optionE (X : Type) : Type where
  | SomeE : X → Original_LF__DOT__ImpParser_LF_ImpParser_optionE X
  | NoneE : mystring → Original_LF__DOT__ImpParser_LF_ImpParser_optionE X

def Original_LF__DOT__ImpParser_LF_ImpParser_SomeE {X : Type} (x : X) : Original_LF__DOT__ImpParser_LF_ImpParser_optionE X :=
  Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE x

def Original_LF__DOT__ImpParser_LF_ImpParser_parser (T : Type) : Type :=
  list Original_LF__DOT__ImpParser_LF_ImpParser_token →
  Original_LF__DOT__ImpParser_LF_ImpParser_optionE (prod T (list Original_LF__DOT__ImpParser_LF_ImpParser_token))

-- ============================================================
-- Original_LF__DOT__Imp_LF_Imp_aexp and Original_LF__DOT__Imp_LF_Imp_bexp types
-- ============================================================

inductive Original_LF__DOT__Imp_LF_Imp_aexp : Type where
  | ANum : nat → Original_LF__DOT__Imp_LF_Imp_aexp
  | AId : mystring → Original_LF__DOT__Imp_LF_Imp_aexp
  | APlus : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp
  | AMinus : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp
  | AMult : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp

inductive Original_LF__DOT__Imp_LF_Imp_bexp : Type where
  | BTrue : Original_LF__DOT__Imp_LF_Imp_bexp
  | BFalse : Original_LF__DOT__Imp_LF_Imp_bexp
  | BEq : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_bexp
  | BNeq : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_bexp
  | BLe : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_bexp
  | BGt : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_bexp
  | BNot : Original_LF__DOT__Imp_LF_Imp_bexp → Original_LF__DOT__Imp_LF_Imp_bexp
  | BAnd : Original_LF__DOT__Imp_LF_Imp_bexp → Original_LF__DOT__Imp_LF_Imp_bexp → Original_LF__DOT__Imp_LF_Imp_bexp

-- Constructor aliases
def Original_LF__DOT__Imp_LF_Imp_BTrue := Original_LF__DOT__Imp_LF_Imp_bexp.BTrue
def Original_LF__DOT__Imp_LF_Imp_BFalse := Original_LF__DOT__Imp_LF_Imp_bexp.BFalse
def Original_LF__DOT__Imp_LF_Imp_BEq := Original_LF__DOT__Imp_LF_Imp_bexp.BEq
def Original_LF__DOT__Imp_LF_Imp_BNeq := Original_LF__DOT__Imp_LF_Imp_bexp.BNeq
def Original_LF__DOT__Imp_LF_Imp_BLe := Original_LF__DOT__Imp_LF_Imp_bexp.BLe
def Original_LF__DOT__Imp_LF_Imp_BGt := Original_LF__DOT__Imp_LF_Imp_bexp.BGt
def Original_LF__DOT__Imp_LF_Imp_BNot := Original_LF__DOT__Imp_LF_Imp_bexp.BNot
def Original_LF__DOT__Imp_LF_Imp_BAnd := Original_LF__DOT__Imp_LF_Imp_bexp.BAnd

def Original_LF__DOT__Imp_LF_Imp_ANum := Original_LF__DOT__Imp_LF_Imp_aexp.ANum
def Original_LF__DOT__Imp_LF_Imp_AId := Original_LF__DOT__Imp_LF_Imp_aexp.AId
def Original_LF__DOT__Imp_LF_Imp_APlus := Original_LF__DOT__Imp_LF_Imp_aexp.APlus
def Original_LF__DOT__Imp_LF_Imp_AMinus := Original_LF__DOT__Imp_LF_Imp_aexp.AMinus
def Original_LF__DOT__Imp_LF_Imp_AMult := Original_LF__DOT__Imp_LF_Imp_aexp.AMult

-- ============================================================
-- Helper functions
-- ============================================================

def list_rev_append {α : Type} : list α → list α → list α
  | list.nil, acc => acc
  | list.cons h t, acc => list_rev_append t (list.cons h acc)

def list_rev {α : Type} (l : list α) : list α := list_rev_append l list.nil

-- Aliases for rev_append and rev
def rev_append {α : Type} := @list_rev_append α
def rev {α : Type} := @list_rev α

-- Generic app (list append)
def app {α : Type} : list α → list α → list α
  | list.nil, ys => ys
  | list.cons x xs, ys => list.cons x (app xs ys)

-- Generic map
def map {α β : Type} (f : α → β) : list α → list β
  | list.nil => list.nil
  | list.cons x xs => list.cons (f x) (map f xs)

def fold_left_bexp (f : Original_LF__DOT__Imp_LF_Imp_bexp → Original_LF__DOT__Imp_LF_Imp_bexp → Original_LF__DOT__Imp_LF_Imp_bexp)
    : list Original_LF__DOT__Imp_LF_Imp_bexp → Original_LF__DOT__Imp_LF_Imp_bexp → Original_LF__DOT__Imp_LF_Imp_bexp
  | list.nil, acc => acc
  | list.cons h t, acc => fold_left_bexp f t (f acc h)

def fold_left_aexp (f : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp)
    : list Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp
  | list.nil, acc => acc
  | list.cons h t, acc => fold_left_aexp f t (f acc h)

def fold_left_pair (f : Original_LF__DOT__Imp_LF_Imp_aexp → prod mybool Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp)
    : list (prod mybool Original_LF__DOT__Imp_LF_Imp_aexp) → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp
  | list.nil, acc => acc
  | list.cons h t, acc => fold_left_pair f t (f acc h)

def mybool_eq (b1 b2 : mybool) : mybool :=
  match b1, b2 with
  | mybool.mytrue, mybool.mytrue => mybool.mytrue
  | mybool.myfalse, mybool.myfalse => mybool.mytrue
  | _, _ => mybool.myfalse

def mybool_andb (b1 b2 : mybool) : mybool :=
  match b1 with
  | mybool.mytrue => b2
  | mybool.myfalse => mybool.myfalse

-- nat_leb: less-than-or-equal comparison for nat, returning mybool
def nat_leb : Nat → Nat → mybool
  | 0, _ => mybool.mytrue
  | Nat.succ _, 0 => mybool.myfalse
  | Nat.succ n, Nat.succ m => nat_leb n m

-- mynat2 operations for isDigit/isLowerAlpha
def mynat2_add : mynat2 → mynat2 → mynat2
  | mynat2.O, m => m
  | mynat2.S n, m => mynat2.S (mynat2_add n m)

def mynat2_leb : mynat2 → mynat2 → mybool
  | mynat2.O, _ => mybool.mytrue
  | mynat2.S _, mynat2.O => mybool.myfalse
  | mynat2.S n, mynat2.S m => mynat2_leb n m

-- Helper for bit values
def bit_val2 (b : mybool) (place : mynat2) : mynat2 :=
  match b with
  | mybool.mytrue => place
  | mybool.myfalse => mynat2.O

-- Constants for mynat2
def mynat2_1 : mynat2 := mynat2.S mynat2.O
def mynat2_2 : mynat2 := mynat2.S mynat2_1
def mynat2_4 : mynat2 := mynat2.S (mynat2.S mynat2_2)
def mynat2_8 : mynat2 := mynat2.S (mynat2.S (mynat2.S (mynat2.S mynat2_4)))
def mynat2_16 : mynat2 := mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S mynat2_8)))))))
def mynat2_32 : mynat2 := mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S mynat2_16)))))))))))))))
def mynat2_64 : mynat2 := mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S mynat2_32)))))))))))))))))))))))))))))))
def mynat2_128 : mynat2 := mynat2_add mynat2_64 mynat2_64

-- nat_of_ascii for mynat2
def nat_of_ascii2 (a : ascii) : mynat2 :=
  match a with
  | ascii.Ascii b0 b1 b2 b3 b4 b5 b6 b7 =>
    mynat2_add (bit_val2 b0 mynat2_1)
    (mynat2_add (bit_val2 b1 mynat2_2)
    (mynat2_add (bit_val2 b2 mynat2_4)
    (mynat2_add (bit_val2 b3 mynat2_8)
    (mynat2_add (bit_val2 b4 mynat2_16)
    (mynat2_add (bit_val2 b5 mynat2_32)
    (mynat2_add (bit_val2 b6 mynat2_64)
                (bit_val2 b7 mynat2_128)))))))

-- Constants for character ranges
def mynat2_48 : mynat2 := mynat2_add mynat2_32 mynat2_16
def mynat2_57 : mynat2 := mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S mynat2_48))))))))
def mynat2_97 : mynat2 := mynat2.S (mynat2_add mynat2_64 mynat2_32)
def mynat2_122 : mynat2 := mynat2_add mynat2_97 (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S mynat2.O)))))))))))))))))))))))))

def ascii_eq (a1 a2 : ascii) : mybool :=
  match a1, a2 with
  | ascii.Ascii b0 b1 b2 b3 b4 b5 b6 b7, ascii.Ascii c0 c1 c2 c3 c4 c5 c6 c7 =>
    match mybool_eq b0 c0, mybool_eq b1 c1, mybool_eq b2 c2, mybool_eq b3 c3,
          mybool_eq b4 c4, mybool_eq b5 c5, mybool_eq b6 c6, mybool_eq b7 c7 with
    | mybool.mytrue, mybool.mytrue, mybool.mytrue, mybool.mytrue,
      mybool.mytrue, mybool.mytrue, mybool.mytrue, mybool.mytrue => mybool.mytrue
    | _, _, _, _, _, _, _, _ => mybool.myfalse

def mystring_eq : mystring → mystring → mybool
  | mystring.EmptyString, mystring.EmptyString => mybool.mytrue
  | mystring.String a1 s1, mystring.String a2 s2 =>
    match ascii_eq a1 a2 with
    | mybool.mytrue => mystring_eq s1 s2
    | mybool.myfalse => mybool.myfalse
  | _, _ => mybool.myfalse

def mystring_append : mystring → mystring → mystring
  | mystring.EmptyString, s2 => s2
  | mystring.String a s1, s2 => mystring.String a (mystring_append s1 s2)

-- Reduction equations for mystring_append (for export to Rocq)
theorem mystring_append_empty (s2 : mystring) : mystring_append mystring.EmptyString s2 = s2 := rfl
theorem mystring_append_cons (a : ascii) (s1 s2 : mystring) : 
  mystring_append (mystring.String a s1) s2 = mystring.String a (mystring_append s1 s2) := rfl

-- list of ascii from string
def list_of_string : mystring → list ascii
  | mystring.EmptyString => list.nil
  | mystring.String c s => list.cons c (list_of_string s)

-- forallb
def forallb {X : Type} (test : X → mybool) : list X → mybool
  | list.nil => mybool.mytrue
  | list.cons x xs =>
    match test x with
    | mybool.mytrue => forallb test xs
    | mybool.myfalse => mybool.myfalse

-- nat_of_ascii (simplified - just the numeric value of an ASCII character)
def nat_of_ascii (a : ascii) : Nat :=
  match a with
  | ascii.Ascii b0 b1 b2 b3 b4 b5 b6 b7 =>
    let n0 : Nat := if b0 = mybool.mytrue then 1 else 0
    let n1 : Nat := if b1 = mybool.mytrue then 2 else 0
    let n2 : Nat := if b2 = mybool.mytrue then 4 else 0
    let n3 : Nat := if b3 = mybool.mytrue then 8 else 0
    let n4 : Nat := if b4 = mybool.mytrue then 16 else 0
    let n5 : Nat := if b5 = mybool.mytrue then 32 else 0
    let n6 : Nat := if b6 = mybool.mytrue then 64 else 0
    let n7 : Nat := if b7 = mybool.mytrue then 128 else 0
    n0 + n1 + n2 + n3 + n4 + n5 + n6 + n7

-- isLowerAlpha: checks if 97 <= n <= 122
def isLowerAlpha (c : ascii) : mybool :=
  let n := nat_of_ascii2 c
  mybool_andb (mynat2_leb mynat2_97 n) (mynat2_leb n mynat2_122)

-- isDigit: checks if 48 <= n <= 57
def isDigit (c : ascii) : mybool :=
  let n := nat_of_ascii2 c
  mybool_andb (mynat2_leb mynat2_48 n) (mynat2_leb n mynat2_57)

-- ============================================================
-- Character definitions
-- ============================================================

def char_e : ascii := ascii.Ascii mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse
def char_x : ascii := ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse
def char_p : ascii := ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse
def char_c : ascii := ascii.Ascii mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse
def char_t : ascii := ascii.Ascii mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse
def char_d : ascii := ascii.Ascii mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse
def char_space : ascii := ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse
def char_quote : ascii := ascii.Ascii mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse
def char_dot : ascii := ascii.Ascii mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse
def char_T : ascii := ascii.Ascii mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse
def char_o : ascii := ascii.Ascii mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse
def char_m : ascii := ascii.Ascii mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse
def char_a : ascii := ascii.Ascii mybool.mytrue mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse
def char_n : ascii := ascii.Ascii mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse
def char_y : ascii := ascii.Ascii mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse
def char_r : ascii := ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse
def char_u : ascii := ascii.Ascii mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse
def char_s : ascii := ascii.Ascii mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse
def char_i : ascii := ascii.Ascii mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse
def char_v : ascii := ascii.Ascii mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse
def char_l : ascii := ascii.Ascii mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse
def char_f : ascii := ascii.Ascii mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse
def char_tilde : ascii := ascii.Ascii mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse
def char_lparen : ascii := ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse
def char_rparen : ascii := ascii.Ascii mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse
def char_eq : ascii := ascii.Ascii mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse
def char_lt : ascii := ascii.Ascii mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse
def char_amp : ascii := ascii.Ascii mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse
def char_star : ascii := ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse
def char_plus : ascii := ascii.Ascii mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse
def char_minus : ascii := ascii.Ascii mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse
def char_0 : ascii := ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse
-- '1' = 49 = 00110001 binary
def char_1 : ascii := ascii.Ascii mybool.mytrue mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse
-- '2' = 50 = 00110010 binary
def char_2 : ascii := ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse
-- '3' = 51 = 00110011 binary
def char_3 : ascii := ascii.Ascii mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse
-- '6' = 54 = 00110110 binary
def char_6 : ascii := ascii.Ascii mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse
-- newline = 10 = 00001010 binary
def char_newline : ascii := ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse

-- String literals
def str_true : mystring := mystring.String char_t (mystring.String char_r (mystring.String char_u (mystring.String char_e mystring.EmptyString)))
def str_false : mystring := mystring.String char_f (mystring.String char_a (mystring.String char_l (mystring.String char_s (mystring.String char_e mystring.EmptyString))))
def str_not : mystring := mystring.String char_tilde mystring.EmptyString
def str_lparen : mystring := mystring.String char_lparen mystring.EmptyString
def str_rparen : mystring := mystring.String char_rparen mystring.EmptyString
def str_eq : mystring := mystring.String char_eq mystring.EmptyString
def str_le : mystring := mystring.String char_lt (mystring.String char_eq mystring.EmptyString)
def str_and : mystring := mystring.String char_amp (mystring.String char_amp mystring.EmptyString)
def str_star : mystring := mystring.String char_star mystring.EmptyString
def str_plus : mystring := mystring.String char_plus mystring.EmptyString
def str_minus : mystring := mystring.String char_minus mystring.EmptyString

-- Error messages
def expected_prefix : mystring :=
  mystring.String char_e (mystring.String char_x (mystring.String char_p (mystring.String char_e
  (mystring.String char_c (mystring.String char_t (mystring.String char_e (mystring.String char_d
  (mystring.String char_space (mystring.String char_quote mystring.EmptyString)))))))))

def expected_suffix : mystring :=
  mystring.String char_quote (mystring.String char_dot mystring.EmptyString)

def make_error_msg (t : mystring) : mystring :=
  mystring_append (mystring_append expected_prefix t) expected_suffix

-- "Too many recursive calls" - 24 characters
-- T o o sp m a n y sp r e c u r s i v e sp c a l l s
def too_many_recursive_calls : mystring :=
  mystring.String char_T
  (mystring.String char_o
  (mystring.String char_o
  (mystring.String char_space
  (mystring.String char_m
  (mystring.String char_a
  (mystring.String char_n
  (mystring.String char_y
  (mystring.String char_space
  (mystring.String char_r
  (mystring.String char_e
  (mystring.String char_c
  (mystring.String char_u
  (mystring.String char_r
  (mystring.String char_s
  (mystring.String char_i
  (mystring.String char_v
  (mystring.String char_e
  (mystring.String char_space
  (mystring.String char_c
  (mystring.String char_a
  (mystring.String char_l
  (mystring.String char_l
  (mystring.String char_s
  mystring.EmptyString)))))))))))))))))))))))

-- Additional characters for error messages
-- 'I' = 73 = 01001001 (LSB first: 1,0,0,1,0,0,1,0)
def char_I : ascii := ascii.Ascii mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse
-- 'g' = 103 = 01100111 (LSB first: 1,1,1,0,0,1,1,0)
def char_g : ascii := ascii.Ascii mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse
-- 'b' = 98 = 01100010 (LSB first: 0,1,0,0,0,1,1,0)
def char_b : ascii := ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse
-- ':' = 58 = 00111010 (LSB first: 0,1,0,1,1,1,0,0)
def char_colon : ascii := ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse
-- 'E' = 69 = 01000101 (LSB first: 1,0,1,0,0,0,1,0)
def char_E : ascii := ascii.Ascii mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse
-- 'N' = 78 = 01001110 (LSB first: 0,1,1,1,0,0,1,0)
def char_N : ascii := ascii.Ascii mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse

-- "Expected identifier"
def str_expected_identifier : mystring :=
  mystring.String char_E (mystring.String char_x (mystring.String char_p (mystring.String char_e
  (mystring.String char_c (mystring.String char_t (mystring.String char_e (mystring.String char_d
  (mystring.String char_space (mystring.String char_i (mystring.String char_d (mystring.String char_e
  (mystring.String char_n (mystring.String char_t (mystring.String char_i (mystring.String char_f
  (mystring.String char_i (mystring.String char_e (mystring.String char_r mystring.EmptyString))))))))))))))))))

-- "Illegal identifier:'"
def str_illegal_prefix : mystring :=
  mystring.String char_I (mystring.String char_l (mystring.String char_l (mystring.String char_e
  (mystring.String char_g (mystring.String char_a (mystring.String char_l (mystring.String char_space
  (mystring.String char_i (mystring.String char_d (mystring.String char_e (mystring.String char_n
  (mystring.String char_t (mystring.String char_i (mystring.String char_f (mystring.String char_i
  (mystring.String char_e (mystring.String char_r (mystring.String char_colon (mystring.String char_quote
  mystring.EmptyString)))))))))))))))))))

-- "'"
def str_quote : mystring := mystring.String char_quote mystring.EmptyString

-- "Expected number"
def str_expected_number : mystring :=
  mystring.String char_E (mystring.String char_x (mystring.String char_p (mystring.String char_e
  (mystring.String char_c (mystring.String char_t (mystring.String char_e (mystring.String char_d
  (mystring.String char_space (mystring.String char_n (mystring.String char_u (mystring.String char_m
  (mystring.String char_b (mystring.String char_e (mystring.String char_r mystring.EmptyString))))))))))))))

def expected_identifier : mystring := str_expected_identifier
def illegal_identifier_msg (x : mystring) : mystring := mystring_append (mystring_append str_illegal_prefix x) str_quote
def expected_number : mystring := str_expected_number

-- Additional characters for expected_eq_or_le_msg
-- 'h' = 104 = 01101000 (LSB first: 0,0,0,1,0,1,1,0)
def char_h : ascii := ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse
-- 'k' = 107 = 64+32+8+2+1 = 0b01101011
def char_k : ascii := ascii.Ascii mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse

-- "Expected '=' or '<=' after arithmetic expression"
-- 48 characters total
def expected_eq_or_le_msg : mystring :=
  mystring.String char_E (mystring.String char_x (mystring.String char_p (mystring.String char_e  -- Expe
  (mystring.String char_c (mystring.String char_t (mystring.String char_e (mystring.String char_d  -- cted
  (mystring.String char_space (mystring.String char_quote (mystring.String char_eq (mystring.String char_quote  --  '='
  (mystring.String char_space (mystring.String char_o (mystring.String char_r (mystring.String char_space  --  or
  (mystring.String char_quote (mystring.String char_lt (mystring.String char_eq (mystring.String char_quote  -- '<='
  (mystring.String char_space (mystring.String char_a (mystring.String char_f (mystring.String char_t  --  aft
  (mystring.String char_e (mystring.String char_r (mystring.String char_space (mystring.String char_a  -- er a
  (mystring.String char_r (mystring.String char_i (mystring.String char_t (mystring.String char_h  -- rith
  (mystring.String char_m (mystring.String char_e (mystring.String char_t (mystring.String char_i  -- meti
  (mystring.String char_c (mystring.String char_space (mystring.String char_e (mystring.String char_x  -- c ex
  (mystring.String char_p (mystring.String char_r (mystring.String char_e (mystring.String char_s  -- pres
  (mystring.String char_s (mystring.String char_i (mystring.String char_o (mystring.String char_n  -- sion
  mystring.EmptyString)))))))))))))))))))))))))))))))))))))))))))))))

-- ============================================================
-- Parser combinators
-- ============================================================

def Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect
    (T : Type)
    (t : Original_LF__DOT__ImpParser_LF_ImpParser_token)
    (p : list Original_LF__DOT__ImpParser_LF_ImpParser_token →
         Original_LF__DOT__ImpParser_LF_ImpParser_optionE (prod T (list Original_LF__DOT__ImpParser_LF_ImpParser_token)))
    (xs : list Original_LF__DOT__ImpParser_LF_ImpParser_token) :
    Original_LF__DOT__ImpParser_LF_ImpParser_optionE (prod T (list Original_LF__DOT__ImpParser_LF_ImpParser_token)) :=
  match xs with
  | list.nil => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE (make_error_msg t)
  | list.cons x xs' =>
    match mystring_eq x t with
    | mybool.mytrue => p xs'
    | mybool.myfalse => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE (make_error_msg t)

def Original_LF__DOT__ImpParser_LF_ImpParser_expect
    (t : Original_LF__DOT__ImpParser_LF_ImpParser_token)
    (xs : list Original_LF__DOT__ImpParser_LF_ImpParser_token) :
    Original_LF__DOT__ImpParser_LF_ImpParser_optionE (prod unit (list Original_LF__DOT__ImpParser_LF_ImpParser_token)) :=
  Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect unit t
    (fun ys => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk unit.tt ys)) xs

def Original_LF__DOT__ImpParser_LF_ImpParser_many__helper (T : Type)
    (p : list Original_LF__DOT__ImpParser_LF_ImpParser_token →
         Original_LF__DOT__ImpParser_LF_ImpParser_optionE (prod T (list Original_LF__DOT__ImpParser_LF_ImpParser_token)))
    (acc : list T)
    (steps : nat)
    (xs : list Original_LF__DOT__ImpParser_LF_ImpParser_token) :
    Original_LF__DOT__ImpParser_LF_ImpParser_optionE (prod (list T) (list Original_LF__DOT__ImpParser_LF_ImpParser_token)) :=
  @Nat.rec
    (fun _ => list T → list Original_LF__DOT__ImpParser_LF_ImpParser_token →
              Original_LF__DOT__ImpParser_LF_ImpParser_optionE (prod (list T) (list Original_LF__DOT__ImpParser_LF_ImpParser_token)))
    (fun _ _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE too_many_recursive_calls)
    (fun _ rec_fn acc' xs' =>
      match p xs' with
      | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
          Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (list_rev acc') xs')
      | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE result =>
          match result with
          | prod.mk t xs'' => rec_fn (list.cons t acc') xs'')
    steps
    acc
    xs

def Original_LF__DOT__ImpParser_LF_ImpParser_many (T : Type)
    (p : list Original_LF__DOT__ImpParser_LF_ImpParser_token →
         Original_LF__DOT__ImpParser_LF_ImpParser_optionE (prod T (list Original_LF__DOT__ImpParser_LF_ImpParser_token)))
    (steps : nat)
    (xs : list Original_LF__DOT__ImpParser_LF_ImpParser_token) :
    Original_LF__DOT__ImpParser_LF_ImpParser_optionE (prod (list T) (list Original_LF__DOT__ImpParser_LF_ImpParser_token)) :=
  Original_LF__DOT__ImpParser_LF_ImpParser_many__helper T p list.nil steps xs

-- ============================================================
-- parseIdentifier and parseNumber
-- ============================================================

def parseIdentifier (xs : list Original_LF__DOT__ImpParser_LF_ImpParser_token) :
    Original_LF__DOT__ImpParser_LF_ImpParser_optionE (prod mystring (list Original_LF__DOT__ImpParser_LF_ImpParser_token)) :=
  match xs with
  | list.nil => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE expected_identifier
  | list.cons x xs' =>
    match forallb isLowerAlpha (list_of_string x) with
    | mybool.mytrue => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk x xs')
    | mybool.myfalse => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE (illegal_identifier_msg x)

-- Explicit nat operations without typeclasses for simpler export
-- nat_add: recurse on first argument like Rocq's +
def nat_add : Nat → Nat → Nat
  | Nat.zero, m => m
  | Nat.succ n, m => Nat.succ (nat_add n m)

-- Reduction lemmas for nat_add
theorem nat_add_zero_l (m : Nat) : nat_add Nat.zero m = m := rfl
theorem nat_add_succ_l (n m : Nat) : nat_add (Nat.succ n) m = Nat.succ (nat_add n m) := rfl

-- nat_mul: recurse on first argument like Rocq's *
def nat_mul : Nat → Nat → Nat
  | Nat.zero, _ => Nat.zero
  | Nat.succ n, m => nat_add m (nat_mul n m)

-- Reduction lemmas for nat_mul
theorem nat_mul_zero_l (m : Nat) : nat_mul Nat.zero m = Nat.zero := rfl
theorem nat_mul_succ_l (n m : Nat) : nat_mul (Nat.succ n) m = nat_add m (nat_mul n m) := rfl

def nat_sub : Nat → Nat → Nat
  | Nat.zero, _ => Nat.zero
  | Nat.succ n, Nat.zero => Nat.succ n
  | Nat.succ n, Nat.succ m => nat_sub n m

-- Reduction lemmas for nat_sub
theorem nat_sub_zero_l (m : Nat) : nat_sub Nat.zero m = Nat.zero := rfl
theorem nat_sub_succ_zero (n : Nat) : nat_sub (Nat.succ n) Nat.zero = Nat.succ n := rfl
theorem nat_sub_succ_succ (n m : Nat) : nat_sub (Nat.succ n) (Nat.succ m) = nat_sub n m := rfl

def nat_10 : Nat := Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ Nat.zero)))))))))

def nat_48 : Nat := nat_of_ascii char_0

def fold_left_nat (f : Nat → ascii → Nat) : list ascii → Nat → Nat
  | list.nil, acc => acc
  | list.cons h t, acc => fold_left_nat f t (f acc h)

def parseNumber (xs : list Original_LF__DOT__ImpParser_LF_ImpParser_token) :
    Original_LF__DOT__ImpParser_LF_ImpParser_optionE (prod nat (list Original_LF__DOT__ImpParser_LF_ImpParser_token)) :=
  match xs with
  | list.nil => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE expected_number
  | list.cons x xs' =>
    match forallb isDigit (list_of_string x) with
    | mybool.mytrue =>
      let n : Nat := fold_left_nat (fun acc d => nat_add (nat_mul nat_10 acc) (nat_sub (nat_of_ascii d) nat_48)) (list_of_string x) Nat.zero
      Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk n xs')
    | mybool.myfalse => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE expected_number

-- ============================================================
-- Arithmetic expression parsers (mutually recursive using Nat.rec)
-- ============================================================

-- We'll define parsePrimaryExp, parseProductExp, parseSumExp together
-- using nested Nat.rec for the mutual recursion simulation

-- Helper type for the return type of the Original_LF__DOT__Imp_LF_Imp_aexp parsers
abbrev AexpParseResult := Original_LF__DOT__ImpParser_LF_ImpParser_optionE (prod Original_LF__DOT__Imp_LF_Imp_aexp (list Original_LF__DOT__ImpParser_LF_ImpParser_token))

-- Forward declarations as functions taking steps as parameter
-- We implement these as a single recursive definition

def parseSumExp_body
    (parsePrimaryExp : nat → list Original_LF__DOT__ImpParser_LF_ImpParser_token → AexpParseResult)
    (parseProductExp : nat → list Original_LF__DOT__ImpParser_LF_ImpParser_token → AexpParseResult)
    (parseSumExp : nat → list Original_LF__DOT__ImpParser_LF_ImpParser_token → AexpParseResult)
    (steps : nat)
    (xs : list Original_LF__DOT__ImpParser_LF_ImpParser_token) : AexpParseResult :=
  match steps with
  | Nat.zero => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE too_many_recursive_calls
  | Nat.succ steps' =>
    match parseProductExp steps' xs with
    | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg
    | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e rest) =>
      match Original_LF__DOT__ImpParser_LF_ImpParser_many (prod mybool Original_LF__DOT__Imp_LF_Imp_aexp)
              (fun xs =>
                match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_aexp str_plus (parseProductExp steps') xs with
                | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e' rest') =>
                    Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (prod.mk mybool.mytrue e') rest')
                | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
                  match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_aexp str_minus (parseProductExp steps') xs with
                  | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e' rest') =>
                      Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (prod.mk mybool.myfalse e') rest')
                  | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg)
              steps' rest with
      | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg
      | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk es rest') =>
        Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE
          (prod.mk (fold_left_pair (fun e0 term =>
            match term with
            | prod.mk mybool.mytrue e' => Original_LF__DOT__Imp_LF_Imp_aexp.APlus e0 e'
            | prod.mk mybool.myfalse e' => Original_LF__DOT__Imp_LF_Imp_aexp.AMinus e0 e') es e) rest')

-- Combined mutually recursive parser using Nat.rec
def aexpParsers : nat → (list Original_LF__DOT__ImpParser_LF_ImpParser_token → AexpParseResult) ×
                         (list Original_LF__DOT__ImpParser_LF_ImpParser_token → AexpParseResult) ×
                         (list Original_LF__DOT__ImpParser_LF_ImpParser_token → AexpParseResult) :=
  @Nat.rec
    (fun _ => (list Original_LF__DOT__ImpParser_LF_ImpParser_token → AexpParseResult) ×
              (list Original_LF__DOT__ImpParser_LF_ImpParser_token → AexpParseResult) ×
              (list Original_LF__DOT__ImpParser_LF_ImpParser_token → AexpParseResult))
    -- Base case: steps = 0
    (fun _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE too_many_recursive_calls,
     fun _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE too_many_recursive_calls,
     fun _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE too_many_recursive_calls)
    -- Recursive case
    (fun steps' rec =>
      let (parsePrimaryExp', parseProductExp', parseSumExp') := rec
      -- parsePrimaryExp
      let parsePrimaryExp := fun xs =>
        -- TRY parseIdentifier
        match parseIdentifier xs with
        | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk i rest) =>
            Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (Original_LF__DOT__Imp_LF_Imp_aexp.AId i) rest)
        | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
          -- TRY parseNumber
          match parseNumber xs with
          | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk n rest) =>
              Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (Original_LF__DOT__Imp_LF_Imp_aexp.ANum n) rest)
          | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
            -- TRY "(" parseSumExp ")"
            match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_aexp str_lparen parseSumExp' xs with
            | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e rest) =>
              match Original_LF__DOT__ImpParser_LF_ImpParser_expect str_rparen rest with
              | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk _ rest') =>
                  Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e rest')
              | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg
            | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg
      -- parseProductExp
      let parseProductExp := fun xs =>
        match parsePrimaryExp' xs with
        | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg
        | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e rest) =>
          match Original_LF__DOT__ImpParser_LF_ImpParser_many Original_LF__DOT__Imp_LF_Imp_aexp
                  (Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_aexp str_star parsePrimaryExp')
                  steps' rest with
          | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg
          | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk es rest') =>
              Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (fold_left_aexp Original_LF__DOT__Imp_LF_Imp_aexp.AMult es e) rest')
      -- parseSumExp
      let parseSumExp := fun xs =>
        match parseProductExp' xs with
        | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg
        | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e rest) =>
          match Original_LF__DOT__ImpParser_LF_ImpParser_many (prod mybool Original_LF__DOT__Imp_LF_Imp_aexp)
                  (fun ys =>
                    match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_aexp str_plus parseProductExp' ys with
                    | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e' rest') =>
                        Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (prod.mk mybool.mytrue e') rest')
                    | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
                      match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_aexp str_minus parseProductExp' ys with
                      | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e' rest') =>
                          Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (prod.mk mybool.myfalse e') rest')
                      | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg)
                  steps' rest with
          | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg
          | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk es rest') =>
              Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE
                (prod.mk (fold_left_pair (fun e0 term =>
                  match term with
                  | prod.mk mybool.mytrue e' => Original_LF__DOT__Imp_LF_Imp_aexp.APlus e0 e'
                  | prod.mk mybool.myfalse e' => Original_LF__DOT__Imp_LF_Imp_aexp.AMinus e0 e') es e) rest')
      (parsePrimaryExp, parseProductExp, parseSumExp))

def Original_LF__DOT__ImpParser_LF_ImpParser_parseAExp (steps : nat) (xs : list Original_LF__DOT__ImpParser_LF_ImpParser_token) : AexpParseResult :=
  let (_, _, parseSumExp) := aexpParsers steps
  parseSumExp xs

def parseProductExp (steps : nat) (xs : list Original_LF__DOT__ImpParser_LF_ImpParser_token) : AexpParseResult :=
  let (_, parseProductExp, _) := aexpParsers steps
  parseProductExp xs

def parseSumExp (steps : nat) (xs : list Original_LF__DOT__ImpParser_LF_ImpParser_token) : AexpParseResult :=
  let (_, _, parseSumExp) := aexpParsers steps
  parseSumExp xs

-- ============================================================
-- Boolean expression parsers (mutually recursive)
-- ============================================================

abbrev BexpParseResult := Original_LF__DOT__ImpParser_LF_ImpParser_optionE (prod Original_LF__DOT__Imp_LF_Imp_bexp (list Original_LF__DOT__ImpParser_LF_ImpParser_token))

-- Combined mutually recursive parser for Original_LF__DOT__Imp_LF_Imp_bexp using Nat.rec
def bexpParsers : nat → (list Original_LF__DOT__ImpParser_LF_ImpParser_token → BexpParseResult) ×
                         (list Original_LF__DOT__ImpParser_LF_ImpParser_token → BexpParseResult) :=
  @Nat.rec
    (fun _ => (list Original_LF__DOT__ImpParser_LF_ImpParser_token → BexpParseResult) ×
              (list Original_LF__DOT__ImpParser_LF_ImpParser_token → BexpParseResult))
    -- Base case: steps = 0
    (fun _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE too_many_recursive_calls,
     fun _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE too_many_recursive_calls)
    -- Recursive case
    (fun steps' rec =>
      let (Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp', parseConjunctionExp') := rec
      -- Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp
      let Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp := fun xs =>
        -- TRY Original_LF__DOT__ImpParser_LF_ImpParser_expect "true"
        match Original_LF__DOT__ImpParser_LF_ImpParser_expect str_true xs with
        | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk _ rest) =>
            Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk Original_LF__DOT__Imp_LF_Imp_bexp.BTrue rest)
        | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
          -- TRY Original_LF__DOT__ImpParser_LF_ImpParser_expect "false"
          match Original_LF__DOT__ImpParser_LF_ImpParser_expect str_false xs with
          | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk _ rest) =>
              Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk Original_LF__DOT__Imp_LF_Imp_bexp.BFalse rest)
          | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
            -- TRY Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect "~" (Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp steps')
            match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_bexp str_not Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp' xs with
            | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e rest) =>
                Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (Original_LF__DOT__Imp_LF_Imp_bexp.BNot e) rest)
            | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
              -- TRY Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect "(" (parseConjunctionExp steps') then Original_LF__DOT__ImpParser_LF_ImpParser_expect ")"
              -- In Rocq, this is tested as a single unit - if ")" is missing, fall through
              let parenResult :=
                match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_bexp str_lparen parseConjunctionExp' xs with
                | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e rest) =>
                  match Original_LF__DOT__ImpParser_LF_ImpParser_expect str_rparen rest with
                  | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk _ rest') => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e rest')
                  | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE mystring.EmptyString
                | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE mystring.EmptyString
              match parenResult with
              | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e rest') =>
                  Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e rest')
              | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
                -- parseProductExp then try "=" or "<="
                match parseProductExp steps' xs with
                | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg
                | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e rest) =>
                  -- TRY Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect "=" (Original_LF__DOT__ImpParser_LF_ImpParser_parseAExp steps')
                  match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_aexp str_eq (Original_LF__DOT__ImpParser_LF_ImpParser_parseAExp steps') rest with
                  | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e' rest') =>
                      Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (Original_LF__DOT__Imp_LF_Imp_bexp.BEq e e') rest')
                  | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
                    -- TRY Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect "<=" (Original_LF__DOT__ImpParser_LF_ImpParser_parseAExp steps')
                    match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_aexp str_le (Original_LF__DOT__ImpParser_LF_ImpParser_parseAExp steps') rest with
                    | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e' rest') =>
                        Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (Original_LF__DOT__Imp_LF_Imp_bexp.BLe e e') rest')
                    | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
                        Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE expected_eq_or_le_msg
      -- parseConjunctionExp
      let parseConjunctionExp := fun xs =>
        match Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp' xs with
        | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg
        | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e rest) =>
          match Original_LF__DOT__ImpParser_LF_ImpParser_many Original_LF__DOT__Imp_LF_Imp_bexp
                  (Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_bexp str_and Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp')
                  steps' rest with
          | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg
          | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk es rest') =>
              Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (fold_left_bexp Original_LF__DOT__Imp_LF_Imp_bexp.BAnd es e) rest')
      (Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp, parseConjunctionExp))

def Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp (steps : nat) (xs : list Original_LF__DOT__ImpParser_LF_ImpParser_token) : BexpParseResult :=
  let (Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp, _) := bexpParsers steps
  Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp xs

def parseConjunctionExp (steps : nat) (xs : list Original_LF__DOT__ImpParser_LF_ImpParser_token) : BexpParseResult :=
  let (_, parseConjunctionExp) := bexpParsers steps
  parseConjunctionExp xs

-- ============================================================
-- Export parsePrimaryExp as a top-level function
-- ============================================================

def Original_LF__DOT__ImpParser_LF_ImpParser_parsePrimaryExp (steps : nat) (xs : list Original_LF__DOT__ImpParser_LF_ImpParser_token) : AexpParseResult :=
  let (parsePrimaryExp, _, _) := aexpParsers steps
  parsePrimaryExp xs

-- Aliases for parseIdentifier and parseNumber
def Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier := parseIdentifier
def Original_LF__DOT__ImpParser_LF_ImpParser_parseNumber := parseNumber

-- Aliases for helper functions
def Original_LF__DOT__ImpParser_LF_ImpParser_isLowerAlpha := isLowerAlpha
def Original_LF__DOT__ImpParser_LF_ImpParser_isDigit := isDigit
def Original_LF__DOT__ImpParser_LF_ImpParser_list__of__string := list_of_string

-- ============================================================
-- Reduction lemmas for parsePrimaryExp
-- ============================================================

-- Base case: steps = 0
theorem parsePrimaryExp_zero (xs : list Original_LF__DOT__ImpParser_LF_ImpParser_token) :
  Original_LF__DOT__ImpParser_LF_ImpParser_parsePrimaryExp Nat.zero xs =
  Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE too_many_recursive_calls := rfl

-- Successor case: steps = S n
-- This captures the structure of the recursive definition
theorem parsePrimaryExp_succ (n : Nat) (xs : list Original_LF__DOT__ImpParser_LF_ImpParser_token) :
  Original_LF__DOT__ImpParser_LF_ImpParser_parsePrimaryExp (Nat.succ n) xs =
  (let (_, _, parseSumExp') := aexpParsers n
   match parseIdentifier xs with
   | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk i rest) =>
       Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (Original_LF__DOT__Imp_LF_Imp_aexp.AId i) rest)
   | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
     match parseNumber xs with
     | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk num rest) =>
         Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (Original_LF__DOT__Imp_LF_Imp_aexp.ANum num) rest)
     | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
       match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_aexp str_lparen parseSumExp' xs with
       | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e rest) =>
         match Original_LF__DOT__ImpParser_LF_ImpParser_expect str_rparen rest with
         | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk _ rest') =>
             Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e rest')
         | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg =>
             Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg
       | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg =>
           Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg) := rfl

-- Reduction equations for parseProductExp'
theorem parseProductExp_eq_zero (xs : list Original_LF__DOT__ImpParser_LF_ImpParser_token) :
  parseProductExp Nat.zero xs =
  Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE too_many_recursive_calls := by rfl

theorem parseProductExp_eq_succ (n : Nat) (xs : list Original_LF__DOT__ImpParser_LF_ImpParser_token) :
  parseProductExp (Nat.succ n) xs =
  (let (parsePrimaryExp', _, _) := aexpParsers n
   match parsePrimaryExp' xs with
   | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg
   | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e rest) =>
     match Original_LF__DOT__ImpParser_LF_ImpParser_many Original_LF__DOT__Imp_LF_Imp_aexp
             (Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_aexp str_star parsePrimaryExp')
             n rest with
     | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg
     | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk es rest') =>
       Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (fold_left_aexp Original_LF__DOT__Imp_LF_Imp_aexp.AMult es e) rest')) := rfl

-- Reduction equations for parseSumExp'
theorem parseSumExp_eq_zero (xs : list Original_LF__DOT__ImpParser_LF_ImpParser_token) :
  parseSumExp Nat.zero xs =
  Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE too_many_recursive_calls := by rfl

theorem parseSumExp_eq_succ (n : Nat) (xs : list Original_LF__DOT__ImpParser_LF_ImpParser_token) :
  parseSumExp (Nat.succ n) xs =
  (let (_, parseProductExp', _) := aexpParsers n
   match parseProductExp' xs with
   | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg
   | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e rest) =>
     match Original_LF__DOT__ImpParser_LF_ImpParser_many (prod mybool Original_LF__DOT__Imp_LF_Imp_aexp)
             (fun xs2 =>
               match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_aexp str_plus parseProductExp' xs2 with
               | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e' rest') =>
                 Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (prod.mk mybool.mytrue e') rest')
               | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
                 match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_aexp str_minus parseProductExp' xs2 with
                 | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e' rest') =>
                   Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (prod.mk mybool.myfalse e') rest')
                 | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg)
             n rest with
     | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg
     | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk es rest') =>
       Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (fold_left_pair (fun e0 term =>
         match term with
         | prod.mk mybool.mytrue e' => Original_LF__DOT__Imp_LF_Imp_aexp.APlus e0 e'
         | prod.mk mybool.myfalse e' => Original_LF__DOT__Imp_LF_Imp_aexp.AMinus e0 e') es e) rest')) := rfl

-- ============================================================
-- Reduction lemmas for Original_LF__DOT__Imp_LF_Imp_bexp parsers
-- ============================================================

theorem bexpParsers_zero :
  bexpParsers Nat.zero =
  (fun _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE too_many_recursive_calls,
   fun _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE too_many_recursive_calls) := rfl

theorem parseAtomicExp_bexp_zero (xs : list Original_LF__DOT__ImpParser_LF_ImpParser_token) :
  Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp Nat.zero xs =
  Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE too_many_recursive_calls := rfl

theorem parseAtomicExp_bexp_succ (n : Nat) (xs : list Original_LF__DOT__ImpParser_LF_ImpParser_token) :
  Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp (Nat.succ n) xs =
  (let (Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp', parseConjunctionExp') := bexpParsers n
   -- TRY Original_LF__DOT__ImpParser_LF_ImpParser_expect "true"
   match Original_LF__DOT__ImpParser_LF_ImpParser_expect str_true xs with
   | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk _ rest) =>
       Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk Original_LF__DOT__Imp_LF_Imp_bexp.BTrue rest)
   | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
     -- TRY Original_LF__DOT__ImpParser_LF_ImpParser_expect "false"
     match Original_LF__DOT__ImpParser_LF_ImpParser_expect str_false xs with
     | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk _ rest) =>
         Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk Original_LF__DOT__Imp_LF_Imp_bexp.BFalse rest)
     | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
       -- TRY Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect "~" (Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp steps')
       match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_bexp str_not Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp' xs with
       | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e rest) =>
           Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (Original_LF__DOT__Imp_LF_Imp_bexp.BNot e) rest)
       | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
         -- TRY Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect "(" (parseConjunctionExp steps') then Original_LF__DOT__ImpParser_LF_ImpParser_expect ")"
         -- Tested as a single unit - if ")" is missing, fall through to arithmetic
         let parenResult :=
           match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_bexp str_lparen parseConjunctionExp' xs with
           | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e rest) =>
             match Original_LF__DOT__ImpParser_LF_ImpParser_expect str_rparen rest with
             | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk _ rest') => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e rest')
             | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE mystring.EmptyString
           | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE mystring.EmptyString
         match parenResult with
         | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e rest') =>
             Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e rest')
         | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
           -- Parse arithmetic expression and compare
           match parseProductExp n xs with
           | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg
           | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e rest) =>
             -- TRY Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect "=" (Original_LF__DOT__ImpParser_LF_ImpParser_parseAExp steps')
             match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_aexp str_eq (Original_LF__DOT__ImpParser_LF_ImpParser_parseAExp n) rest with
             | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e' rest') =>
                 Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (Original_LF__DOT__Imp_LF_Imp_bexp.BEq e e') rest')
             | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
               -- TRY Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect "<=" (Original_LF__DOT__ImpParser_LF_ImpParser_parseAExp steps')
               match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_aexp str_le (Original_LF__DOT__ImpParser_LF_ImpParser_parseAExp n) rest with
               | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e' rest') =>
                   Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (Original_LF__DOT__Imp_LF_Imp_bexp.BLe e e') rest')
               | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
                   Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE expected_eq_or_le_msg) := rfl

theorem parseConjunctionExp_zero (xs : list Original_LF__DOT__ImpParser_LF_ImpParser_token) :
  parseConjunctionExp Nat.zero xs =
  Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE too_many_recursive_calls := rfl

theorem parseConjunctionExp_succ (n : Nat) (xs : list Original_LF__DOT__ImpParser_LF_ImpParser_token) :
  parseConjunctionExp (Nat.succ n) xs =
  (let (Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp', _) := bexpParsers n
   match Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp' xs with
   | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg
   | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e rest) =>
     match Original_LF__DOT__ImpParser_LF_ImpParser_many Original_LF__DOT__Imp_LF_Imp_bexp
             (Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_bexp str_and Original_LF__DOT__ImpParser_LF_ImpParser_parseAtomicExp')
             n rest with
     | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg
     | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk es rest') =>
         Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (fold_left_bexp Original_LF__DOT__Imp_LF_Imp_bexp.BAnd es e) rest')) := rfl

-- parseBExp is just parseConjunctionExp
def Original_LF__DOT__ImpParser_LF_ImpParser_parseBExp := parseConjunctionExp

-- ============================================================
-- com type
-- ============================================================

inductive Original_LF__DOT__Imp_LF_Imp_com : Type where
  | CSkip : Original_LF__DOT__Imp_LF_Imp_com
  | CAsgn : mystring → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_com
  | CSeq : Original_LF__DOT__Imp_LF_Imp_com → Original_LF__DOT__Imp_LF_Imp_com → Original_LF__DOT__Imp_LF_Imp_com
  | CIf : Original_LF__DOT__Imp_LF_Imp_bexp → Original_LF__DOT__Imp_LF_Imp_com → Original_LF__DOT__Imp_LF_Imp_com → Original_LF__DOT__Imp_LF_Imp_com
  | CWhile : Original_LF__DOT__Imp_LF_Imp_bexp → Original_LF__DOT__Imp_LF_Imp_com → Original_LF__DOT__Imp_LF_Imp_com

def Original_LF__DOT__Imp_LF_Imp_CSkip := Original_LF__DOT__Imp_LF_Imp_com.CSkip
def Original_LF__DOT__Imp_LF_Imp_CAsgn := Original_LF__DOT__Imp_LF_Imp_com.CAsgn
def Original_LF__DOT__Imp_LF_Imp_CSeq := Original_LF__DOT__Imp_LF_Imp_com.CSeq
def Original_LF__DOT__Imp_LF_Imp_CIf := Original_LF__DOT__Imp_LF_Imp_com.CIf
def Original_LF__DOT__Imp_LF_Imp_CWhile := Original_LF__DOT__Imp_LF_Imp_com.CWhile

-- ============================================================
-- String constants for commands
-- ============================================================

-- "skip"
def str_skip : mystring := mystring.String char_s (mystring.String char_k (mystring.String char_i (mystring.String char_p mystring.EmptyString)))

-- "if"
def str_if : mystring := mystring.String char_i (mystring.String char_f mystring.EmptyString)

-- "then"
def str_then : mystring := mystring.String char_t (mystring.String char_h (mystring.String char_e (mystring.String char_n mystring.EmptyString)))

-- "else"
def str_else : mystring := mystring.String char_e (mystring.String char_l (mystring.String char_s (mystring.String char_e mystring.EmptyString)))

-- "end"
def str_end : mystring := mystring.String char_e (mystring.String char_n (mystring.String char_d mystring.EmptyString))

-- "while"
def str_while : mystring := mystring.String char_o (mystring.String char_h (mystring.String char_i (mystring.String char_l (mystring.String char_e mystring.EmptyString))))
-- Actually: "while" = w h i l e - let me correct
-- 'w' = 119 = 64+32+16+4+2+1 = 0b01110111
def char_w : ascii := ascii.Ascii mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse
def str_while_correct : mystring := mystring.String char_w (mystring.String char_h (mystring.String char_i (mystring.String char_l (mystring.String char_e mystring.EmptyString))))

-- "do"
def str_do : mystring := mystring.String char_d (mystring.String char_o mystring.EmptyString)

-- ":="
-- ':' = 58 = 32+16+8+2 = 0b00111010
def char_colon_assign : ascii := ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse
def str_assign : mystring := mystring.String char_colon_assign (mystring.String char_eq mystring.EmptyString)

-- ";" - semicolon
-- ';' = 59 = 32+16+8+2+1 = 0b00111011
def char_semicolon : ascii := ascii.Ascii mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse
def str_semicolon : mystring := mystring.String char_semicolon mystring.EmptyString

-- Error messages
def expecting_command_msg : mystring :=
  mystring.String char_E (mystring.String char_x (mystring.String char_p (mystring.String char_e (mystring.String char_c (mystring.String char_t (mystring.String char_i (mystring.String char_n (mystring.String char_g (mystring.String char_space (mystring.String char_a (mystring.String char_space (mystring.String char_c (mystring.String char_o (mystring.String char_m (mystring.String char_m (mystring.String char_a (mystring.String char_n (mystring.String char_d mystring.EmptyString))))))))))))))))))

-- ============================================================
-- parseSimpleCommand and parseSequencedCommand (mutually recursive)
-- ============================================================

def ComParseResult := Original_LF__DOT__ImpParser_LF_ImpParser_optionE (prod Original_LF__DOT__Imp_LF_Imp_com (list Original_LF__DOT__ImpParser_LF_ImpParser_token))

-- Combined mutual recursion
def comParsers (steps : Nat) : (list Original_LF__DOT__ImpParser_LF_ImpParser_token → ComParseResult) × (list Original_LF__DOT__ImpParser_LF_ImpParser_token → ComParseResult) :=
  match steps with
  | Nat.zero => (fun _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE too_many_recursive_calls,
                 fun _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE too_many_recursive_calls)
  | Nat.succ steps' =>
    let (parseSimpleCommand', parseSequencedCommand') := comParsers steps'
    let simpleParser : list Original_LF__DOT__ImpParser_LF_ImpParser_token → ComParseResult := fun xs =>
      -- TRY skip OR
      let skip_result :=
        match Original_LF__DOT__ImpParser_LF_ImpParser_expect str_skip xs with
        | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk _ rest) =>
            Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk Original_LF__DOT__Imp_LF_Imp_com.CSkip rest)
        | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE mystring.EmptyString
      match skip_result with
      | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE result => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE result
      | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
        -- TRY if-then-else-end OR
        let if_result := id
          (match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_bexp str_if (Original_LF__DOT__ImpParser_LF_ImpParser_parseBExp steps') xs with
          | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e rest) =>
              match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_com str_then parseSequencedCommand' rest with
              | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk c rest') =>
                  match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_com str_else parseSequencedCommand' rest' with
                  | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk c' rest'') =>
                      match Original_LF__DOT__ImpParser_LF_ImpParser_expect str_end rest'' with
                      | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk _ rest''') =>
                          Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (Original_LF__DOT__Imp_LF_Imp_com.CIf e c c') rest''')
                      | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE mystring.EmptyString
                  | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE mystring.EmptyString
              | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE mystring.EmptyString
          | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE mystring.EmptyString)
        match if_result with
        | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE result => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE result
        | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
          -- TRY while-do-end OR
          let while_result :=
            match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_bexp str_while_correct (Original_LF__DOT__ImpParser_LF_ImpParser_parseBExp steps') xs with
            | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e rest) =>
                match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_com str_do parseSequencedCommand' rest with
                | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk c rest') =>
                    match Original_LF__DOT__ImpParser_LF_ImpParser_expect str_end rest' with
                    | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk _ rest'') =>
                        Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (Original_LF__DOT__Imp_LF_Imp_com.CWhile e c) rest'')
                    | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE mystring.EmptyString
                | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE mystring.EmptyString
            | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE mystring.EmptyString
          match while_result with
          | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE result => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE result
          | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
            -- TRY assignment x := e OR NoneE "Expecting a command"
            let assign_result :=
              match Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier xs with
              | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk i rest) =>
                  match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_aexp str_assign (Original_LF__DOT__ImpParser_LF_ImpParser_parseAExp steps') rest with
                  | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e rest') =>
                      Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (Original_LF__DOT__Imp_LF_Imp_com.CAsgn i e) rest')
                  | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE mystring.EmptyString
              | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE mystring.EmptyString
            match assign_result with
            | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE result => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE result
            | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
                Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE expecting_command_msg
    let seqParser : list Original_LF__DOT__ImpParser_LF_ImpParser_token → ComParseResult := fun xs =>
      match parseSimpleCommand' xs with
      | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg
      | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk c rest) =>
          match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_com str_semicolon parseSequencedCommand' rest with
          | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk c' rest') =>
              Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (Original_LF__DOT__Imp_LF_Imp_com.CSeq c c') rest')
          | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
              Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk c rest)
    (simpleParser, seqParser)

def Original_LF__DOT__ImpParser_LF_ImpParser_parseSimpleCommand (steps : Nat) : list Original_LF__DOT__ImpParser_LF_ImpParser_token → ComParseResult :=
  (comParsers steps).1

def Original_LF__DOT__ImpParser_LF_ImpParser_parseSequencedCommand (steps : Nat) : list Original_LF__DOT__ImpParser_LF_ImpParser_token → ComParseResult :=
  (comParsers steps).2

-- Eta-expansion equations
theorem parseSimpleCommand_zero (xs : list Original_LF__DOT__ImpParser_LF_ImpParser_token) :
  Original_LF__DOT__ImpParser_LF_ImpParser_parseSimpleCommand Nat.zero xs =
  Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE too_many_recursive_calls := rfl

theorem parseSequencedCommand_zero (xs : list Original_LF__DOT__ImpParser_LF_ImpParser_token) :
  Original_LF__DOT__ImpParser_LF_ImpParser_parseSequencedCommand Nat.zero xs =
  Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE too_many_recursive_calls := rfl

-- The theorem reflects what Lean actually compiles to
-- Key insight: Lean inlines the let bindings and for the if case, inner failures
-- return NoneE msg directly. Only when firstExpect "if" fails does it fall through to while.
theorem parseSimpleCommand_succ (n : Nat) (xs : list Original_LF__DOT__ImpParser_LF_ImpParser_token) :
  Original_LF__DOT__ImpParser_LF_ImpParser_parseSimpleCommand (Nat.succ n) xs =
    let (parseSimpleCommand', parseSequencedCommand') := comParsers n
      -- TRY skip OR
      let skip_result :=
        match Original_LF__DOT__ImpParser_LF_ImpParser_expect str_skip xs with
        | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk _ rest) =>
            Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk Original_LF__DOT__Imp_LF_Imp_com.CSkip rest)
        | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE mystring.EmptyString
      match skip_result with
      | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE result => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE result
      | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
        -- TRY if-then-else-end OR
        have if_result := (
          match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_bexp str_if (Original_LF__DOT__ImpParser_LF_ImpParser_parseBExp n) xs with
          | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e rest) =>
              match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_com str_then parseSequencedCommand' rest with
              | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk c rest') =>
                  match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_com str_else parseSequencedCommand' rest' with
                  | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk c' rest'') =>
                      match Original_LF__DOT__ImpParser_LF_ImpParser_expect str_end rest'' with
                      | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk _ rest''') =>
                          Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (Original_LF__DOT__Imp_LF_Imp_com.CIf e c c') rest''')
                      | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE mystring.EmptyString
                  | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE mystring.EmptyString
              | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE mystring.EmptyString
          | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE mystring.EmptyString)
        match if_result with
        | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE result => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE result
        | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
          -- TRY while-do-end OR
          let while_result :=
            match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_bexp str_while_correct (Original_LF__DOT__ImpParser_LF_ImpParser_parseBExp n) xs with
            | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e rest) =>
                match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_com str_do parseSequencedCommand' rest with
                | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk c rest') =>
                    match Original_LF__DOT__ImpParser_LF_ImpParser_expect str_end rest' with
                    | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk _ rest'') =>
                        Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (Original_LF__DOT__Imp_LF_Imp_com.CWhile e c) rest'')
                    | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE mystring.EmptyString
                | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE mystring.EmptyString
            | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE mystring.EmptyString
          match while_result with
          | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE result => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE result
          | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
            -- TRY assignment x := e OR NoneE "Expecting a command"
            let assign_result :=
              match Original_LF__DOT__ImpParser_LF_ImpParser_parseIdentifier xs with
              | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk i rest) =>
                  match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_aexp str_assign (Original_LF__DOT__ImpParser_LF_ImpParser_parseAExp n) rest with
                  | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk e rest') =>
                      Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (Original_LF__DOT__Imp_LF_Imp_com.CAsgn i e) rest')
                  | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE mystring.EmptyString
              | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE mystring.EmptyString
            match assign_result with
            | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE result => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE result
            | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
                Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE expecting_command_msg := rfl

theorem parseSequencedCommand_succ (n : Nat) (xs : list Original_LF__DOT__ImpParser_LF_ImpParser_token) :
  Original_LF__DOT__ImpParser_LF_ImpParser_parseSequencedCommand (Nat.succ n) xs =
  (let parseSimpleCommand' := Original_LF__DOT__ImpParser_LF_ImpParser_parseSimpleCommand n
   let parseSequencedCommand' := Original_LF__DOT__ImpParser_LF_ImpParser_parseSequencedCommand n
   match parseSimpleCommand' xs with
   | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg => Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg
   | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk c rest) =>
       match Original_LF__DOT__ImpParser_LF_ImpParser_firstExpect Original_LF__DOT__Imp_LF_Imp_com str_semicolon parseSequencedCommand' rest with
       | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk c' rest') =>
           Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk (Original_LF__DOT__Imp_LF_Imp_com.CSeq c c') rest')
       | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE _ =>
           Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk c rest)) := rfl

-- ============================================================
-- bignumber (constant 1000)
-- ============================================================

def Original_LF__DOT__ImpParser_LF_ImpParser_bignumber : Nat := 1000

-- ============================================================
-- chartype inductive type
-- ============================================================

inductive Original_LF__DOT__ImpParser_LF_ImpParser_chartype : Type where
  | white : Original_LF__DOT__ImpParser_LF_ImpParser_chartype
  | alpha : Original_LF__DOT__ImpParser_LF_ImpParser_chartype
  | digit : Original_LF__DOT__ImpParser_LF_ImpParser_chartype
  | other : Original_LF__DOT__ImpParser_LF_ImpParser_chartype

-- ============================================================
-- isWhite function
-- ============================================================

-- ASCII codes: space=32, tab=9, newline=10, carriage return=13
def mynat2_9 : mynat2 := mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S (mynat2.S mynat2.O))))))))
def mynat2_10 : mynat2 := mynat2.S mynat2_9
def mynat2_13 : mynat2 := mynat2.S (mynat2.S (mynat2.S mynat2_10))

def mynat2_eqb : mynat2 → mynat2 → mybool
  | mynat2.O, mynat2.O => mybool.mytrue
  | mynat2.S n, mynat2.S m => mynat2_eqb n m
  | _, _ => mybool.myfalse

def mybool_orb : mybool → mybool → mybool
  | mybool.mytrue, _ => mybool.mytrue
  | mybool.myfalse, b => b

def isWhite (c : ascii) : mybool :=
  let n := nat_of_ascii2 c
  mybool_orb (mybool_orb (mynat2_eqb n mynat2_32) (mynat2_eqb n mynat2_9))
             (mybool_orb (mynat2_eqb n mynat2_10) (mynat2_eqb n mynat2_13))

def Original_LF__DOT__ImpParser_LF_ImpParser_isWhite := isWhite

-- isAlpha: checks if char is a-z or A-Z
-- We already have isLowerAlpha for 97-122. For A-Z (65-90):
-- 65 = 64 + 1
def mynat2_65 : mynat2 := mynat2.S mynat2_64
-- 90 = 65 + 25 = 65 + 16 + 8 + 1
def mynat2_90 : mynat2 := mynat2_add mynat2_65 (mynat2_add mynat2_16 (mynat2_add mynat2_8 mynat2_1))

def isUpperAlpha (c : ascii) : mybool :=
  let n := nat_of_ascii2 c
  mybool_andb (mynat2_leb mynat2_65 n) (mynat2_leb n mynat2_90)

def isAlpha (c : ascii) : mybool :=
  mybool_orb (isLowerAlpha c) (isUpperAlpha c)

def Original_LF__DOT__ImpParser_LF_ImpParser_isAlpha := isAlpha

-- ============================================================
-- classifyChar function
-- ============================================================

def Original_LF__DOT__ImpParser_LF_ImpParser_classifyChar (c : ascii) : Original_LF__DOT__ImpParser_LF_ImpParser_chartype :=
  match isWhite c with
  | mybool.mytrue => Original_LF__DOT__ImpParser_LF_ImpParser_chartype.white
  | mybool.myfalse =>
    match isAlpha c with
    | mybool.mytrue => Original_LF__DOT__ImpParser_LF_ImpParser_chartype.alpha
    | mybool.myfalse =>
      match isDigit c with
      | mybool.mytrue => Original_LF__DOT__ImpParser_LF_ImpParser_chartype.digit
      | mybool.myfalse => Original_LF__DOT__ImpParser_LF_ImpParser_chartype.other

-- ============================================================
-- string_of_list: fold_right String EmptyString
-- ============================================================

def fold_right_ascii (f : ascii → mystring → mystring) (init : mystring) : list ascii → mystring
  | list.nil => init
  | list.cons x xs => f x (fold_right_ascii f init xs)

def Original_LF__DOT__ImpParser_LF_ImpParser_string__of__list (xs : list ascii) : mystring :=
  fold_right_ascii mystring.String mystring.EmptyString xs

-- ============================================================
-- tokenize_helper function
-- ============================================================

-- Characters for '(' and ')': ASCII 40 and 41
def char_lparen_ascii : ascii := ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse  -- 40 = '('
def char_rparen_ascii : ascii := ascii.Ascii mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse  -- 41 = ')'

def list_rev_ascii : list ascii → list ascii → list ascii
  | acc, list.nil => acc
  | acc, list.cons x xs => list_rev_ascii (list.cons x acc) xs

def rev_ascii (xs : list ascii) : list ascii := list_rev_ascii list.nil xs

def list_app_ascii : list ascii → list ascii → list ascii
  | list.nil, ys => ys
  | list.cons x xs, ys => list.cons x (list_app_ascii xs ys)

def list_app_list_ascii : list (list ascii) → list (list ascii) → list (list ascii)
  | list.nil, ys => ys
  | list.cons x xs, ys => list.cons x (list_app_list_ascii xs ys)

def Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper :
    Original_LF__DOT__ImpParser_LF_ImpParser_chartype → list ascii → list ascii → list (list ascii)
  | cls, acc, list.nil =>
    match acc with
    | list.nil => list.nil
    | list.cons _ _ => list.cons (rev_ascii acc) list.nil
  | cls, acc, list.cons x xs =>
    let tk : list (list ascii) :=
      match acc with
      | list.nil => list.nil
      | list.cons _ _ => list.cons (rev_ascii acc) list.nil
    -- Check for '(' or ')'
    match ascii_eq x char_lparen_ascii with
    | mybool.mytrue =>
      list_app_list_ascii tk (list.cons (list.cons char_lparen_ascii list.nil)
        (Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper Original_LF__DOT__ImpParser_LF_ImpParser_chartype.other list.nil xs))
    | mybool.myfalse =>
      match ascii_eq x char_rparen_ascii with
      | mybool.mytrue =>
        list_app_list_ascii tk (list.cons (list.cons char_rparen_ascii list.nil)
          (Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper Original_LF__DOT__ImpParser_LF_ImpParser_chartype.other list.nil xs))
      | mybool.myfalse =>
        let charClass := Original_LF__DOT__ImpParser_LF_ImpParser_classifyChar x
        match charClass with
        | Original_LF__DOT__ImpParser_LF_ImpParser_chartype.white =>
          list_app_list_ascii tk (Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper Original_LF__DOT__ImpParser_LF_ImpParser_chartype.white list.nil xs)
        | Original_LF__DOT__ImpParser_LF_ImpParser_chartype.alpha =>
          match cls with
          | Original_LF__DOT__ImpParser_LF_ImpParser_chartype.alpha =>
            Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper Original_LF__DOT__ImpParser_LF_ImpParser_chartype.alpha (list.cons x acc) xs
          | _ =>
            list_app_list_ascii tk (Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper Original_LF__DOT__ImpParser_LF_ImpParser_chartype.alpha (list.cons x list.nil) xs)
        | Original_LF__DOT__ImpParser_LF_ImpParser_chartype.digit =>
          match cls with
          | Original_LF__DOT__ImpParser_LF_ImpParser_chartype.digit =>
            Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper Original_LF__DOT__ImpParser_LF_ImpParser_chartype.digit (list.cons x acc) xs
          | _ =>
            list_app_list_ascii tk (Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper Original_LF__DOT__ImpParser_LF_ImpParser_chartype.digit (list.cons x list.nil) xs)
        | Original_LF__DOT__ImpParser_LF_ImpParser_chartype.other =>
          match cls with
          | Original_LF__DOT__ImpParser_LF_ImpParser_chartype.other =>
            Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper Original_LF__DOT__ImpParser_LF_ImpParser_chartype.other (list.cons x acc) xs
          | _ =>
            list_app_list_ascii tk (Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper Original_LF__DOT__ImpParser_LF_ImpParser_chartype.other (list.cons x list.nil) xs)

-- ============================================================
-- tokenize function
-- ============================================================

def map_string_of_list : list (list ascii) → list mystring
  | list.nil => list.nil
  | list.cons x xs => list.cons (Original_LF__DOT__ImpParser_LF_ImpParser_string__of__list x) (map_string_of_list xs)

def Original_LF__DOT__ImpParser_LF_ImpParser_tokenize (s : mystring) : list mystring :=
  map_string_of_list (Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper Original_LF__DOT__ImpParser_LF_ImpParser_chartype.white list.nil (list_of_string s))

-- ============================================================
-- parse function
-- ============================================================

-- String "Trailing tokens remaining: "
def str_trailing_tokens : mystring :=
  mystring.String char_T (mystring.String char_r (mystring.String char_a (mystring.String char_i (mystring.String char_l (mystring.String char_i (mystring.String char_n (mystring.String char_g (mystring.String char_space (mystring.String char_t (mystring.String char_o (mystring.String char_k (mystring.String char_e (mystring.String char_n (mystring.String char_s (mystring.String char_space (mystring.String char_r (mystring.String char_e (mystring.String char_m (mystring.String char_a (mystring.String char_i (mystring.String char_n (mystring.String char_i (mystring.String char_n (mystring.String char_g (mystring.String char_colon (mystring.String char_space mystring.EmptyString))))))))))))))))))))))))))

def Original_LF__DOT__ImpParser_LF_ImpParser_parse (s : mystring) : Original_LF__DOT__ImpParser_LF_ImpParser_optionE Original_LF__DOT__Imp_LF_Imp_com :=
  let tokens := Original_LF__DOT__ImpParser_LF_ImpParser_tokenize s
  match Original_LF__DOT__ImpParser_LF_ImpParser_parseSequencedCommand Original_LF__DOT__ImpParser_LF_ImpParser_bignumber tokens with
  | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk c list.nil) =>
      Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE c
  | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE (prod.mk _ (list.cons t _)) =>
      Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE (mystring_append str_trailing_tokens t)
  | Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg =>
      Original_LF__DOT__ImpParser_LF_ImpParser_optionE.NoneE msg
-- ============================================================
-- eg1 example (Admitted in original)
-- ============================================================

-- The eg1 example is Admitted in the original, so we use sorry
-- The input string is: "\n  if x = y + 1 + 2 - y * 6 + 3 then\n    x := x * 1;\n    y := 0\n  else\n    skip\n  end  "
def eg1_input_string : mystring :=
  mystring.String char_newline
    (mystring.String char_space
    (mystring.String char_space
    (mystring.String char_i
    (mystring.String char_f
    (mystring.String char_space
    (mystring.String char_x
    (mystring.String char_space
    (mystring.String char_eq
    (mystring.String char_space
    (mystring.String char_y
    (mystring.String char_space
    (mystring.String char_plus
    (mystring.String char_space
    (mystring.String char_1
    (mystring.String char_space
    (mystring.String char_plus
    (mystring.String char_space
    (mystring.String char_2
    (mystring.String char_space
    (mystring.String char_minus
    (mystring.String char_space
    (mystring.String char_y
    (mystring.String char_space
    (mystring.String char_star
    (mystring.String char_space
    (mystring.String char_6
    (mystring.String char_space
    (mystring.String char_plus
    (mystring.String char_space
    (mystring.String char_3
    (mystring.String char_space
    (mystring.String char_t
    (mystring.String char_h
    (mystring.String char_e
    (mystring.String char_n
    (mystring.String char_newline
    (mystring.String char_space
    (mystring.String char_space
    (mystring.String char_space
    (mystring.String char_space
    (mystring.String char_x
    (mystring.String char_space
    (mystring.String char_colon
    (mystring.String char_eq
    (mystring.String char_space
    (mystring.String char_x
    (mystring.String char_space
    (mystring.String char_star
    (mystring.String char_space
    (mystring.String char_1
    (mystring.String char_semicolon
    (mystring.String char_newline
    (mystring.String char_space
    (mystring.String char_space
    (mystring.String char_space
    (mystring.String char_space
    (mystring.String char_y
    (mystring.String char_space
    (mystring.String char_colon
    (mystring.String char_eq
    (mystring.String char_space
    (mystring.String char_0
    (mystring.String char_newline
    (mystring.String char_space
    (mystring.String char_space
    (mystring.String char_e
    (mystring.String char_l
    (mystring.String char_s
    (mystring.String char_e
    (mystring.String char_newline
    (mystring.String char_space
    (mystring.String char_space
    (mystring.String char_space
    (mystring.String char_space
    (mystring.String char_s
    (mystring.String char_k
    (mystring.String char_i
    (mystring.String char_p
    (mystring.String char_newline
    (mystring.String char_space
    (mystring.String char_space
    (mystring.String char_e
    (mystring.String char_n
    (mystring.String char_d
    (mystring.String char_space
    (mystring.String char_space
    mystring.EmptyString))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

def eg1_expected_result : Original_LF__DOT__ImpParser_LF_ImpParser_optionE Original_LF__DOT__Imp_LF_Imp_com :=
  Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE
    (Original_LF__DOT__Imp_LF_Imp_com.CIf
      (Original_LF__DOT__Imp_LF_Imp_bexp.BEq
        (Original_LF__DOT__Imp_LF_Imp_aexp.AId (mystring.String char_x mystring.EmptyString))
        (Original_LF__DOT__Imp_LF_Imp_aexp.APlus
          (Original_LF__DOT__Imp_LF_Imp_aexp.AMinus
            (Original_LF__DOT__Imp_LF_Imp_aexp.APlus
              (Original_LF__DOT__Imp_LF_Imp_aexp.APlus
                (Original_LF__DOT__Imp_LF_Imp_aexp.AId (mystring.String char_y mystring.EmptyString))
                (Original_LF__DOT__Imp_LF_Imp_aexp.ANum (Nat.succ Nat.zero)))
              (Original_LF__DOT__Imp_LF_Imp_aexp.ANum (Nat.succ (Nat.succ Nat.zero))))
            (Original_LF__DOT__Imp_LF_Imp_aexp.AMult
              (Original_LF__DOT__Imp_LF_Imp_aexp.AId (mystring.String char_y mystring.EmptyString))
              (Original_LF__DOT__Imp_LF_Imp_aexp.ANum (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ Nat.zero)))))))))
          (Original_LF__DOT__Imp_LF_Imp_aexp.ANum (Nat.succ (Nat.succ (Nat.succ Nat.zero))))))
      (Original_LF__DOT__Imp_LF_Imp_com.CSeq
        (Original_LF__DOT__Imp_LF_Imp_com.CAsgn
          (mystring.String char_x mystring.EmptyString)
          (Original_LF__DOT__Imp_LF_Imp_aexp.AMult
            (Original_LF__DOT__Imp_LF_Imp_aexp.AId (mystring.String char_x mystring.EmptyString))
            (Original_LF__DOT__Imp_LF_Imp_aexp.ANum (Nat.succ Nat.zero))))
        (Original_LF__DOT__Imp_LF_Imp_com.CAsgn
          (mystring.String char_y mystring.EmptyString)
          (Original_LF__DOT__Imp_LF_Imp_aexp.ANum Nat.zero)))
      Original_LF__DOT__Imp_LF_Imp_com.CSkip)

-- The eg1 theorem: parse eg1_input_string = eg1_expected_result
-- Since it's Admitted in the original, we use an axiom
axiom Original_LF__DOT__ImpParser_LF_ImpParser_eg1 :
  Corelib_Init_Logic_eq
    (Original_LF__DOT__ImpParser_LF_ImpParser_optionE Original_LF__DOT__Imp_LF_Imp_com)
    (Original_LF__DOT__ImpParser_LF_ImpParser_parse eg1_input_string)
    eg1_expected_result


-- ============================================================
-- eg2 definitions 
-- ============================================================

-- Character 'z' (ASCII 122)
def char_z : ascii := ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse

-- eg2 input string
def eg2_input_string : mystring :=
  (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) (mystring.String (ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.myfalse mybool.myfalse) mystring.EmptyString)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

-- eg2 expected result
def eg2_expected_result : Original_LF__DOT__ImpParser_LF_ImpParser_optionE Original_LF__DOT__Imp_LF_Imp_com :=
  Original_LF__DOT__ImpParser_LF_ImpParser_optionE.SomeE
    (Original_LF__DOT__Imp_LF_Imp_com.CSeq
      Original_LF__DOT__Imp_LF_Imp_com.CSkip
      (Original_LF__DOT__Imp_LF_Imp_com.CSeq
        (Original_LF__DOT__Imp_LF_Imp_com.CAsgn
          (mystring.String char_z mystring.EmptyString)
          (Original_LF__DOT__Imp_LF_Imp_aexp.AMult
            (Original_LF__DOT__Imp_LF_Imp_aexp.AMult
              (Original_LF__DOT__Imp_LF_Imp_aexp.AId (mystring.String char_x mystring.EmptyString))
              (Original_LF__DOT__Imp_LF_Imp_aexp.AId (mystring.String char_y mystring.EmptyString)))
            (Original_LF__DOT__Imp_LF_Imp_aexp.AMult
              (Original_LF__DOT__Imp_LF_Imp_aexp.AId (mystring.String char_x mystring.EmptyString))
              (Original_LF__DOT__Imp_LF_Imp_aexp.AId (mystring.String char_x mystring.EmptyString)))))
        (Original_LF__DOT__Imp_LF_Imp_com.CSeq
          (Original_LF__DOT__Imp_LF_Imp_com.CWhile
            (Original_LF__DOT__Imp_LF_Imp_bexp.BEq
              (Original_LF__DOT__Imp_LF_Imp_aexp.AId (mystring.String char_x mystring.EmptyString))
              (Original_LF__DOT__Imp_LF_Imp_aexp.AId (mystring.String char_x mystring.EmptyString)))
            (Original_LF__DOT__Imp_LF_Imp_com.CSeq
              (Original_LF__DOT__Imp_LF_Imp_com.CIf
                (Original_LF__DOT__Imp_LF_Imp_bexp.BAnd
                  (Original_LF__DOT__Imp_LF_Imp_bexp.BLe
                    (Original_LF__DOT__Imp_LF_Imp_aexp.AId (mystring.String char_z mystring.EmptyString))
                    (Original_LF__DOT__Imp_LF_Imp_aexp.AMult
                      (Original_LF__DOT__Imp_LF_Imp_aexp.AId (mystring.String char_z mystring.EmptyString))
                      (Original_LF__DOT__Imp_LF_Imp_aexp.AId (mystring.String char_z mystring.EmptyString))))
                  (Original_LF__DOT__Imp_LF_Imp_bexp.BNot
                    (Original_LF__DOT__Imp_LF_Imp_bexp.BEq
                      (Original_LF__DOT__Imp_LF_Imp_aexp.AId (mystring.String char_x mystring.EmptyString))
                      (Original_LF__DOT__Imp_LF_Imp_aexp.ANum (Nat.succ (Nat.succ Nat.zero))))))
                (Original_LF__DOT__Imp_LF_Imp_com.CSeq
                  (Original_LF__DOT__Imp_LF_Imp_com.CAsgn
                    (mystring.String char_x mystring.EmptyString)
                    (Original_LF__DOT__Imp_LF_Imp_aexp.AId (mystring.String char_z mystring.EmptyString)))
                  (Original_LF__DOT__Imp_LF_Imp_com.CAsgn
                    (mystring.String char_y mystring.EmptyString)
                    (Original_LF__DOT__Imp_LF_Imp_aexp.AId (mystring.String char_z mystring.EmptyString))))
                Original_LF__DOT__Imp_LF_Imp_com.CSkip)
              Original_LF__DOT__Imp_LF_Imp_com.CSkip))
          (Original_LF__DOT__Imp_LF_Imp_com.CAsgn
            (mystring.String char_x mystring.EmptyString)
            (Original_LF__DOT__Imp_LF_Imp_aexp.AId (mystring.String char_z mystring.EmptyString))))))

-- The eg2 theorem: parse eg2_input_string = eg2_expected_result
-- Since it's Admitted in the original, we use an axiom
axiom Original_LF__DOT__ImpParser_LF_ImpParser_eg2 :
  Corelib_Init_Logic_eq
    (Original_LF__DOT__ImpParser_LF_ImpParser_optionE Original_LF__DOT__Imp_LF_Imp_com)
    (Original_LF__DOT__ImpParser_LF_ImpParser_parse eg2_input_string)
    eg2_expected_result
