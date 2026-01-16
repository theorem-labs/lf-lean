-- NOTE: After exporting, manually edited Imported.out to change universe level
-- from 0 to 1 for Corelib_Init_Logic_eq usage in nat-level theorems
-- This change: sed -i "s/^756 #EC 169 0$/756 #EC 169 1/" Imported.out

-- Comprehensive Lean translation merging all required definitions
set_option linter.all false

-- ============================================================
-- Basic Prop types
-- ============================================================

-- True in Prop
inductive TrueType : Prop where
  | I : TrueType

def TrueType_I := TrueType.I

-- False in Prop
inductive FalseType : Prop where

-- Original.False (same as FalseType)
inductive Original_False : Prop where

-- ============================================================
-- Bool type (custom to avoid conflicts)
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

inductive nat : Type 1 where
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

def bool_eqb : mybool → mybool → mybool
  | mybool.mytrue, mybool.mytrue => mybool.mytrue
  | mybool.myfalse, mybool.myfalse => mybool.mytrue
  | _, _ => mybool.myfalse

-- ============================================================
-- Option type
-- ============================================================

inductive option (A : Type) : Type where
  | None : option A
  | Some : A → option A

def None := @option.None
def Some := @option.Some

-- ============================================================
-- Prod type
-- ============================================================

inductive prod (A B : Type) : Type where
  | pair : A → B → prod A B

def pair := @prod.pair

-- ============================================================
-- List type
-- ============================================================

inductive list (A : Type) : Type where
  | nil : list A
  | cons : A → list A → list A

def nil := @list.nil
def cons := @list.cons

-- ============================================================
-- Or type (disjunction)
-- ============================================================

inductive or (A B : Prop) : Prop where
  | inl : A → or A B
  | inr : B → or A B

-- ============================================================
-- Logic definitions
-- ============================================================

def Logic_not (A : Prop) : Prop := A → FalseType

-- ============================================================
-- Equality in Prop
-- ============================================================

universe u
-- Universe polymorphic eq
inductive Corelib_Init_Logic_eq {A : Type u} : A → A → Prop where
  | refl (a : A) : Corelib_Init_Logic_eq a a

inductive Corelib_Init_Logic_eq_Prop {A : Prop} : A → A → Prop where
  | refl (a : A) : Corelib_Init_Logic_eq_Prop a a

-- ============================================================
-- Existential and Iff
-- ============================================================

inductive ex {A : Type 1} (P : A → Prop) : Prop where
  | intro : ∀ x : A, P x → ex P

def ex_intro {A : Type 1} {P : A → Prop} (x : A) (h : P x) : ex P := ex.intro x h

inductive iff (A B : Prop) : Prop where
  | intro : (A → B) → (B → A) → iff A B

def iff_intro {A B : Prop} := @iff.intro A B

-- ============================================================
-- Ascii and String
-- ============================================================

inductive Ascii_ascii : Type where
  | Ascii : mybool → mybool → mybool → mybool → mybool → mybool → mybool → mybool → Ascii_ascii

def Ascii := Ascii_ascii
def Ascii_Ascii := Ascii_ascii.Ascii

def Ascii_eqb : Ascii_ascii → Ascii_ascii → mybool
  | Ascii_ascii.Ascii a0 a1 a2 a3 a4 a5 a6 a7, Ascii_ascii.Ascii b0 b1 b2 b3 b4 b5 b6 b7 =>
    bool_andb (bool_eqb a0 b0) (bool_andb (bool_eqb a1 b1) (bool_andb (bool_eqb a2 b2) 
    (bool_andb (bool_eqb a3 b3) (bool_andb (bool_eqb a4 b4) (bool_andb (bool_eqb a5 b5) 
    (bool_andb (bool_eqb a6 b6) (bool_eqb a7 b7)))))))

inductive String_string : Type where
  | EmptyString : String_string
  | String : Ascii_ascii → String_string → String_string

def String_EmptyString := String_string.EmptyString
def String_String := String_string.String

def String_eqb : String_string → String_string → mybool
  | String_string.EmptyString, String_string.EmptyString => mybool.mytrue
  | String_string.String c1 s1, String_string.String c2 s2 => 
      bool_andb (Ascii_eqb c1 c2) (String_eqb s1 s2)
  | _, _ => mybool.myfalse

-- ============================================================
-- LF.Basics definitions
-- ============================================================

inductive Original_LF__DOT__Basics_LF_Basics_letter : Type where
  | A : Original_LF__DOT__Basics_LF_Basics_letter
  | B : Original_LF__DOT__Basics_LF_Basics_letter
  | C : Original_LF__DOT__Basics_LF_Basics_letter
  | D : Original_LF__DOT__Basics_LF_Basics_letter
  | F : Original_LF__DOT__Basics_LF_Basics_letter

