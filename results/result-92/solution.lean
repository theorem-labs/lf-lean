-- Comprehensive Lean translation for all required isomorphisms
set_option linter.all false

-- ============================================================
-- True and False in Prop
-- ============================================================

inductive TrueType : Prop where
  | I : TrueType

def TrueType_I := TrueType.I

inductive FalseType : Prop where

-- Alias for Original.False (different from Prop False)
inductive Original_False : Prop where

-- ============================================================
-- Boolean type (mybool to avoid conflicts)
-- ============================================================

inductive mybool : Type where
  | mytrue : mybool
  | myfalse : mybool

def mybool_mytrue : mybool := mybool.mytrue
def mybool_myfalse : mybool := mybool.myfalse
def _true : mybool := mybool.mytrue
def _false : mybool := mybool.myfalse
def _bool : Type := mybool

-- ============================================================
-- Natural numbers
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

def nat_eqb : nat → nat → mybool
  | nat.O, nat.O => mybool.mytrue
  | nat.S n, nat.S m => nat_eqb n m
  | _, _ => mybool.myfalse

def nat_leb : nat → nat → mybool
  | nat.O, _ => mybool.mytrue
  | nat.S _, nat.O => mybool.myfalse
  | nat.S n, nat.S m => nat_leb n m

def bool_negb : mybool → mybool
  | mybool.mytrue => mybool.myfalse
  | mybool.myfalse => mybool.mytrue

def bool_andb : mybool → mybool → mybool
  | mybool.mytrue, b => b
  | mybool.myfalse, _ => mybool.myfalse

def bool_orb : mybool → mybool → mybool
  | mybool.mytrue, _ => mybool.mytrue
  | mybool.myfalse, b => b

def Bool_eqb : mybool → mybool → mybool
  | mybool.mytrue, mybool.mytrue => mybool.mytrue
  | mybool.myfalse, mybool.myfalse => mybool.mytrue
  | _, _ => mybool.myfalse

-- ============================================================
-- Ascii and String
-- ============================================================

inductive Ascii_ascii : Type where
  | Ascii : mybool → mybool → mybool → mybool → mybool → mybool → mybool → mybool → Ascii_ascii

def Ascii_ascii_Ascii := Ascii_ascii.Ascii

def Ascii_eqb : Ascii_ascii → Ascii_ascii → mybool
  | Ascii_ascii.Ascii b0 b1 b2 b3 b4 b5 b6 b7, Ascii_ascii.Ascii c0 c1 c2 c3 c4 c5 c6 c7 =>
    bool_andb (Bool_eqb b0 c0)
      (bool_andb (Bool_eqb b1 c1)
        (bool_andb (Bool_eqb b2 c2)
          (bool_andb (Bool_eqb b3 c3)
            (bool_andb (Bool_eqb b4 c4)
              (bool_andb (Bool_eqb b5 c5)
                (bool_andb (Bool_eqb b6 c6)
                  (Bool_eqb b7 c7)))))))

inductive String_string : Type where
  | EmptyString : String_string
  | String : Ascii_ascii → String_string → String_string

def String_string_EmptyString := String_string.EmptyString
def String_string_String := String_string.String
def String_EmptyString := String_string.EmptyString
def String_String := String_string.String

def String_eqb : String_string → String_string → mybool
  | String_string.EmptyString, String_string.EmptyString => mybool.mytrue
  | String_string.String c1 s1, String_string.String c2 s2 =>
    bool_andb (Ascii_eqb c1 c2) (String_eqb s1 s2)
  | _, _ => mybool.myfalse

-- ============================================================
-- Equality in Prop (becomes SProp in Rocq)
-- ============================================================

inductive Corelib_Init_Logic_eq {A : Type} : A → A → Prop where
  | refl (a : A) : Corelib_Init_Logic_eq a a

def Corelib_Init_Logic_eq_refl {A : Type} (a : A) : Corelib_Init_Logic_eq a a :=
  Corelib_Init_Logic_eq.refl a

inductive Corelib_Init_Logic_eq_Prop {A : Prop} : A → A → Prop where
  | refl (a : A) : Corelib_Init_Logic_eq_Prop a a

def Corelib_Init_Logic_eq_Prop_refl {A : Prop} (a : A) : Corelib_Init_Logic_eq_Prop a a :=
  Corelib_Init_Logic_eq_Prop.refl a

-- ============================================================
-- Polymorphic list
-- ============================================================

inductive list (A : Type) : Type where
  | nil : list A
  | cons : A → list A → list A

