-- Comprehensive Lean 4 translation for all required isomorphisms
set_option linter.all false
set_option autoImplicit false

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

inductive Ascii_ascii : Type where
  | Ascii : Stdlib_bool → Stdlib_bool → Stdlib_bool → Stdlib_bool →
            Stdlib_bool → Stdlib_bool → Stdlib_bool → Stdlib_bool → Ascii_ascii

def Ascii_Ascii := Ascii_ascii.Ascii

def Ascii_eqb : Ascii_ascii → Ascii_ascii → Stdlib_bool
  | .Ascii b0 b1 b2 b3 b4 b5 b6 b7, .Ascii c0 c1 c2 c3 c4 c5 c6 c7 =>
    andb (Bool_eqb b0 c0) (andb (Bool_eqb b1 c1) (andb (Bool_eqb b2 c2)
    (andb (Bool_eqb b3 c3) (andb (Bool_eqb b4 c4) (andb (Bool_eqb b5 c5)
    (andb (Bool_eqb b6 c6) (Bool_eqb b7 c7)))))))

inductive String_string : Type where
  | EmptyString : String_string
  | String : Ascii_ascii → String_string → String_string

def String_EmptyString := String_string.EmptyString
def String_String := String_string.String

def String_eqb : String_string → String_string → Stdlib_bool
  | .EmptyString, .EmptyString => Stdlib_bool.true
  | .String a s1, .String b s2 => andb (Ascii_eqb a b) (String_eqb s1 s2)
  | _, _ => Stdlib_bool.false

-- ============================================================
-- Logic types
-- ============================================================

-- Equality in Prop
inductive Corelib_Init_Logic_eq.{u} {A : Sort u} : A → A → Prop where
  | refl (a : A) : Corelib_Init_Logic_eq a a

def Corelib_Init_Logic_eq_refl.{u} {A : Sort u} (a : A) : Corelib_Init_Logic_eq a a :=
  Corelib_Init_Logic_eq.refl a

-- Equality for Prop arguments
inductive Corelib_Init_Logic_eq_Prop {A : Prop} : A → A → Prop where
  | refl (a : A) : Corelib_Init_Logic_eq_Prop a a

def Corelib_Init_Logic_eq_Prop_refl {A : Prop} (a : A) : Corelib_Init_Logic_eq_Prop a a :=
  Corelib_Init_Logic_eq_Prop.refl a

-- True in Prop
inductive MyTrue : Prop where
  | intro : MyTrue

def MyTrue_intro := MyTrue.intro

-- False in Prop
inductive MyFalse : Prop where

def Original_False := MyFalse

-- Not
def Logic_not (P : Prop) : Prop := P → MyFalse

-- Iff
structure iff (A B : Prop) : Prop where
  intro ::
  mp : A → B
  mpr : B → A

-- Ex (existential)
inductive ex {A : Type} (P : A → Prop) : Prop where
  | intro : ∀ x : A, P x → ex P

-- Or
inductive or (A B : Prop) : Prop where
  | inl : A → or A B
  | inr : B → or A B

-- And
structure and (A B : Prop) : Prop where
  intro ::
  left : A
  right : B

-- ============================================================
-- LF.Basics bool
-- ============================================================

inductive Original_LF__DOT__Basics_LF_Basics_bool : Type where
  | true : Original_LF__DOT__Basics_LF_Basics_bool
  | false : Original_LF__DOT__Basics_LF_Basics_bool

def Original_LF__DOT__Basics_LF_Basics_true : Original_LF__DOT__Basics_LF_Basics_bool :=
  Original_LF__DOT__Basics_LF_Basics_bool.true

def Original_LF__DOT__Basics_LF_Basics_false : Original_LF__DOT__Basics_LF_Basics_bool :=
  Original_LF__DOT__Basics_LF_Basics_bool.false

def Original_LF__DOT__Basics_LF_Basics_negb (b : Original_LF__DOT__Basics_LF_Basics_bool) : Original_LF__DOT__Basics_LF_Basics_bool :=
  match b with
  | .true => .false
  | .false => .true

def Original_LF__DOT__Basics_LF_Basics_even : nat → Original_LF__DOT__Basics_LF_Basics_bool
  | nat.O => Original_LF__DOT__Basics_LF_Basics_bool.true
  | nat.S nat.O => Original_LF__DOT__Basics_LF_Basics_bool.false
  | nat.S (nat.S n) => Original_LF__DOT__Basics_LF_Basics_even n

def Original_LF__DOT__Basics_LF_Basics_odd (n : nat) : Original_LF__DOT__Basics_LF_Basics_bool :=
  Original_LF__DOT__Basics_LF_Basics_negb (Original_LF__DOT__Basics_LF_Basics_even n)

-- ============================================================
-- LF.Poly types (list, option, prod)
-- ============================================================

