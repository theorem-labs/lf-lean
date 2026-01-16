-- Comprehensive Lean translation merging multiple solutions
set_option autoImplicit false

-- Natural numbers
inductive nat : Type where
  | O : nat
  | S : nat → nat

def _0 : nat := nat.O
def S : nat → nat := nat.S

-- Nat_add to match Rocq's Nat.add
def Nat_add : nat → nat → nat
  | nat.O, m => m
  | nat.S p, m => nat.S (Nat_add p m)

-- Boolean for le definition  
inductive RocqBool : Type where
  | false : RocqBool
  | true : RocqBool

def RocqBool_false : RocqBool := RocqBool.false
def RocqBool_true : RocqBool := RocqBool.true

-- Less than or equal (boolean version)
def nat_leb : nat → nat → RocqBool
  | nat.O, _ => RocqBool.true
  | nat.S _, nat.O => RocqBool.false
  | nat.S n, nat.S m => nat_leb n m

-- Equality in Prop (which imports as SProp in Rocq)
universe u
inductive Corelib_Init_Logic_eq {A : Sort u} : A → A → Prop where
  | refl (a : A) : Corelib_Init_Logic_eq a a

-- le as Prop based on boolean
def le (n m : nat) : Prop := Corelib_Init_Logic_eq (nat_leb n m) RocqBool.true

-- Conjunction
structure and (A B : Prop) : Prop where
  intro ::
  left : A
  right : B

-- Equality for Prop arguments (also imports as SProp → SProp → SProp in Rocq)
inductive Corelib_Init_Logic_eq_Prop {A : Prop} : A → A → Prop where
  | refl (a : A) : Corelib_Init_Logic_eq_Prop a a

-- True proposition
inductive MyTrue : Prop where
  | intro : MyTrue

-- Define bool (matching LF.Basics.bool)
inductive Original_LF__DOT__Basics_LF_Basics_bool : Type where
  | true : Original_LF__DOT__Basics_LF_Basics_bool
  | false : Original_LF__DOT__Basics_LF_Basics_bool

def Original_LF__DOT__Basics_LF_Basics_true : Original_LF__DOT__Basics_LF_Basics_bool :=
  Original_LF__DOT__Basics_LF_Basics_bool.true

def Original_LF__DOT__Basics_LF_Basics_false : Original_LF__DOT__Basics_LF_Basics_bool :=
  Original_LF__DOT__Basics_LF_Basics_bool.false

-- Define leb (less or equal for booleans)
def Original_LF__DOT__Basics_LF_Basics_leb : nat → nat → Original_LF__DOT__Basics_LF_Basics_bool
  | nat.O, _ => Original_LF__DOT__Basics_LF_Basics_bool.true
  | nat.S _, nat.O => Original_LF__DOT__Basics_LF_Basics_bool.false
  | nat.S n', nat.S m' => Original_LF__DOT__Basics_LF_Basics_leb n' m'

-- letter type: A, B, C, D, F
inductive Original_LF__DOT__Basics_LF_Basics_letter : Type where
  | A : Original_LF__DOT__Basics_LF_Basics_letter
  | B : Original_LF__DOT__Basics_LF_Basics_letter
  | C : Original_LF__DOT__Basics_LF_Basics_letter
  | D : Original_LF__DOT__Basics_LF_Basics_letter
  | F : Original_LF__DOT__Basics_LF_Basics_letter

def Original_LF__DOT__Basics_LF_Basics_A : Original_LF__DOT__Basics_LF_Basics_letter :=
  Original_LF__DOT__Basics_LF_Basics_letter.A

def Original_LF__DOT__Basics_LF_Basics_B : Original_LF__DOT__Basics_LF_Basics_letter :=
  Original_LF__DOT__Basics_LF_Basics_letter.B

def Original_LF__DOT__Basics_LF_Basics_C : Original_LF__DOT__Basics_LF_Basics_letter :=
  Original_LF__DOT__Basics_LF_Basics_letter.C

def Original_LF__DOT__Basics_LF_Basics_D : Original_LF__DOT__Basics_LF_Basics_letter :=
  Original_LF__DOT__Basics_LF_Basics_letter.D