def nil (A : Type) : list A := list.nil
def cons (A : Type) (h : A) (t : list A) : list A := list.cons h t

def app (A : Type) : list A → list A → list A
  | list.nil, l2 => l2
  | list.cons h t, l2 => list.cons h (app A t l2)

-- List.In for standard list type
def List_In {A : Type} (a : A) : list A → Prop
  | list.nil => FalseType
  | list.cons b l' => Corelib_Init_Logic_eq b a ∨ List_In a l'

-- ============================================================
-- Existential, conjunction, disjunction
-- ============================================================

inductive ex {A : Type} (P : A → Prop) : Prop where
  | intro (w : A) (h : P w) : ex P

inductive and (A B : Prop) : Prop where
  | intro (ha : A) (hb : B) : and A B

inductive or (A B : Prop) : Prop where
  | inl (ha : A) : or A B
  | inr (hb : B) : or A B

def iff (A B : Prop) : Prop := and (A → B) (B → A)

def Logic_not (P : Prop) : Prop := P → FalseType

inductive prod (A B : Type) : Type where
  | pair : A → B → prod A B

def prod_pair (A B : Type) (a : A) (b : B) : prod A B := prod.pair a b

-- ============================================================
-- Option type
-- ============================================================

inductive option (A : Type) : Type where
  | None : option A
  | Some : A → option A

def option_None (A : Type) : option A := option.None
def option_Some (A : Type) (a : A) : option A := option.Some a
def None (A : Type) : option A := option.None
def Some (A : Type) (a : A) : option A := option.Some a

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

def Original_LF__DOT__Basics_LF_Basics_negb : Original_LF__DOT__Basics_LF_Basics_bool → Original_LF__DOT__Basics_LF_Basics_bool
  | Original_LF__DOT__Basics_LF_Basics_bool.true => Original_LF__DOT__Basics_LF_Basics_bool.false
  | Original_LF__DOT__Basics_LF_Basics_bool.false => Original_LF__DOT__Basics_LF_Basics_bool.true

def Original_LF__DOT__Basics_LF_Basics_andb : Original_LF__DOT__Basics_LF_Basics_bool → Original_LF__DOT__Basics_LF_Basics_bool → Original_LF__DOT__Basics_LF_Basics_bool
  | Original_LF__DOT__Basics_LF_Basics_bool.true, b => b
  | Original_LF__DOT__Basics_LF_Basics_bool.false, _ => Original_LF__DOT__Basics_LF_Basics_bool.false

def Original_LF__DOT__Basics_LF_Basics_orb : Original_LF__DOT__Basics_LF_Basics_bool → Original_LF__DOT__Basics_LF_Basics_bool → Original_LF__DOT__Basics_LF_Basics_bool
  | Original_LF__DOT__Basics_LF_Basics_bool.true, _ => Original_LF__DOT__Basics_LF_Basics_bool.true
  | Original_LF__DOT__Basics_LF_Basics_bool.false, b => b