-- List
inductive Original_LF__DOT__Poly_LF_Poly_list (X : Type) : Type where
  | nil : Original_LF__DOT__Poly_LF_Poly_list X
  | cons : X → Original_LF__DOT__Poly_LF_Poly_list X → Original_LF__DOT__Poly_LF_Poly_list X

def Original_LF__DOT__Poly_LF_Poly_nil (X : Type) : Original_LF__DOT__Poly_LF_Poly_list X :=
  Original_LF__DOT__Poly_LF_Poly_list.nil

def Original_LF__DOT__Poly_LF_Poly_cons {X : Type} (x : X) (l : Original_LF__DOT__Poly_LF_Poly_list X) : Original_LF__DOT__Poly_LF_Poly_list X :=
  Original_LF__DOT__Poly_LF_Poly_list.cons x l

-- Append
def Original_LF__DOT__Poly_LF_Poly_app (X : Type) : Original_LF__DOT__Poly_LF_Poly_list X → Original_LF__DOT__Poly_LF_Poly_list X → Original_LF__DOT__Poly_LF_Poly_list X
  | .nil, l2 => l2
  | .cons h t, l2 => .cons h (Original_LF__DOT__Poly_LF_Poly_app X t l2)

-- Length
def Original_LF__DOT__Poly_LF_Poly_length (X : Type) : Original_LF__DOT__Poly_LF_Poly_list X → nat
  | .nil => nat.O
  | .cons _ t => nat.S (Original_LF__DOT__Poly_LF_Poly_length X t)

-- Option
inductive Original_LF__DOT__Poly_LF_Poly_option (X : Type) : Type where
  | Some : X → Original_LF__DOT__Poly_LF_Poly_option X
  | None : Original_LF__DOT__Poly_LF_Poly_option X

def Original_LF__DOT__Poly_LF_Poly_Some {X : Type} (x : X) : Original_LF__DOT__Poly_LF_Poly_option X :=
  Original_LF__DOT__Poly_LF_Poly_option.Some x

def Original_LF__DOT__Poly_LF_Poly_None (X : Type) : Original_LF__DOT__Poly_LF_Poly_option X :=
  Original_LF__DOT__Poly_LF_Poly_option.None

-- nth_error
def Original_LF__DOT__Poly_LF_Poly_nth__error (X : Type) : Original_LF__DOT__Poly_LF_Poly_list X → nat → Original_LF__DOT__Poly_LF_Poly_option X
  | .nil, _ => .None
  | .cons h _, nat.O => .Some h
  | .cons _ t, nat.S n => Original_LF__DOT__Poly_LF_Poly_nth__error X t n

-- Prod
inductive Original_LF__DOT__Poly_LF_Poly_prod (X Y : Type) : Type where
  | pair : X → Y → Original_LF__DOT__Poly_LF_Poly_prod X Y

def Original_LF__DOT__Poly_LF_Poly_pair {X Y : Type} (x : X) (y : Y) : Original_LF__DOT__Poly_LF_Poly_prod X Y :=
  Original_LF__DOT__Poly_LF_Poly_prod.pair x y

def Original_LF__DOT__Poly_LF_Poly_fst {X Y : Type} (p : Original_LF__DOT__Poly_LF_Poly_prod X Y) : X :=
  match p with
  | .pair x _ => x

def Original_LF__DOT__Poly_LF_Poly_snd {X Y : Type} (p : Original_LF__DOT__Poly_LF_Poly_prod X Y) : Y :=
  match p with
  | .pair _ y => y

-- split - with explicit match to ensure proper reduction
def Original_LF__DOT__Poly_LF_Poly_split {X Y : Type} : Original_LF__DOT__Poly_LF_Poly_list (Original_LF__DOT__Poly_LF_Poly_prod X Y) →
    Original_LF__DOT__Poly_LF_Poly_prod (Original_LF__DOT__Poly_LF_Poly_list X) (Original_LF__DOT__Poly_LF_Poly_list Y)
  | .nil => .pair .nil .nil
  | .cons p t =>
    match p with
    | .pair x y =>
      match Original_LF__DOT__Poly_LF_Poly_split t with
      | .pair lx ly => .pair (.cons x lx) (.cons y ly)

-- Reduction equation for split nil
theorem Original_LF__DOT__Poly_LF_Poly_split_nil_eq (X Y : Type) :
    @Corelib_Init_Logic_eq (Original_LF__DOT__Poly_LF_Poly_prod (Original_LF__DOT__Poly_LF_Poly_list X) (Original_LF__DOT__Poly_LF_Poly_list Y))
      (@Original_LF__DOT__Poly_LF_Poly_split X Y .nil)
      (.pair .nil .nil) := Corelib_Init_Logic_eq.refl _