def Original_LF__DOT__Basics_LF_Basics_F : Original_LF__DOT__Basics_LF_Basics_letter :=
  Original_LF__DOT__Basics_LF_Basics_letter.F

-- modifier type: Plus, Natural, Minus
inductive Original_LF__DOT__Basics_LF_Basics_modifier : Type where
  | Plus : Original_LF__DOT__Basics_LF_Basics_modifier
  | Natural : Original_LF__DOT__Basics_LF_Basics_modifier
  | Minus : Original_LF__DOT__Basics_LF_Basics_modifier

def Original_LF__DOT__Basics_LF_Basics_Plus : Original_LF__DOT__Basics_LF_Basics_modifier :=
  Original_LF__DOT__Basics_LF_Basics_modifier.Plus

def Original_LF__DOT__Basics_LF_Basics_Natural : Original_LF__DOT__Basics_LF_Basics_modifier :=
  Original_LF__DOT__Basics_LF_Basics_modifier.Natural

def Original_LF__DOT__Basics_LF_Basics_Minus : Original_LF__DOT__Basics_LF_Basics_modifier :=
  Original_LF__DOT__Basics_LF_Basics_modifier.Minus

-- grade type: Grade letter modifier
inductive Original_LF__DOT__Basics_LF_Basics_grade : Type where
  | Grade : Original_LF__DOT__Basics_LF_Basics_letter → Original_LF__DOT__Basics_LF_Basics_modifier → Original_LF__DOT__Basics_LF_Basics_grade

def Original_LF__DOT__Basics_LF_Basics_Grade : Original_LF__DOT__Basics_LF_Basics_letter → Original_LF__DOT__Basics_LF_Basics_modifier → Original_LF__DOT__Basics_LF_Basics_grade :=
  Original_LF__DOT__Basics_LF_Basics_grade.Grade

-- comparison type: Eq, Lt, Gt
inductive Original_LF__DOT__Basics_LF_Basics_comparison : Type where
  | Eq : Original_LF__DOT__Basics_LF_Basics_comparison
  | Lt : Original_LF__DOT__Basics_LF_Basics_comparison
  | Gt : Original_LF__DOT__Basics_LF_Basics_comparison

def Original_LF__DOT__Basics_LF_Basics_Eq : Original_LF__DOT__Basics_LF_Basics_comparison :=
  Original_LF__DOT__Basics_LF_Basics_comparison.Eq

def Original_LF__DOT__Basics_LF_Basics_Lt : Original_LF__DOT__Basics_LF_Basics_comparison :=
  Original_LF__DOT__Basics_LF_Basics_comparison.Lt

def Original_LF__DOT__Basics_LF_Basics_Gt : Original_LF__DOT__Basics_LF_Basics_comparison :=
  Original_LF__DOT__Basics_LF_Basics_comparison.Gt

-- grade_comparison is an axiom (Admitted in Coq)
axiom Original_LF__DOT__Basics_LF_Basics_grade__comparison :
  Original_LF__DOT__Basics_LF_Basics_grade → Original_LF__DOT__Basics_LF_Basics_grade → Original_LF__DOT__Basics_LF_Basics_comparison

-- test_grade_comparison4 is an axiom (Admitted in Coq)
axiom Original_LF__DOT__Basics_LF_Basics_test__grade__comparison4 :
  Corelib_Init_Logic_eq
    (Original_LF__DOT__Basics_LF_Basics_grade__comparison
       (Original_LF__DOT__Basics_LF_Basics_Grade Original_LF__DOT__Basics_LF_Basics_B Original_LF__DOT__Basics_LF_Basics_Minus)
       (Original_LF__DOT__Basics_LF_Basics_Grade Original_LF__DOT__Basics_LF_Basics_C Original_LF__DOT__Basics_LF_Basics_Plus))
    Original_LF__DOT__Basics_LF_Basics_Gt

-- Define natlist (list of nats)
inductive Original_LF__DOT__Lists_LF_Lists_NatList_natlist : Type where
  | nil : Original_LF__DOT__Lists_LF_Lists_NatList_natlist
  | cons : nat → Original_LF__DOT__Lists_LF_Lists_NatList_natlist → Original_LF__DOT__Lists_LF_Lists_NatList_natlist