def Original_LF__DOT__Basics_LF_Basics_even : nat → Original_LF__DOT__Basics_LF_Basics_bool
  | nat.O => Original_LF__DOT__Basics_LF_Basics_bool.true
  | nat.S nat.O => Original_LF__DOT__Basics_LF_Basics_bool.false
  | nat.S (nat.S n') => Original_LF__DOT__Basics_LF_Basics_even n'

def Original_LF__DOT__Basics_LF_Basics_odd (n : nat) : Original_LF__DOT__Basics_LF_Basics_bool :=
  Original_LF__DOT__Basics_LF_Basics_negb (Original_LF__DOT__Basics_LF_Basics_even n)

-- identity_fn_applied_twice (admitted in Original.v)
axiom Original_LF__DOT__Basics_LF_Basics_identity__fn__applied__twice :
  ∀ (f : Original_LF__DOT__Basics_LF_Basics_bool → Original_LF__DOT__Basics_LF_Basics_bool),
    (∀ (x : Original_LF__DOT__Basics_LF_Basics_bool), Corelib_Init_Logic_eq (f x) x) →
    ∀ (b : Original_LF__DOT__Basics_LF_Basics_bool), Corelib_Init_Logic_eq (f (f b)) b

-- andb_eq_orb (admitted in Original.v)
axiom Original_LF__DOT__Basics_LF_Basics_andb__eq__orb :
  ∀ (b c : Original_LF__DOT__Basics_LF_Basics_bool),
    Corelib_Init_Logic_eq (Original_LF__DOT__Basics_LF_Basics_andb b c) (Original_LF__DOT__Basics_LF_Basics_orb b c) →
    Corelib_Init_Logic_eq b c

-- ============================================================
-- Original.LF_DOT_Poly definitions
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
-- Original.LF_DOT_Logic definitions
-- ============================================================

def Original_LF__DOT__Logic_LF_Logic_In {X : Type} (x : X) : Original_LF__DOT__Poly_LF_Poly_list X → Prop
  | Original_LF__DOT__Poly_LF_Poly_list.nil => Original_False
  | Original_LF__DOT__Poly_LF_Poly_list.cons x' l' => Corelib_Init_Logic_eq x' x ∨ Original_LF__DOT__Logic_LF_Logic_In x l'

-- ============================================================
-- Original.LF_DOT_IndProp definitions
-- ============================================================

inductive Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3 {X : Type} :
    Original_LF__DOT__Poly_LF_Poly_list X → Original_LF__DOT__Poly_LF_Poly_list X → Prop where
  | perm3_swap12 (a b c : X) :
      Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3
        (Original_LF__DOT__Poly_LF_Poly_list.cons a (Original_LF__DOT__Poly_LF_Poly_list.cons b (Original_LF__DOT__Poly_LF_Poly_list.cons c Original_LF__DOT__Poly_LF_Poly_list.nil)))
        (Original_LF__DOT__Poly_LF_Poly_list.cons b (Original_LF__DOT__Poly_LF_Poly_list.cons a (Original_LF__DOT__Poly_LF_Poly_list.cons c Original_LF__DOT__Poly_LF_Poly_list.nil)))
  | perm3_swap23 (a b c : X) :
      Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3
        (Original_LF__DOT__Poly_LF_Poly_list.cons a (Original_LF__DOT__Poly_LF_Poly_list.cons b (Original_LF__DOT__Poly_LF_Poly_list.cons c Original_LF__DOT__Poly_LF_Poly_list.nil)))
        (Original_LF__DOT__Poly_LF_Poly_list.cons a (Original_LF__DOT__Poly_LF_Poly_list.cons c (Original_LF__DOT__Poly_LF_Poly_list.cons b Original_LF__DOT__Poly_LF_Poly_list.nil)))
  | perm3_trans (l1 l2 l3 : Original_LF__DOT__Poly_LF_Poly_list X) :
      Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3 l1 l2 →
      Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3 l2 l3 →
      Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3 l1 l3

-- Perm3_In is admitted in Original.v
axiom Original_LF__DOT__IndProp_LF_IndProp_Perm3__In : ∀ (X : Type) (x : X) (l1 l2 : Original_LF__DOT__Poly_LF_Poly_list X),
  @Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3 X l1 l2 →
  @Original_LF__DOT__Logic_LF_Logic_In X x l1 →
  @Original_LF__DOT__Logic_LF_Logic_In X x l2

-- ============================================================
-- Original.LF_DOT_Tactics definitions
-- ============================================================

-- silly_ex is admitted in Original.v
axiom Original_LF__DOT__Tactics_LF_Tactics_silly__ex :
  ∀ (p : nat),
    (∀ (n : nat), Corelib_Init_Logic_eq (Original_LF__DOT__Basics_LF_Basics_even n) Original_LF__DOT__Basics_LF_Basics_true →
                  Corelib_Init_Logic_eq (Original_LF__DOT__Basics_LF_Basics_even (S n)) Original_LF__DOT__Basics_LF_Basics_false) →
    (∀ (n : nat), Corelib_Init_Logic_eq (Original_LF__DOT__Basics_LF_Basics_even n) Original_LF__DOT__Basics_LF_Basics_false →
                  Corelib_Init_Logic_eq (Original_LF__DOT__Basics_LF_Basics_odd n) Original_LF__DOT__Basics_LF_Basics_true) →
    Corelib_Init_Logic_eq (Original_LF__DOT__Basics_LF_Basics_even p) Original_LF__DOT__Basics_LF_Basics_true →
    Corelib_Init_Logic_eq (Original_LF__DOT__Basics_LF_Basics_odd (S p)) Original_LF__DOT__Basics_LF_Basics_true

-- ============================================================
-- Original.LF_DOT_AltAuto definitions
-- ============================================================

-- false_assumed is admitted in Original.v
axiom Original_LF__DOT__AltAuto_LF_AltAuto_false__assumed :
  Original_False → Corelib_Init_Logic_eq nat.O (nat.S nat.O)

-- sat_ex2 is admitted in Original.v
axiom Original_LF__DOT__AltAuto_LF_AltAuto_sat__ex2 :
  ∀ (n : nat),
    Corelib_Init_Logic_eq
      (nat_add (nat_add (nat_sub (nat.S nat.O) (nat.S nat.O)) n) (nat.S nat.O))
      (nat_add (nat.S nat.O) n)

-- ============================================================
-- Original.LF_DOT_Maps definitions
-- ============================================================

-- Characters for X, Y, Z
-- 'X' = 88 = 0b01011000
def char_X : Ascii_ascii := Ascii_ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse
-- 'Y' = 89 = 0b01011001
def char_Y : Ascii_ascii := Ascii_ascii.Ascii mybool.mytrue mybool.myfalse mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse
-- 'Z' = 90 = 0b01011010
def char_Z : Ascii_ascii := Ascii_ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse mybool.mytrue mybool.mytrue mybool.myfalse mybool.mytrue mybool.myfalse

def Original_LF__DOT__Imp_LF_Imp_X : String_string := String_string.String char_X String_string.EmptyString
def Original_LF__DOT__Imp_LF_Imp_Y : String_string := String_string.String char_Y String_string.EmptyString
def Original_LF__DOT__Imp_LF_Imp_Z : String_string := String_string.String char_Z String_string.EmptyString

def Original_LF__DOT__Maps_LF_Maps_total__map (A : Type) := String_string → A

def Original_LF__DOT__Maps_LF_Maps_t__empty {A : Type} (v : A) : Original_LF__DOT__Maps_LF_Maps_total__map A :=
  fun _ => v

def Original_LF__DOT__Maps_LF_Maps_t__update {A : Type} (m : Original_LF__DOT__Maps_LF_Maps_total__map A)
    (x : String_string) (v : A) : Original_LF__DOT__Maps_LF_Maps_total__map A :=
  fun x' => match String_eqb x x' with
    | mybool.mytrue => v
    | mybool.myfalse => m x'

-- ============================================================
-- Original.LF_DOT_Imp definitions
-- ============================================================

def Original_LF__DOT__Imp_LF_Imp_state := Original_LF__DOT__Maps_LF_Maps_total__map nat

def Original_LF__DOT__Imp_LF_Imp_empty__st : Original_LF__DOT__Imp_LF_Imp_state :=
  Original_LF__DOT__Maps_LF_Maps_t__empty nat.O

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

-- Stack machine instructions
inductive Original_LF__DOT__Imp_LF_Imp_sinstr : Type where
  | SPush : nat → Original_LF__DOT__Imp_LF_Imp_sinstr
  | SLoad : String_string → Original_LF__DOT__Imp_LF_Imp_sinstr
  | SPlus : Original_LF__DOT__Imp_LF_Imp_sinstr
  | SMinus : Original_LF__DOT__Imp_LF_Imp_sinstr
  | SMult : Original_LF__DOT__Imp_LF_Imp_sinstr

def Original_LF__DOT__Imp_LF_Imp_SPush := Original_LF__DOT__Imp_LF_Imp_sinstr.SPush
def Original_LF__DOT__Imp_LF_Imp_SLoad := Original_LF__DOT__Imp_LF_Imp_sinstr.SLoad
def Original_LF__DOT__Imp_LF_Imp_SPlus := Original_LF__DOT__Imp_LF_Imp_sinstr.SPlus
def Original_LF__DOT__Imp_LF_Imp_SMinus := Original_LF__DOT__Imp_LF_Imp_sinstr.SMinus
def Original_LF__DOT__Imp_LF_Imp_SMult := Original_LF__DOT__Imp_LF_Imp_sinstr.SMult

-- s_compile function
def Original_LF__DOT__Imp_LF_Imp_s__compile : Original_LF__DOT__Imp_LF_Imp_aexp → list Original_LF__DOT__Imp_LF_Imp_sinstr
  | Original_LF__DOT__Imp_LF_Imp_aexp.ANum n => list.cons (Original_LF__DOT__Imp_LF_Imp_sinstr.SPush n) list.nil
  | Original_LF__DOT__Imp_LF_Imp_aexp.AId x => list.cons (Original_LF__DOT__Imp_LF_Imp_sinstr.SLoad x) list.nil
  | Original_LF__DOT__Imp_LF_Imp_aexp.APlus a1 a2 =>
      app _ (app _ (Original_LF__DOT__Imp_LF_Imp_s__compile a1) (Original_LF__DOT__Imp_LF_Imp_s__compile a2))
        (list.cons Original_LF__DOT__Imp_LF_Imp_sinstr.SPlus list.nil)
  | Original_LF__DOT__Imp_LF_Imp_aexp.AMinus a1 a2 =>
      app _ (app _ (Original_LF__DOT__Imp_LF_Imp_s__compile a1) (Original_LF__DOT__Imp_LF_Imp_s__compile a2))
        (list.cons Original_LF__DOT__Imp_LF_Imp_sinstr.SMinus list.nil)
  | Original_LF__DOT__Imp_LF_Imp_aexp.AMult a1 a2 =>
      app _ (app _ (Original_LF__DOT__Imp_LF_Imp_s__compile a1) (Original_LF__DOT__Imp_LF_Imp_s__compile a2))
        (list.cons Original_LF__DOT__Imp_LF_Imp_sinstr.SMult list.nil)

-- s_compile1: s_compile <{ X - (2 * Y) }> = [SLoad X; SPush 2; SLoad Y; SMult; SMinus]
-- This is an example (computable) so we prove it
def Original_LF__DOT__Imp_LF_Imp_s__compile1 :
    @Corelib_Init_Logic_eq (list Original_LF__DOT__Imp_LF_Imp_sinstr)
      (Original_LF__DOT__Imp_LF_Imp_s__compile
        (Original_LF__DOT__Imp_LF_Imp_aexp.AMinus
          (Original_LF__DOT__Imp_LF_Imp_aexp.AId Original_LF__DOT__Imp_LF_Imp_X)
          (Original_LF__DOT__Imp_LF_Imp_aexp.AMult
            (Original_LF__DOT__Imp_LF_Imp_aexp.ANum (nat.S (nat.S nat.O)))
            (Original_LF__DOT__Imp_LF_Imp_aexp.AId Original_LF__DOT__Imp_LF_Imp_Y))))
      (list.cons (Original_LF__DOT__Imp_LF_Imp_sinstr.SLoad Original_LF__DOT__Imp_LF_Imp_X)
        (list.cons (Original_LF__DOT__Imp_LF_Imp_sinstr.SPush (nat.S (nat.S nat.O)))
          (list.cons (Original_LF__DOT__Imp_LF_Imp_sinstr.SLoad Original_LF__DOT__Imp_LF_Imp_Y)
            (list.cons Original_LF__DOT__Imp_LF_Imp_sinstr.SMult
              (list.cons Original_LF__DOT__Imp_LF_Imp_sinstr.SMinus list.nil))))) :=
  Corelib_Init_Logic_eq.refl _

-- aeval: evaluates arithmetic expression in a state
def Original_LF__DOT__Imp_LF_Imp_aeval (st : Original_LF__DOT__Imp_LF_Imp_state) : Original_LF__DOT__Imp_LF_Imp_aexp → nat
  | Original_LF__DOT__Imp_LF_Imp_aexp.ANum n => n
  | Original_LF__DOT__Imp_LF_Imp_aexp.AId x => st x
  | Original_LF__DOT__Imp_LF_Imp_aexp.APlus a1 a2 => nat_add (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2)
  | Original_LF__DOT__Imp_LF_Imp_aexp.AMinus a1 a2 => nat_sub (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2)
  | Original_LF__DOT__Imp_LF_Imp_aexp.AMult a1 a2 => nat_mul (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2)

-- s_execute: executes stack machine program
def Original_LF__DOT__Imp_LF_Imp_s__execute (st : Original_LF__DOT__Imp_LF_Imp_state) : list nat → list Original_LF__DOT__Imp_LF_Imp_sinstr → list nat
  | stack, list.nil => stack
  | stack, list.cons i prog =>
    let newstack := match i, stack with
      | Original_LF__DOT__Imp_LF_Imp_sinstr.SPush n, _ => list.cons n stack
      | Original_LF__DOT__Imp_LF_Imp_sinstr.SLoad x, _ => list.cons (st x) stack
      | Original_LF__DOT__Imp_LF_Imp_sinstr.SPlus, list.cons n1 (list.cons n2 rest) => list.cons (nat_add n2 n1) rest
      | Original_LF__DOT__Imp_LF_Imp_sinstr.SMinus, list.cons n1 (list.cons n2 rest) => list.cons (nat_sub n2 n1) rest
      | Original_LF__DOT__Imp_LF_Imp_sinstr.SMult, list.cons n1 (list.cons n2 rest) => list.cons (nat_mul n2 n1) rest
      | _, _ => stack  -- underflow case: leave stack unchanged
    Original_LF__DOT__Imp_LF_Imp_s__execute st newstack prog

-- s_execute1: Example s_execute1 := s_execute empty_st [] [SPush 5; SPush 3; SPush 1; SMinus] = [2; 5].
def Original_LF__DOT__Imp_LF_Imp_s__execute1 :
  @Corelib_Init_Logic_eq (list nat)
    (Original_LF__DOT__Imp_LF_Imp_s__execute
       Original_LF__DOT__Imp_LF_Imp_empty__st
       list.nil
       (list.cons (Original_LF__DOT__Imp_LF_Imp_sinstr.SPush (nat.S (nat.S (nat.S (nat.S (nat.S nat.O))))))
          (list.cons (Original_LF__DOT__Imp_LF_Imp_sinstr.SPush (nat.S (nat.S (nat.S nat.O))))
             (list.cons (Original_LF__DOT__Imp_LF_Imp_sinstr.SPush (nat.S nat.O))
                (list.cons Original_LF__DOT__Imp_LF_Imp_sinstr.SMinus list.nil)))))
    (list.cons (nat.S (nat.S nat.O))
       (list.cons (nat.S (nat.S (nat.S (nat.S (nat.S nat.O))))) list.nil)) :=
  Corelib_Init_Logic_eq.refl _

-- s_execute2: Example s_execute2 := s_execute (X !-> 3) [3;4] [SPush 4; SLoad X; SMult; SPlus] = [15; 4].
def Original_LF__DOT__Imp_LF_Imp_s__execute2 :
  @Corelib_Init_Logic_eq (list nat)
    (Original_LF__DOT__Imp_LF_Imp_s__execute
       (Original_LF__DOT__Maps_LF_Maps_t__update Original_LF__DOT__Imp_LF_Imp_empty__st Original_LF__DOT__Imp_LF_Imp_X (nat.S (nat.S (nat.S nat.O))))
       (list.cons (nat.S (nat.S (nat.S nat.O))) (list.cons (nat.S (nat.S (nat.S (nat.S nat.O)))) list.nil))
       (list.cons (Original_LF__DOT__Imp_LF_Imp_sinstr.SPush (nat.S (nat.S (nat.S (nat.S nat.O)))))
          (list.cons (Original_LF__DOT__Imp_LF_Imp_sinstr.SLoad Original_LF__DOT__Imp_LF_Imp_X)
             (list.cons Original_LF__DOT__Imp_LF_Imp_sinstr.SMult
                (list.cons Original_LF__DOT__Imp_LF_Imp_sinstr.SPlus list.nil)))))
    (list.cons (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S nat.O)))))))))))))))
       (list.cons (nat.S (nat.S (nat.S (nat.S nat.O)))) list.nil)) :=
  Corelib_Init_Logic_eq.refl _