-- Reduction equation for split cons (simplified form)
theorem Original_LF__DOT__Poly_LF_Poly_split_cons_eq (X Y : Type)
    (x : X) (y : Y) (t : Original_LF__DOT__Poly_LF_Poly_list (Original_LF__DOT__Poly_LF_Poly_prod X Y))
    (xs : Original_LF__DOT__Poly_LF_Poly_list X) (ys : Original_LF__DOT__Poly_LF_Poly_list Y)
    (h : Original_LF__DOT__Poly_LF_Poly_split t = .pair xs ys) :
    @Corelib_Init_Logic_eq (Original_LF__DOT__Poly_LF_Poly_prod (Original_LF__DOT__Poly_LF_Poly_list X) (Original_LF__DOT__Poly_LF_Poly_list Y))
      (@Original_LF__DOT__Poly_LF_Poly_split X Y (.cons (.pair x y) t))
      (.pair (.cons x xs) (.cons y ys)) := by
  simp only [Original_LF__DOT__Poly_LF_Poly_split, h]
  exact .refl _

-- combine (zip) - rewritten to match the Rocq version exactly
def Original_LF__DOT__Poly_LF_Poly_combine (X Y : Type) : Original_LF__DOT__Poly_LF_Poly_list X → Original_LF__DOT__Poly_LF_Poly_list Y → Original_LF__DOT__Poly_LF_Poly_list (Original_LF__DOT__Poly_LF_Poly_prod X Y)
  | .nil, _ => .nil
  | .cons x xs, ly =>
      match ly with
      | .nil => .nil
      | .cons y ys => .cons (.pair x y) (Original_LF__DOT__Poly_LF_Poly_combine X Y xs ys)

-- Reduction equations for combine
theorem Original_LF__DOT__Poly_LF_Poly_combine_nil_l_eq (X Y : Type) (l : Original_LF__DOT__Poly_LF_Poly_list Y) :
    @Corelib_Init_Logic_eq (Original_LF__DOT__Poly_LF_Poly_list (Original_LF__DOT__Poly_LF_Poly_prod X Y))
      (Original_LF__DOT__Poly_LF_Poly_combine X Y .nil l) .nil := Corelib_Init_Logic_eq.refl _

theorem Original_LF__DOT__Poly_LF_Poly_combine_nil_r_eq (X Y : Type) (x : X) (xs : Original_LF__DOT__Poly_LF_Poly_list X) :
    @Corelib_Init_Logic_eq (Original_LF__DOT__Poly_LF_Poly_list (Original_LF__DOT__Poly_LF_Poly_prod X Y))
      (Original_LF__DOT__Poly_LF_Poly_combine X Y (.cons x xs) .nil) .nil := Corelib_Init_Logic_eq.refl _

theorem Original_LF__DOT__Poly_LF_Poly_combine_cons_eq (X Y : Type) (x : X) (xs : Original_LF__DOT__Poly_LF_Poly_list X) (y : Y) (ys : Original_LF__DOT__Poly_LF_Poly_list Y) :
    @Corelib_Init_Logic_eq (Original_LF__DOT__Poly_LF_Poly_list (Original_LF__DOT__Poly_LF_Poly_prod X Y))
      (Original_LF__DOT__Poly_LF_Poly_combine X Y (.cons x xs) (.cons y ys))
      (.cons (.pair x y) (Original_LF__DOT__Poly_LF_Poly_combine X Y xs ys)) := Corelib_Init_Logic_eq.refl _

-- prod_curry
def Original_LF__DOT__Poly_LF_Poly_Exercises_prod__curry (X Y Z : Type)
    (f : Original_LF__DOT__Poly_LF_Poly_prod X Y → Z) (x : X) (y : Y) : Z :=
  f (.pair x y)

-- prod_uncurry (Admitted in Original - we provide natural implementation)
def Original_LF__DOT__Poly_LF_Poly_Exercises_prod__uncurry (X Y Z : Type)
    (f : X → Y → Z) (p : Original_LF__DOT__Poly_LF_Poly_prod X Y) : Z :=
  match p with
  | .pair x y => f x y

-- uncurry_curry theorem (Admitted in Original - we prove it)
def Original_LF__DOT__Poly_LF_Poly_Exercises_uncurry__curry (X Y Z : Type) (f : X → Y → Z) (x : X) (y : Y) :
  @Corelib_Init_Logic_eq Z
    (Original_LF__DOT__Poly_LF_Poly_Exercises_prod__curry X Y Z
       (fun p : Original_LF__DOT__Poly_LF_Poly_prod X Y =>
         Original_LF__DOT__Poly_LF_Poly_Exercises_prod__uncurry X Y Z f p) x y)
    (f x y) := Corelib_Init_Logic_eq.refl _

-- curry_uncurry theorem (Admitted in Original - we prove it)
def Original_LF__DOT__Poly_LF_Poly_Exercises_curry__uncurry (X Y Z : Type)
    (f : Original_LF__DOT__Poly_LF_Poly_prod X Y → Z) (p : Original_LF__DOT__Poly_LF_Poly_prod X Y) :
  @Corelib_Init_Logic_eq Z
    (Original_LF__DOT__Poly_LF_Poly_Exercises_prod__uncurry X Y Z
       (Original_LF__DOT__Poly_LF_Poly_Exercises_prod__curry X Y Z f) p)
    (f p) :=
  match p with
  | .pair x y => Corelib_Init_Logic_eq.refl _