-- nil alias
def Original_LF__DOT__Lists_LF_Lists_NatList_nil : Original_LF__DOT__Lists_LF_Lists_NatList_natlist :=
  Original_LF__DOT__Lists_LF_Lists_NatList_natlist.nil

-- cons constructor as a definition
def Original_LF__DOT__Lists_LF_Lists_NatList_cons : nat → Original_LF__DOT__Lists_LF_Lists_NatList_natlist → Original_LF__DOT__Lists_LF_Lists_NatList_natlist :=
  Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons

-- bag is just an alias for natlist
def Original_LF__DOT__Lists_LF_Lists_NatList_bag : Type := Original_LF__DOT__Lists_LF_Lists_NatList_natlist

-- app function
def Original_LF__DOT__Lists_LF_Lists_NatList_app : Original_LF__DOT__Lists_LF_Lists_NatList_natlist → Original_LF__DOT__Lists_LF_Lists_NatList_natlist → Original_LF__DOT__Lists_LF_Lists_NatList_natlist
  | Original_LF__DOT__Lists_LF_Lists_NatList_natlist.nil, l2 => l2
  | Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons h t, l2 =>
      Original_LF__DOT__Lists_LF_Lists_NatList_natlist.cons h (Original_LF__DOT__Lists_LF_Lists_NatList_app t l2)

-- test_app3: [] ++ [1;2;3] = [1;2;3] (Admitted, so axiom)
axiom Original_LF__DOT__Lists_LF_Lists_NatList_test__app3 :
  Corelib_Init_Logic_eq
    (Original_LF__DOT__Lists_LF_Lists_NatList_app
       Original_LF__DOT__Lists_LF_Lists_NatList_nil
       (Original_LF__DOT__Lists_LF_Lists_NatList_cons (S _0)
          (Original_LF__DOT__Lists_LF_Lists_NatList_cons (S (S _0))
             (Original_LF__DOT__Lists_LF_Lists_NatList_cons (S (S (S _0))) Original_LF__DOT__Lists_LF_Lists_NatList_nil))))
    (Original_LF__DOT__Lists_LF_Lists_NatList_cons (S _0)
       (Original_LF__DOT__Lists_LF_Lists_NatList_cons (S (S _0))
          (Original_LF__DOT__Lists_LF_Lists_NatList_cons (S (S (S _0))) Original_LF__DOT__Lists_LF_Lists_NatList_nil)))

-- count is admitted in the original Rocq code, so axiom here
axiom Original_LF__DOT__Lists_LF_Lists_NatList_count : nat → Original_LF__DOT__Lists_LF_Lists_NatList_bag → nat

-- remove_one is admitted in the original Rocq code, so axiom here
axiom Original_LF__DOT__Lists_LF_Lists_NatList_remove__one : nat → Original_LF__DOT__Lists_LF_Lists_NatList_bag → Original_LF__DOT__Lists_LF_Lists_NatList_bag

-- The theorem remove_does_not_increase_count (admitted in Original.v)
axiom Original_LF__DOT__Lists_LF_Lists_NatList_remove__does__not__increase__count :
  ∀ (x : Original_LF__DOT__Lists_LF_Lists_NatList_bag),
    Corelib_Init_Logic_eq
      (Original_LF__DOT__Basics_LF_Basics_leb
        (Original_LF__DOT__Lists_LF_Lists_NatList_count _0 (Original_LF__DOT__Lists_LF_Lists_NatList_remove__one _0 x))
        (Original_LF__DOT__Lists_LF_Lists_NatList_count _0 x))
      Original_LF__DOT__Basics_LF_Basics_true

-- cnat type: forall X : Type, (X -> X) -> X -> X
-- Using Type 1 to match universe constraints
abbrev Original_LF__DOT__Poly_LF_Poly_Exercises_cnat : Type 1 :=
  (X : Type) → (X → X) → X → X

-- doit3times: applies f three times
def Original_LF__DOT__Poly_LF_Poly_doit3times (X : Type) (f : X → X) (n : X) : X :=
  f (f (f n))

-- two: forall X : Type, (X -> X) -> X -> X
def Original_LF__DOT__Poly_LF_Poly_Exercises_two : (X : Type) → (X → X) → X → X :=
  fun (X : Type) (f : X → X) (x : X) => f (f x)