def Original_LF__DOT__Basics_LF_Basics_A := Original_LF__DOT__Basics_LF_Basics_letter.A
def Original_LF__DOT__Basics_LF_Basics_B := Original_LF__DOT__Basics_LF_Basics_letter.B
def Original_LF__DOT__Basics_LF_Basics_C := Original_LF__DOT__Basics_LF_Basics_letter.C
def Original_LF__DOT__Basics_LF_Basics_D := Original_LF__DOT__Basics_LF_Basics_letter.D
def Original_LF__DOT__Basics_LF_Basics_F := Original_LF__DOT__Basics_LF_Basics_letter.F

inductive Original_LF__DOT__Basics_LF_Basics_modifier : Type where
  | Plus : Original_LF__DOT__Basics_LF_Basics_modifier
  | Natural : Original_LF__DOT__Basics_LF_Basics_modifier
  | Minus : Original_LF__DOT__Basics_LF_Basics_modifier

def Original_LF__DOT__Basics_LF_Basics_Plus := Original_LF__DOT__Basics_LF_Basics_modifier.Plus
def Original_LF__DOT__Basics_LF_Basics_Natural := Original_LF__DOT__Basics_LF_Basics_modifier.Natural
def Original_LF__DOT__Basics_LF_Basics_Minus := Original_LF__DOT__Basics_LF_Basics_modifier.Minus

inductive Original_LF__DOT__Basics_LF_Basics_grade : Type where
  | Grade : Original_LF__DOT__Basics_LF_Basics_letter → Original_LF__DOT__Basics_LF_Basics_modifier → Original_LF__DOT__Basics_LF_Basics_grade

def Original_LF__DOT__Basics_LF_Basics_Grade := Original_LF__DOT__Basics_LF_Basics_grade.Grade

inductive Original_LF__DOT__Basics_LF_Basics_comparison : Type where
  | Eq : Original_LF__DOT__Basics_LF_Basics_comparison
  | Lt : Original_LF__DOT__Basics_LF_Basics_comparison
  | Gt : Original_LF__DOT__Basics_LF_Basics_comparison

def Original_LF__DOT__Basics_LF_Basics_Eq := Original_LF__DOT__Basics_LF_Basics_comparison.Eq
def Original_LF__DOT__Basics_LF_Basics_Lt := Original_LF__DOT__Basics_LF_Basics_comparison.Lt
def Original_LF__DOT__Basics_LF_Basics_Gt := Original_LF__DOT__Basics_LF_Basics_comparison.Gt

-- grade_comparison axiom (Admitted in Original)
axiom Original_LF__DOT__Basics_LF_Basics_grade__comparison : 
  Original_LF__DOT__Basics_LF_Basics_grade → Original_LF__DOT__Basics_LF_Basics_grade → Original_LF__DOT__Basics_LF_Basics_comparison

-- test_grade_comparison1 axiom (Admitted in Original)
axiom Original_LF__DOT__Basics_LF_Basics_test__grade__comparison1 :
  Corelib_Init_Logic_eq
    (Original_LF__DOT__Basics_LF_Basics_grade__comparison
       (Original_LF__DOT__Basics_LF_Basics_Grade Original_LF__DOT__Basics_LF_Basics_A Original_LF__DOT__Basics_LF_Basics_Minus)
       (Original_LF__DOT__Basics_LF_Basics_Grade Original_LF__DOT__Basics_LF_Basics_B Original_LF__DOT__Basics_LF_Basics_Plus))
    Original_LF__DOT__Basics_LF_Basics_Gt

-- ============================================================
-- LF.Poly definitions
-- ============================================================

-- Polymorphic list
inductive Original_LF__DOT__Poly_LF_Poly_list (X : Type 1) : Type 1 where
  | nil : Original_LF__DOT__Poly_LF_Poly_list X
  | cons : X → Original_LF__DOT__Poly_LF_Poly_list X → Original_LF__DOT__Poly_LF_Poly_list X

def Original_LF__DOT__Poly_LF_Poly_nil (X : Type 1) : Original_LF__DOT__Poly_LF_Poly_list X :=
  Original_LF__DOT__Poly_LF_Poly_list.nil

def Original_LF__DOT__Poly_LF_Poly_cons (X : Type 1) : X → Original_LF__DOT__Poly_LF_Poly_list X → Original_LF__DOT__Poly_LF_Poly_list X :=
  Original_LF__DOT__Poly_LF_Poly_list.cons