-- test_nth_error3: nth_error [true] 2 = None
def Original_LF__DOT__Poly_LF_Poly_test__nth__error3 :
    @Corelib_Init_Logic_eq (Original_LF__DOT__Poly_LF_Poly_option Original_LF__DOT__Basics_LF_Basics_bool)
      (Original_LF__DOT__Poly_LF_Poly_nth__error Original_LF__DOT__Basics_LF_Basics_bool
        (.cons Original_LF__DOT__Basics_LF_Basics_bool.true .nil)
        (nat.S (nat.S nat.O)))
      .None :=
  Corelib_Init_Logic_eq.refl _

-- ============================================================
-- LF.Tactics
-- ============================================================

-- Tactics.split is same as Poly.split
def Original_LF__DOT__Tactics_LF_Tactics_split {X Y : Type} :=
  @Original_LF__DOT__Poly_LF_Poly_split X Y

-- Convert native eq to Corelib_Init_Logic_eq
def native_to_custom_eq {A : Type} {a b : A} (h : a = b) : Corelib_Init_Logic_eq a b :=
  h ▸ .refl a

-- Helper: native equality version with explicit unfolding
theorem combine_split_strong_native {X Y : Type}
    (l : Original_LF__DOT__Poly_LF_Poly_list (Original_LF__DOT__Poly_LF_Poly_prod X Y)) :
    Original_LF__DOT__Poly_LF_Poly_combine X Y (Original_LF__DOT__Poly_LF_Poly_split l).1 (Original_LF__DOT__Poly_LF_Poly_split l).2 = l := by
  induction l with
  | nil => rfl
  | cons p t ih =>
    cases p with
    | pair x y =>
      simp only [Original_LF__DOT__Poly_LF_Poly_split, Original_LF__DOT__Poly_LF_Poly_combine,
                 Original_LF__DOT__Poly_LF_Poly_prod.pair.injEq, true_and]
      exact congrArg (Original_LF__DOT__Poly_LF_Poly_list.cons (.pair x y)) ih

-- Convert custom eq to native eq
def custom_to_native_eq {A : Type} {a b : A} (h : Corelib_Init_Logic_eq a b) : a = b :=
  match h with
  | .refl _ => rfl

-- combine_split theorem (Admitted in Original - we prove it)
def Original_LF__DOT__Tactics_LF_Tactics_combine__split (X Y : Type)
    (l : Original_LF__DOT__Poly_LF_Poly_list (Original_LF__DOT__Poly_LF_Poly_prod X Y))
    (l1 : Original_LF__DOT__Poly_LF_Poly_list X) (l2 : Original_LF__DOT__Poly_LF_Poly_list Y)
    (h : @Corelib_Init_Logic_eq (Original_LF__DOT__Poly_LF_Poly_prod (Original_LF__DOT__Poly_LF_Poly_list X) (Original_LF__DOT__Poly_LF_Poly_list Y))
      (Original_LF__DOT__Tactics_LF_Tactics_split l)
      (Original_LF__DOT__Poly_LF_Poly_pair l1 l2)) :
    @Corelib_Init_Logic_eq (Original_LF__DOT__Poly_LF_Poly_list (Original_LF__DOT__Poly_LF_Poly_prod X Y))
      (Original_LF__DOT__Poly_LF_Poly_combine X Y l1 l2)
      l := by
  have hn : Original_LF__DOT__Tactics_LF_Tactics_split l = Original_LF__DOT__Poly_LF_Poly_pair l1 l2 :=
    custom_to_native_eq h
  unfold Original_LF__DOT__Tactics_LF_Tactics_split at hn
  match hsp : Original_LF__DOT__Poly_LF_Poly_split l with
  | .pair xs ys =>
    have heq : Original_LF__DOT__Poly_LF_Poly_prod.pair xs ys = Original_LF__DOT__Poly_LF_Poly_prod.pair l1 l2 :=
      hsp ▸ hn
    injection heq with h1 h2
    subst h1 h2
    have hsimpl : (Original_LF__DOT__Poly_LF_Poly_split l).1 = xs ∧ (Original_LF__DOT__Poly_LF_Poly_split l).2 = ys := by
      rw [hsp]; exact ⟨rfl, rfl⟩
    rw [← hsimpl.1, ← hsimpl.2]
    exact native_to_custom_eq (combine_split_strong_native l)

-- Helper: native equality version
def nth_error_after_last_native {X : Type} :
    (l : Original_LF__DOT__Poly_LF_Poly_list X) →
    Original_LF__DOT__Poly_LF_Poly_nth__error X l (Original_LF__DOT__Poly_LF_Poly_length X l) =
    Original_LF__DOT__Poly_LF_Poly_None X
  | .nil => rfl
  | .cons x t => nth_error_after_last_native t