-- three: forall X : Type, (X -> X) -> X -> X
def Original_LF__DOT__Poly_LF_Poly_Exercises_three : (X : Type) → (X → X) → X → X :=
  Original_LF__DOT__Poly_LF_Poly_doit3times

-- plus is admitted in Rocq, so we declare it as an axiom
axiom Original_LF__DOT__Poly_LF_Poly_Exercises_plus :
  ((X : Type) → (X → X) → X → X) →
  ((X : Type) → (X → X) → X → X) →
  (X : Type) → (X → X) → X → X

-- plus_2 : plus two three = plus three two (an admitted theorem)
axiom Original_LF__DOT__Poly_LF_Poly_Exercises_plus__2 :
  @Corelib_Init_Logic_eq ((X : Type) → (X → X) → X → X)
    (Original_LF__DOT__Poly_LF_Poly_Exercises_plus
       Original_LF__DOT__Poly_LF_Poly_Exercises_two
       Original_LF__DOT__Poly_LF_Poly_Exercises_three)
    (Original_LF__DOT__Poly_LF_Poly_Exercises_plus
       Original_LF__DOT__Poly_LF_Poly_Exercises_three
       Original_LF__DOT__Poly_LF_Poly_Exercises_two)

-- add_assoc'' is Admitted in Original.v, so we use an axiom
axiom Original_LF__DOT__AltAuto_LF_AltAuto_add__assoc'' :
  ∀ (n m p : nat), Corelib_Init_Logic_eq (Nat_add n (Nat_add m p)) (Nat_add (Nat_add n m) p)

-- auto_example_6' is Admitted in Original.v
axiom Original_LF__DOT__AltAuto_LF_AltAuto_auto__example__6' :
  ∀ (n m p : nat),
    (le n p → and (le n m) (le m n)) →
    le n p →
    Corelib_Init_Logic_eq n m

-- True_is_true : True (admitted in Original.v)
axiom Original_LF__DOT__Logic_LF_Logic_True__is__true : MyTrue

-- consequentia_mirabilis: forall P:Prop, (~P -> P) -> P
def Original_LF__DOT__Logic_LF_Logic_consequentia__mirabilis : Prop :=
  ∀ (P : Prop), (¬P → P) → P

-- Nat_mul to match Rocq's Nat.mul
def Nat_mul : nat → nat → nat
  | nat.O, _ => nat.O
  | nat.S p, m => Nat_add m (Nat_mul p m)

-- one: forall X : Type, (X -> X) -> X -> X
def Original_LF__DOT__Poly_LF_Poly_Exercises_one : (X : Type) → (X → X) → X → X :=
  fun (X : Type) (f : X → X) (x : X) => f x

-- mult is admitted in Rocq, so we declare it as an axiom
axiom Original_LF__DOT__Poly_LF_Poly_Exercises_mult :
  ((X : Type) → (X → X) → X → X) →
  ((X : Type) → (X → X) → X → X) →
  (X : Type) → (X → X) → X → X

-- exp is admitted in Rocq, so we declare it as an axiom
axiom Original_LF__DOT__Poly_LF_Poly_Exercises_exp :
  ((X : Type) → (X → X) → X → X) →
  ((X : Type) → (X → X) → X → X) →
  (X : Type) → (X → X) → X → X

-- exp_1 : exp two two = plus two two (admitted theorem)
axiom Original_LF__DOT__Poly_LF_Poly_Exercises_exp__1 :
  @Corelib_Init_Logic_eq ((X : Type) → (X → X) → X → X)
    (Original_LF__DOT__Poly_LF_Poly_Exercises_exp
       Original_LF__DOT__Poly_LF_Poly_Exercises_two
       Original_LF__DOT__Poly_LF_Poly_Exercises_two)
    (Original_LF__DOT__Poly_LF_Poly_Exercises_plus
       Original_LF__DOT__Poly_LF_Poly_Exercises_two
       Original_LF__DOT__Poly_LF_Poly_Exercises_two)