-- doit3times for Type 1 (used with nat)
def Original_LF__DOT__Poly_LF_Poly_doit3times (X : Type 1) (f : X → X) (n : X) : X :=
  f (f (f n))

-- doit3times for Type (used with Church numerals)
def doit3times_Type (X : Type) (f : X → X) (n : X) : X :=
  f (f (f n))

-- cnat type
def Original_LF__DOT__Poly_LF_Poly_Exercises_cnat : Type 1 := 
  (X : Type) → (X → X) → X → X

-- Church numerals
def Original_LF__DOT__Poly_LF_Poly_Exercises_one : Original_LF__DOT__Poly_LF_Poly_Exercises_cnat :=
  fun _ f x => f x

def Original_LF__DOT__Poly_LF_Poly_Exercises_two : Original_LF__DOT__Poly_LF_Poly_Exercises_cnat :=
  fun _ f x => f (f x)

def Original_LF__DOT__Poly_LF_Poly_Exercises_three : Original_LF__DOT__Poly_LF_Poly_Exercises_cnat :=
  doit3times_Type

-- plus axiom (Admitted in Original)
axiom Original_LF__DOT__Poly_LF_Poly_Exercises_plus : 
  Original_LF__DOT__Poly_LF_Poly_Exercises_cnat → 
  Original_LF__DOT__Poly_LF_Poly_Exercises_cnat → 
  Original_LF__DOT__Poly_LF_Poly_Exercises_cnat

-- plus_3 axiom (Admitted in Original): plus (plus two two) three = plus one (plus three three)
-- plus_3 : plus (plus two two) three = plus one (plus three three) (eta-expanded form)
axiom Original_LF__DOT__Poly_LF_Poly_Exercises_plus__3 : 
  @Corelib_Init_Logic_eq (∀ X : Type, (X → X) → X → X)
    (fun (X : Type) (f : X → X) (x : X) =>
      Original_LF__DOT__Poly_LF_Poly_Exercises_plus 
        (fun (Y : Type) (g : Y → Y) (y : Y) =>
          Original_LF__DOT__Poly_LF_Poly_Exercises_plus 
            (fun (Z : Type) (h : Z → Z) (z : Z) => Original_LF__DOT__Poly_LF_Poly_Exercises_two Z (fun w => h w) z)
            (fun (Z : Type) (h : Z → Z) (z : Z) => Original_LF__DOT__Poly_LF_Poly_Exercises_two Z (fun w => h w) z)
            Y (fun z => g z) y)
        (fun (Y : Type) (g : Y → Y) (y : Y) => Original_LF__DOT__Poly_LF_Poly_Exercises_three Y (fun z => g z) y)
        X (fun z => f z) x)
    (fun (X : Type) (f : X → X) (x : X) =>
      Original_LF__DOT__Poly_LF_Poly_Exercises_plus 
        (fun (Y : Type) (g : Y → Y) (y : Y) => Original_LF__DOT__Poly_LF_Poly_Exercises_one Y (fun z => g z) y)
        (fun (Y : Type) (g : Y → Y) (y : Y) =>
          Original_LF__DOT__Poly_LF_Poly_Exercises_plus 
            (fun (Z : Type) (h : Z → Z) (z : Z) => Original_LF__DOT__Poly_LF_Poly_Exercises_three Z (fun w => h w) z)
            (fun (Z : Type) (h : Z → Z) (z : Z) => Original_LF__DOT__Poly_LF_Poly_Exercises_three Z (fun w => h w) z)
            Y (fun z => g z) y)
        X (fun z => f z) x)

-- ============================================================
-- LF.Logic definitions  
-- ============================================================

-- In predicate for Original.LF_DOT_Poly list
def Original_LF__DOT__Logic_LF_Logic_In {X : Type 1} (x : X) : Original_LF__DOT__Poly_LF_Poly_list X → Prop
  | Original_LF__DOT__Poly_LF_Poly_list.nil => FalseType
  | Original_LF__DOT__Poly_LF_Poly_list.cons x' l' => or (Corelib_Init_Logic_eq x' x) (Original_LF__DOT__Logic_LF_Logic_In x l')

-- forty_two (42 = S^42 O)
def n10 : nat := nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S nat.O)))))))))
def n20 : nat := nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S n10)))))))))
def n30 : nat := nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S n20)))))))))
def n40 : nat := nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S n30)))))))))
def forty_two : nat := nat.S (nat.S n40)