-- nth_error_after_last theorem (Admitted in Original - we prove it)
def Original_LF__DOT__Tactics_LF_Tactics_nth__error__after__last (n : nat) (X : Type)
    (l : Original_LF__DOT__Poly_LF_Poly_list X)
    (h : @Corelib_Init_Logic_eq nat (Original_LF__DOT__Poly_LF_Poly_length X l) n) :
    @Corelib_Init_Logic_eq (Original_LF__DOT__Poly_LF_Poly_option X)
      (Original_LF__DOT__Poly_LF_Poly_nth__error X l n)
      (Original_LF__DOT__Poly_LF_Poly_None X) := by
  have hn : Original_LF__DOT__Poly_LF_Poly_length X l = n := custom_to_native_eq h
  subst hn
  exact native_to_custom_eq (nth_error_after_last_native l)

-- trans_eq_example' (Admitted in Original - we prove it)
def Original_LF__DOT__Tactics_LF_Tactics_trans__eq__example' (a b c d e f : nat)
    (h1 : @Corelib_Init_Logic_eq (Original_LF__DOT__Poly_LF_Poly_list nat)
      (.cons a (.cons b .nil))
      (.cons c (.cons d .nil)))
    (h2 : @Corelib_Init_Logic_eq (Original_LF__DOT__Poly_LF_Poly_list nat)
      (.cons c (.cons d .nil))
      (.cons e (.cons f .nil))) :
    @Corelib_Init_Logic_eq (Original_LF__DOT__Poly_LF_Poly_list nat)
      (.cons a (.cons b .nil))
      (.cons e (.cons f .nil)) :=
  match h1, h2 with
  | .refl _, .refl _ => .refl _

-- trans_eq_example'' (Admitted in Original - we prove it)
def Original_LF__DOT__Tactics_LF_Tactics_trans__eq__example'' (a b c d e f : nat)
    (h1 : @Corelib_Init_Logic_eq (Original_LF__DOT__Poly_LF_Poly_list nat)
      (.cons a (.cons b .nil))
      (.cons c (.cons d .nil)))
    (h2 : @Corelib_Init_Logic_eq (Original_LF__DOT__Poly_LF_Poly_list nat)
      (.cons c (.cons d .nil))
      (.cons e (.cons f .nil))) :
    @Corelib_Init_Logic_eq (Original_LF__DOT__Poly_LF_Poly_list nat)
      (.cons a (.cons b .nil))
      (.cons e (.cons f .nil)) :=
  match h1, h2 with
  | .refl _, .refl _ => .refl _

-- trans_eq_example''' (Admitted in Original - we prove it)
def Original_LF__DOT__Tactics_LF_Tactics_trans__eq__example''' (a b c d e f : nat)
    (h1 : @Corelib_Init_Logic_eq (Original_LF__DOT__Poly_LF_Poly_list nat)
      (.cons a (.cons b .nil))
      (.cons c (.cons d .nil)))
    (h2 : @Corelib_Init_Logic_eq (Original_LF__DOT__Poly_LF_Poly_list nat)
      (.cons c (.cons d .nil))
      (.cons e (.cons f .nil))) :
    @Corelib_Init_Logic_eq (Original_LF__DOT__Poly_LF_Poly_list nat)
      (.cons a (.cons b .nil))
      (.cons e (.cons f .nil)) :=
  match h1, h2 with
  | .refl _, .refl _ => .refl _

-- ============================================================
-- LF.IndPrinciples
-- ============================================================

-- time : an inductive type with day and night constructors
inductive Original_LF__DOT__IndPrinciples_LF_IndPrinciples_time : Type where
  | day : Original_LF__DOT__IndPrinciples_LF_IndPrinciples_time
  | night : Original_LF__DOT__IndPrinciples_LF_IndPrinciples_time

-- ============================================================
-- LF.AltAuto
-- ============================================================

-- S_injective_from_tactics (Admitted in Original - we prove it)
def Original_LF__DOT__AltAuto_LF_AltAuto_S__injective__from__tactics (n m : nat)
    (h : @Corelib_Init_Logic_eq nat (nat.S n) (nat.S m)) :
    @Corelib_Init_Logic_eq nat n m :=
  match h with
  | .refl _ => .refl n

-- ============================================================
-- Standard library types (for checkers)
-- ============================================================

-- Standard prod
inductive prod (A B : Type) : Type where
  | pair : A → B → prod A B

def prod_pair {A B : Type} (a : A) (b : B) : prod A B := prod.pair a b

-- Standard list
inductive list (A : Type) : Type where
  | nil : list A
  | cons : A → list A → list A

def nil (A : Type) : list A := list.nil
def cons {A : Type} (x : A) (l : list A) : list A := list.cons x l