-- execute_app: Theorem execute_app : forall st p1 p2 stack, s_execute st stack (p1 ++ p2) = s_execute st (s_execute st stack p1) p2.
-- This is admitted in Original.v
axiom Original_LF__DOT__Imp_LF_Imp_execute__app :
  ∀ (st : Original_LF__DOT__Imp_LF_Imp_state) (p1 p2 : list Original_LF__DOT__Imp_LF_Imp_sinstr) (stack : list nat),
    @Corelib_Init_Logic_eq (list nat)
      (Original_LF__DOT__Imp_LF_Imp_s__execute st stack (app Original_LF__DOT__Imp_LF_Imp_sinstr p1 p2))
      (Original_LF__DOT__Imp_LF_Imp_s__execute st (Original_LF__DOT__Imp_LF_Imp_s__execute st stack p1) p2)

-- s_compile_correct: Theorem s_compile_correct : forall (st : state) (e : aexp), s_execute st [] (s_compile e) = [ aeval st e ].
-- This is admitted in Original.v
axiom Original_LF__DOT__Imp_LF_Imp_s__compile__correct :
  ∀ (st : Original_LF__DOT__Imp_LF_Imp_state) (e : Original_LF__DOT__Imp_LF_Imp_aexp),
    @Corelib_Init_Logic_eq (list nat)
      (Original_LF__DOT__Imp_LF_Imp_s__execute st list.nil (Original_LF__DOT__Imp_LF_Imp_s__compile e))
      (list.cons (Original_LF__DOT__Imp_LF_Imp_aeval st e) list.nil)