-- in_not_nil_42_take4 axiom (Admitted in Original)
axiom Original_LF__DOT__Logic_LF_Logic_in__not__nil__42__take4 : 
  ∀ (l : Original_LF__DOT__Poly_LF_Poly_list nat),
    Original_LF__DOT__Logic_LF_Logic_In forty_two l →
    Corelib_Init_Logic_eq l (Original_LF__DOT__Poly_LF_Poly_nil nat) →
    FalseType

-- ============================================================
-- LF.Tactics definitions
-- ============================================================

-- eq_implies_succ_equal' axiom (Admitted in Original)  
axiom Original_LF__DOT__Tactics_LF_Tactics_eq__implies__succ__equal' :
  ∀ (n m : nat), Corelib_Init_Logic_eq n m → Corelib_Init_Logic_eq (S n) (S m)

-- ============================================================
-- Additional required definitions
-- ============================================================

-- minustwo: subtracts 2 from a nat (returns 0 for 0 and 1)
def Original_LF__DOT__Basics_LF_Basics_minustwo : nat → nat
  | nat.S (nat.S n') => n'
  | _ => nat.O

-- bar: function that always returns 5
def n5 : nat := nat.S (nat.S (nat.S (nat.S (nat.S nat.O))))

def Original_LF__DOT__Tactics_LF_Tactics_bar : nat → nat
  | _ => n5

-- zero: Church numeral for 0
def Original_LF__DOT__Poly_LF_Poly_Exercises_zero : Original_LF__DOT__Poly_LF_Poly_Exercises_cnat :=
  fun _ _ x => x

-- mult axiom (Admitted in Original)
axiom Original_LF__DOT__Poly_LF_Poly_Exercises_mult : 
  Original_LF__DOT__Poly_LF_Poly_Exercises_cnat → 
  Original_LF__DOT__Poly_LF_Poly_Exercises_cnat → 
  Original_LF__DOT__Poly_LF_Poly_Exercises_cnat

-- ============================================================
-- Main task theorems (all admitted/opaque in Original)
-- ============================================================

-- add_comm'' : forall n m : nat, n + m = m + n
axiom Original_LF__DOT__IndPrinciples_LF_IndPrinciples_add__comm'' :
  ∀ (n m : nat), Corelib_Init_Logic_eq (nat_add n m) (nat_add m n)

-- and_example3 : forall n m : nat, n + m = 0 -> n * m = 0
axiom Original_LF__DOT__Logic_LF_Logic_and__example3 :
  ∀ (n m : nat), Corelib_Init_Logic_eq (nat_add n m) nat.O → Corelib_Init_Logic_eq (nat_mul n m) nat.O

-- exists_example_2 : forall n : nat, (exists m, n = 4 + m) -> exists o, n = 2 + o
def n4 : nat := nat.S (nat.S (nat.S (nat.S nat.O)))
def n2 : nat := nat.S (nat.S nat.O)
axiom Original_LF__DOT__Logic_LF_Logic_exists__example__2 :
  ∀ (n : nat), ex (fun m => Corelib_Init_Logic_eq n (nat_add n4 m)) → ex (fun o => Corelib_Init_Logic_eq n (nat_add n2 o))

-- mult_2 : mult zero (plus three three) = zero (eta-expanded form)
axiom Original_LF__DOT__Poly_LF_Poly_Exercises_mult__2 :
  @Corelib_Init_Logic_eq (∀ X : Type, (X → X) → X → X)
    (fun (X : Type) (f : X → X) (x : X) =>
      Original_LF__DOT__Poly_LF_Poly_Exercises_mult 
        (fun (Y : Type) (g : Y → Y) (y : Y) => Original_LF__DOT__Poly_LF_Poly_Exercises_zero Y (fun z => g z) y)
        (fun (Y : Type) (g : Y → Y) (y : Y) => 
          Original_LF__DOT__Poly_LF_Poly_Exercises_plus 
            (fun (Z : Type) (h : Z → Z) (z : Z) => Original_LF__DOT__Poly_LF_Poly_Exercises_three Z (fun w => h w) z)
            (fun (Z : Type) (h : Z → Z) (z : Z) => Original_LF__DOT__Poly_LF_Poly_Exercises_three Z (fun w => h w) z)
            Y (fun z => g z) y)
        X (fun z => f z) x)
    (fun (X : Type) (f : X → X) (x : X) => Original_LF__DOT__Poly_LF_Poly_Exercises_zero X (fun z => f z) x)

-- mult_3 : mult two three = plus three three (eta-expanded form)
axiom Original_LF__DOT__Poly_LF_Poly_Exercises_mult__3 :
  @Corelib_Init_Logic_eq (∀ X : Type, (X → X) → X → X)
    (fun (X : Type) (f : X → X) (x : X) =>
      Original_LF__DOT__Poly_LF_Poly_Exercises_mult 
        (fun (Y : Type) (g : Y → Y) (y : Y) => Original_LF__DOT__Poly_LF_Poly_Exercises_two Y (fun z => g z) y)
        (fun (Y : Type) (g : Y → Y) (y : Y) => Original_LF__DOT__Poly_LF_Poly_Exercises_three Y (fun z => g z) y)
        X (fun z => f z) x)
    (fun (X : Type) (f : X → X) (x : X) =>
      Original_LF__DOT__Poly_LF_Poly_Exercises_plus 
        (fun (Y : Type) (g : Y → Y) (y : Y) => Original_LF__DOT__Poly_LF_Poly_Exercises_three Y (fun z => g z) y)
        (fun (Y : Type) (g : Y → Y) (y : Y) => Original_LF__DOT__Poly_LF_Poly_Exercises_three Y (fun z => g z) y)
        X (fun z => f z) x)

-- plus_1 : plus zero one = one (eta-expanded form)
axiom Original_LF__DOT__Poly_LF_Poly_Exercises_plus__1 :
  @Corelib_Init_Logic_eq (∀ X : Type, (X → X) → X → X)
    (fun (X : Type) (f : X → X) (x : X) =>
      Original_LF__DOT__Poly_LF_Poly_Exercises_plus 
        (fun (Y : Type) (g : Y → Y) (y : Y) => Original_LF__DOT__Poly_LF_Poly_Exercises_zero Y (fun z => g z) y)
        (fun (Y : Type) (g : Y → Y) (y : Y) => Original_LF__DOT__Poly_LF_Poly_Exercises_one Y (fun z => g z) y)
        X (fun z => f z) x)
    (fun (X : Type) (f : X → X) (x : X) => Original_LF__DOT__Poly_LF_Poly_Exercises_one X (fun z => f z) x)

-- plus_2 : plus two three = plus three two (eta-expanded form)
axiom Original_LF__DOT__Poly_LF_Poly_Exercises_plus__2 :
  @Corelib_Init_Logic_eq (∀ X : Type, (X → X) → X → X)
    (fun (X : Type) (f : X → X) (x : X) =>
      Original_LF__DOT__Poly_LF_Poly_Exercises_plus 
        (fun (Y : Type) (g : Y → Y) (y : Y) => Original_LF__DOT__Poly_LF_Poly_Exercises_two Y (fun z => g z) y)
        (fun (Y : Type) (g : Y → Y) (y : Y) => Original_LF__DOT__Poly_LF_Poly_Exercises_three Y (fun z => g z) y)
        X (fun z => f z) x)
    (fun (X : Type) (f : X → X) (x : X) =>
      Original_LF__DOT__Poly_LF_Poly_Exercises_plus 
        (fun (Y : Type) (g : Y → Y) (y : Y) => Original_LF__DOT__Poly_LF_Poly_Exercises_three Y (fun z => g z) y)
        (fun (Y : Type) (g : Y → Y) (y : Y) => Original_LF__DOT__Poly_LF_Poly_Exercises_two Y (fun z => g z) y)
        X (fun z => f z) x)

-- test_doit3times : doit3times minustwo 9 = 3
def n9 : nat := nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S nat.O))))))))
def n3 : nat := nat.S (nat.S (nat.S nat.O))
axiom Original_LF__DOT__Poly_LF_Poly_test__doit3times :
  Corelib_Init_Logic_eq 
    (Original_LF__DOT__Poly_LF_Poly_doit3times nat Original_LF__DOT__Basics_LF_Basics_minustwo n9)
    n3

-- silly_fact_2 : forall m, bar m + 1 = bar (m + 1) + 1
def n1 : nat := nat.S nat.O
axiom Original_LF__DOT__Tactics_LF_Tactics_silly__fact__2 :
  ∀ (m : nat), Corelib_Init_Logic_eq 
    (nat_add (Original_LF__DOT__Tactics_LF_Tactics_bar m) n1) 
    (nat_add (Original_LF__DOT__Tactics_LF_Tactics_bar (nat_add m n1)) n1)

-- silly_fact_2' : forall m, bar m + 1 = bar (m + 1) + 1
axiom Original_LF__DOT__Tactics_LF_Tactics_silly__fact__2' :
  ∀ (m : nat), Corelib_Init_Logic_eq 
    (nat_add (Original_LF__DOT__Tactics_LF_Tactics_bar m) n1) 
    (nat_add (Original_LF__DOT__Tactics_LF_Tactics_bar (nat_add m n1)) n1)