-- Standard option
inductive option (A : Type) : Type where
  | None : option A
  | Some : A → option A

def None (A : Type) : option A := option.None
def Some {A : Type} (x : A) : option A := option.Some x

-- List.In
def List_In {A : Type} (a : A) : list A → Prop
  | .nil => MyFalse
  | .cons x xs => or (Corelib_Init_Logic_eq x a) (List_In a xs)

-- ============================================================
-- Rel
-- ============================================================

def Original_LF_Rel_relation (X : Type) := X → X → Prop

def Original_LF_Rel_transitive {X : Type} (R : Original_LF_Rel_relation X) : Prop :=
  ∀ a b c : X, R a b → R b c → R a c

def Original_LF_Rel_antisymmetric {X : Type} (R : Original_LF_Rel_relation X) : Prop :=
  ∀ a b : X, R a b → R b a → @Corelib_Init_Logic_eq X a b

-- le
inductive le : nat → nat → Prop where
  | le_n : ∀ n, le n n
  | le_S : ∀ n m, le n m → le n (nat.S m)

-- ============================================================
-- Maps (for other checkers)
-- ============================================================

def Original_LF__DOT__Maps_LF_Maps_total__map (A : Type) : Type := String_string → A

def Original_LF__DOT__Maps_LF_Maps_t__empty {A : Type} (v : A) : Original_LF__DOT__Maps_LF_Maps_total__map A :=
  fun _ => v

def Original_LF__DOT__Maps_LF_Maps_t__update {A : Type} (m : Original_LF__DOT__Maps_LF_Maps_total__map A)
    (x : String_string) (v : A) : Original_LF__DOT__Maps_LF_Maps_total__map A :=
  fun x' => match String_eqb x x' with
            | Stdlib_bool.true => v
            | Stdlib_bool.false => m x'

-- ============================================================
-- Imp
-- ============================================================

def Original_LF__DOT__Imp_LF_Imp_state : Type := Original_LF__DOT__Maps_LF_Maps_total__map nat

-- X = "X" character
def charX : Ascii_ascii :=
  Ascii_ascii.Ascii Stdlib_bool.false Stdlib_bool.false Stdlib_bool.false Stdlib_bool.true
                    Stdlib_bool.true Stdlib_bool.false Stdlib_bool.true Stdlib_bool.false

-- Y = "Y" character
def charY : Ascii_ascii :=
  Ascii_ascii.Ascii Stdlib_bool.true Stdlib_bool.false Stdlib_bool.false Stdlib_bool.true
                    Stdlib_bool.true Stdlib_bool.false Stdlib_bool.true Stdlib_bool.false

-- Z = "Z" character
def charZ : Ascii_ascii :=
  Ascii_ascii.Ascii Stdlib_bool.false Stdlib_bool.true Stdlib_bool.false Stdlib_bool.true
                    Stdlib_bool.true Stdlib_bool.false Stdlib_bool.true Stdlib_bool.false

def Original_LF__DOT__Imp_LF_Imp_X : String_string := String_string.String charX String_string.EmptyString
def Original_LF__DOT__Imp_LF_Imp_Y : String_string := String_string.String charY String_string.EmptyString

def Original_LF__DOT__Imp_LF_Imp_empty__st : Original_LF__DOT__Imp_LF_Imp_state := fun _ => nat.O

-- aexp
inductive Original_LF__DOT__Imp_LF_Imp_aexp : Type where
  | ANum : nat → Original_LF__DOT__Imp_LF_Imp_aexp
  | AId : String_string → Original_LF__DOT__Imp_LF_Imp_aexp
  | APlus : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp
  | AMinus : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp
  | AMult : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp

def Original_LF__DOT__Imp_LF_Imp_ANum := Original_LF__DOT__Imp_LF_Imp_aexp.ANum
def Original_LF__DOT__Imp_LF_Imp_AId := Original_LF__DOT__Imp_LF_Imp_aexp.AId

-- bexp
inductive Original_LF__DOT__Imp_LF_Imp_bexp : Type where
  | BTrue : Original_LF__DOT__Imp_LF_Imp_bexp
  | BFalse : Original_LF__DOT__Imp_LF_Imp_bexp
  | BEq : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_bexp
  | BNeq : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_bexp
  | BLe : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_bexp
  | BGt : Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_aexp → Original_LF__DOT__Imp_LF_Imp_bexp
  | BNot : Original_LF__DOT__Imp_LF_Imp_bexp → Original_LF__DOT__Imp_LF_Imp_bexp
  | BAnd : Original_LF__DOT__Imp_LF_Imp_bexp → Original_LF__DOT__Imp_LF_Imp_bexp → Original_LF__DOT__Imp_LF_Imp_bexp

-- com
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
  | .ANum n => n
  | .AId x => st x
  | .APlus a1 a2 => Nat_add (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2)
  | .AMinus a1 a2 => Nat_sub (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2)
  | .AMult a1 a2 => Nat_mul (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2)