-- exp_3 : exp three two = plus (mult two (mult two two)) one (admitted theorem)
axiom Original_LF__DOT__Poly_LF_Poly_Exercises_exp__3 :
  @Corelib_Init_Logic_eq ((X : Type) → (X → X) → X → X)
    (Original_LF__DOT__Poly_LF_Poly_Exercises_exp
       Original_LF__DOT__Poly_LF_Poly_Exercises_three
       Original_LF__DOT__Poly_LF_Poly_Exercises_two)
    (Original_LF__DOT__Poly_LF_Poly_Exercises_plus
       (Original_LF__DOT__Poly_LF_Poly_Exercises_mult
          Original_LF__DOT__Poly_LF_Poly_Exercises_two
          (Original_LF__DOT__Poly_LF_Poly_Exercises_mult
             Original_LF__DOT__Poly_LF_Poly_Exercises_two
             Original_LF__DOT__Poly_LF_Poly_Exercises_two))
       Original_LF__DOT__Poly_LF_Poly_Exercises_one)

-- plus (for Basics module) - same as Nat_add
def Original_LF__DOT__Basics_LF_Basics_plus : nat → nat → nat := Nat_add

-- letter_comparison function (matching Original.v: A > B > C > D > F)
def Original_LF__DOT__Basics_LF_Basics_letter__comparison :
    Original_LF__DOT__Basics_LF_Basics_letter →
    Original_LF__DOT__Basics_LF_Basics_letter →
    Original_LF__DOT__Basics_LF_Basics_comparison
  | .A, .A => .Eq
  | .A, _ => .Gt
  | .B, .A => .Lt
  | .B, .B => .Eq
  | .B, _ => .Gt
  | .C, .A => .Lt
  | .C, .B => .Lt
  | .C, .C => .Eq
  | .C, _ => .Gt
  | .D, .A => .Lt
  | .D, .B => .Lt
  | .D, .C => .Lt
  | .D, .D => .Eq
  | .D, _ => .Gt
  | .F, .A => .Lt
  | .F, .B => .Lt
  | .F, .C => .Lt
  | .F, .D => .Lt
  | .F, .F => .Eq

-- letter_comparison_Eq theorem: forall l, letter_comparison l l = Eq
theorem Original_LF__DOT__Basics_LF_Basics_letter__comparison__Eq :
  ∀ l, @Corelib_Init_Logic_eq Original_LF__DOT__Basics_LF_Basics_comparison
         (Original_LF__DOT__Basics_LF_Basics_letter__comparison l l)
         Original_LF__DOT__Basics_LF_Basics_comparison.Eq := by
  intro l
  cases l <;> exact Corelib_Init_Logic_eq.refl _

-- Helper to build nat from Nat
def natOfNat : Nat → nat
  | 0 => nat.O
  | n + 1 => nat.S (natOfNat n)

-- test_anon_fun': doit3times (fun n => n * n) 2 = 256 (admitted)
axiom Original_LF__DOT__Poly_LF_Poly_test__anon__fun' :
  @Corelib_Init_Logic_eq nat
    (Original_LF__DOT__Poly_LF_Poly_doit3times nat (fun n => Nat_mul n n) (nat.S (nat.S nat.O)))
    (natOfNat 256)

-- test_plus3'': doit3times (plus 3) 0 = 9 (admitted)
axiom Original_LF__DOT__Poly_LF_Poly_test__plus3'' :
  @Corelib_Init_Logic_eq nat
    (Original_LF__DOT__Poly_LF_Poly_doit3times nat (Nat_add (nat.S (nat.S (nat.S nat.O)))) nat.O)
    (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S (nat.S nat.O)))))))))

-- add_assoc' for AltAuto module (admitted)
axiom Original_LF__DOT__AltAuto_LF_AltAuto_add__assoc' :
  ∀ (n m p : nat), Corelib_Init_Logic_eq (Nat_add n (Nat_add m p)) (Nat_add (Nat_add n m) p)

-- plus_is_O: forall n m : nat, n + m = 0 -> n = 0 /\ m = 0 (admitted)
axiom Original_LF__DOT__Logic_LF_Logic_plus__is__O :
  ∀ (n m : nat),
    Corelib_Init_Logic_eq (Nat_add n m) nat.O →
    and (Corelib_Init_Logic_eq n nat.O) (Corelib_Init_Logic_eq m nat.O)