-- beval
def Original_LF__DOT__Imp_LF_Imp_beval (st : Original_LF__DOT__Imp_LF_Imp_state) : Original_LF__DOT__Imp_LF_Imp_bexp → Stdlib_bool
  | .BTrue => Stdlib_bool.true
  | .BFalse => Stdlib_bool.false
  | .BEq a1 a2 => Nat_eqb (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2)
  | .BNeq a1 a2 => negb (Nat_eqb (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2))
  | .BLe a1 a2 => Nat_leb (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2)
  | .BGt a1 a2 => negb (Nat_leb (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2))
  | .BNot b => negb (Original_LF__DOT__Imp_LF_Imp_beval st b)
  | .BAnd b1 b2 => andb (Original_LF__DOT__Imp_LF_Imp_beval st b1) (Original_LF__DOT__Imp_LF_Imp_beval st b2)

def Original_LF__DOT__Imp_LF_Imp_manual__grade__for__XtimesYinZ__spec : option (prod nat String_string) := option.None

-- ============================================================
-- IndProp types
-- ============================================================

inductive Original_LF__DOT__IndProp_LF_IndProp_reg__exp (T : Type) : Type where
  | EmptySet : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T
  | EmptyStr : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T
  | Char : T → Original_LF__DOT__IndProp_LF_IndProp_reg__exp T
  | App : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T → Original_LF__DOT__IndProp_LF_IndProp_reg__exp T → Original_LF__DOT__IndProp_LF_IndProp_reg__exp T
  | Union : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T → Original_LF__DOT__IndProp_LF_IndProp_reg__exp T → Original_LF__DOT__IndProp_LF_IndProp_reg__exp T
  | Star : Original_LF__DOT__IndProp_LF_IndProp_reg__exp T → Original_LF__DOT__IndProp_LF_IndProp_reg__exp T

def Original_LF__DOT__IndProp_LF_IndProp_EmptySet (T : Type) := Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptySet (T := T)
def Original_LF__DOT__IndProp_LF_IndProp_EmptyStr (T : Type) := Original_LF__DOT__IndProp_LF_IndProp_reg__exp.EmptyStr (T := T)
def Original_LF__DOT__IndProp_LF_IndProp_Char {T : Type} := Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Char (T := T)
def Original_LF__DOT__IndProp_LF_IndProp_App {T : Type} := Original_LF__DOT__IndProp_LF_IndProp_reg__exp.App (T := T)
def Original_LF__DOT__IndProp_LF_IndProp_Union {T : Type} := Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Union (T := T)
def Original_LF__DOT__IndProp_LF_IndProp_Star {T : Type} := Original_LF__DOT__IndProp_LF_IndProp_reg__exp.Star (T := T)

-- exp_match
inductive Original_LF__DOT__IndProp_LF_IndProp_exp__match {T : Type} :
    Original_LF__DOT__Poly_LF_Poly_list T → Original_LF__DOT__IndProp_LF_IndProp_reg__exp T → Prop where
  | MEmpty : Original_LF__DOT__IndProp_LF_IndProp_exp__match .nil .EmptyStr
  | MChar : ∀ x, Original_LF__DOT__IndProp_LF_IndProp_exp__match (.cons x .nil) (.Char x)
  | MApp : ∀ s1 re1 s2 re2,
      Original_LF__DOT__IndProp_LF_IndProp_exp__match s1 re1 →
      Original_LF__DOT__IndProp_LF_IndProp_exp__match s2 re2 →
      Original_LF__DOT__IndProp_LF_IndProp_exp__match (Original_LF__DOT__Poly_LF_Poly_app T s1 s2) (.App re1 re2)
  | MUnionL : ∀ s re1 re2,
      Original_LF__DOT__IndProp_LF_IndProp_exp__match s re1 →
      Original_LF__DOT__IndProp_LF_IndProp_exp__match s (.Union re1 re2)
  | MUnionR : ∀ s re1 re2,
      Original_LF__DOT__IndProp_LF_IndProp_exp__match s re2 →
      Original_LF__DOT__IndProp_LF_IndProp_exp__match s (.Union re1 re2)
  | MStar0 : ∀ re, Original_LF__DOT__IndProp_LF_IndProp_exp__match .nil (.Star re)
  | MStarApp : ∀ s1 s2 re,
      Original_LF__DOT__IndProp_LF_IndProp_exp__match s1 re →
      Original_LF__DOT__IndProp_LF_IndProp_exp__match s2 (.Star re) →
      Original_LF__DOT__IndProp_LF_IndProp_exp__match (Original_LF__DOT__Poly_LF_Poly_app T s1 s2) (.Star re)

-- subseq
inductive Original_LF__DOT__IndProp_LF_IndProp_subseq {X : Type} : Original_LF__DOT__Poly_LF_Poly_list X → Original_LF__DOT__Poly_LF_Poly_list X → Prop where
  | sub_nil : Original_LF__DOT__IndProp_LF_IndProp_subseq .nil .nil
  | sub_take : ∀ x l1 l2, Original_LF__DOT__IndProp_LF_IndProp_subseq l1 l2 →
      Original_LF__DOT__IndProp_LF_IndProp_subseq (.cons x l1) (.cons x l2)
  | sub_skip : ∀ x l1 l2, Original_LF__DOT__IndProp_LF_IndProp_subseq l1 l2 →
      Original_LF__DOT__IndProp_LF_IndProp_subseq l1 (.cons x l2)

-- In (for poly list)
def Original_LF__DOT__IndProp_LF_IndProp_In {A : Type} (a : A) : Original_LF__DOT__Poly_LF_Poly_list A → Prop
  | .nil => MyFalse
  | .cons x xs => or (Corelib_Init_Logic_eq x a) (Original_LF__DOT__IndProp_LF_IndProp_In a xs)

-- ============================================================
-- ImpParser
-- ============================================================

def Original_LF__DOT__ImpParser_LF_ImpParser_token := String_string

inductive Original_LF__DOT__ImpParser_LF_ImpParser_optionE (X : Type) : Type where
  | SomeE : X → Original_LF__DOT__ImpParser_LF_ImpParser_optionE X
  | NoneE : String_string → Original_LF__DOT__ImpParser_LF_ImpParser_optionE X

-- ============================================================
-- Logic
-- ============================================================

def Original_LF__DOT__Logic_LF_Logic_ex {A : Type} (P : A → Prop) : Prop := ex P

def Original_LF__DOT__Logic_LF_Logic_In {A : Type} (a : A) : Original_LF__DOT__Poly_LF_Poly_list A → Prop :=
  Original_LF__DOT__IndProp_LF_IndProp_In a

-- ============================================================
-- Induction
-- ============================================================

def Original_LF__DOT__Induction_LF_Induction_double : nat → nat
  | nat.O => nat.O
  | nat.S n => nat.S (nat.S (Original_LF__DOT__Induction_LF_Induction_double n))

-- ============================================================
-- More Poly definitions
-- ============================================================

def Original_LF__DOT__Poly_LF_Poly_filter {X : Type} (test : X → Original_LF__DOT__Basics_LF_Basics_bool) :
    Original_LF__DOT__Poly_LF_Poly_list X → Original_LF__DOT__Poly_LF_Poly_list X
  | .nil => .nil
  | .cons x l =>
    match test x with
    | .true => .cons x (Original_LF__DOT__Poly_LF_Poly_filter test l)
    | .false => Original_LF__DOT__Poly_LF_Poly_filter test l

def Original_LF__DOT__Poly_LF_Poly_rev {X : Type} : Original_LF__DOT__Poly_LF_Poly_list X → Original_LF__DOT__Poly_LF_Poly_list X
  | .nil => .nil
  | .cons h t => Original_LF__DOT__Poly_LF_Poly_app X (Original_LF__DOT__Poly_LF_Poly_rev t) (.cons h .nil)

def Original_LF__DOT__Poly_LF_Poly_countoddmembers' (l : Original_LF__DOT__Poly_LF_Poly_list nat) : nat :=
  Original_LF__DOT__Poly_LF_Poly_length nat (Original_LF__DOT__Poly_LF_Poly_filter Original_LF__DOT__Basics_LF_Basics_odd l)

def Original_LF__DOT__Poly_LF_Poly_map {X Y : Type} (f : X → Y) : Original_LF__DOT__Poly_LF_Poly_list X → Original_LF__DOT__Poly_LF_Poly_list Y
  | .nil => .nil
  | .cons h t => .cons (f h) (Original_LF__DOT__Poly_LF_Poly_map f t)

def Original_LF__DOT__Maps_LF_Maps_partial__map (A : Type) : Type :=
  Original_LF__DOT__Maps_LF_Maps_total__map (Original_LF__DOT__Poly_LF_Poly_option A)

def Original_LF__DOT__Maps_LF_Maps_update {A : Type} (m : Original_LF__DOT__Maps_LF_Maps_partial__map A)
    (x : String_string) (v : A) : Original_LF__DOT__Maps_LF_Maps_partial__map A :=
  Original_LF__DOT__Maps_LF_Maps_t__update m x (.Some v)

def Original_LF__DOT__Logic_LF_Logic_Even (x : nat) : Prop :=
  Original_LF__DOT__Logic_LF_Logic_ex (fun n => Corelib_Init_Logic_eq x (Original_LF__DOT__Induction_LF_Induction_double n))

def Original_LF__DOT__Logic_LF_Logic_combine__odd__even (Podd Peven : nat → Prop) (n : nat) : Prop :=
  match Original_LF__DOT__Basics_LF_Basics_odd n with
  | .true => Podd n
  | .false => Peven n

-- Eta-expansion for split that matches the fix structure  
