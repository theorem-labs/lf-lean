-- Comprehensive Lean translation for all required isomorphisms
set_option linter.all false

-- ============================================================
-- Basic Types
-- ============================================================

-- True type in Prop (will be imported as SProp in Rocq)
-- Name: MyTrue (for Imported.MyTrue)
inductive MyTrue : Prop where
  | intro : MyTrue

-- False type in Prop (will be imported as SProp in Rocq)
-- Name: MyFalse (for Imported.False)
inductive MyFalse : Prop where

-- Bool type for bool__iso
inductive mybool : Type where
  | mytrue : mybool
  | myfalse : mybool

-- Ascii type using mybool (for Ascii_ascii_iso)
inductive Ascii_ascii : Type where
  | Ascii : mybool → mybool → mybool → mybool → mybool → mybool → mybool → mybool → Ascii_ascii

-- String type using Ascii_ascii (for String_string_iso)
inductive String_string : Type where
  | EmptyString : String_string
  | String : Ascii_ascii → String_string → String_string

-- List type for standard list iso (mylist with mynil/mycons)
inductive mylist (X : Type) : Type where
  | mynil : mylist X
  | mycons : X → mylist X → mylist X

-- In predicate for mylist
inductive mylist_In {A : Type} : A → mylist A → Prop where
  | In_head : ∀ (a : A) (l : mylist A), mylist_In a (mylist.mycons a l)
  | In_tail : ∀ (a b : A) (l : mylist A), mylist_In a l → mylist_In a (mylist.mycons b l)

-- Equality in Prop (will be exported to SProp) - universe polymorphic
inductive Corelib_Init_Logic_eq.{u} {A : Sort u} : A → A → Prop where
  | refl (a : A) : Corelib_Init_Logic_eq a a

-- Equality in Prop for Prop arguments (SProp in Rocq for SProp arguments)
inductive Corelib_Init_Logic_eq_Prop {A : Prop} : A → A → Prop where
  | refl (a : A) : Corelib_Init_Logic_eq_Prop a a

-- Natural numbers
inductive nat : Type where
  | O : nat
  | S : nat → nat

def _0 : nat := nat.O
def S_export : nat → nat := nat.S
-- Keep S alias for internal use
abbrev S : nat → nat := nat.S

-- Bool type (LF.Basics.bool)
inductive Original_LF__DOT__Basics_LF_Basics_bool : Type where
  | true : Original_LF__DOT__Basics_LF_Basics_bool
  | false : Original_LF__DOT__Basics_LF_Basics_bool

def Original_LF__DOT__Basics_LF_Basics_true : Original_LF__DOT__Basics_LF_Basics_bool :=
  Original_LF__DOT__Basics_LF_Basics_bool.true

def Original_LF__DOT__Basics_LF_Basics_false : Original_LF__DOT__Basics_LF_Basics_bool :=
  Original_LF__DOT__Basics_LF_Basics_bool.false

-- ============================================================
-- Coq-style bool for string comparisons (maps)
-- ============================================================

inductive Coqbool : Type where
  | true : Coqbool
  | false : Coqbool

def Coqbool_true := Coqbool.true
def Coqbool_false := Coqbool.false

-- Ascii and String types for maps
inductive Coqascii : Type where
  | Ascii : Coqbool → Coqbool → Coqbool → Coqbool → Coqbool → Coqbool → Coqbool → Coqbool → Coqascii

inductive Coqstring : Type where
  | EmptyString : Coqstring
  | String : Coqascii → Coqstring → Coqstring

-- Bool equality
def Coqbool_beq (b1 b2 : Coqbool) : Coqbool :=
  match b1, b2 with
  | .true, .true => .true
  | .false, .false => .true
  | _, _ => .false

-- Ascii equality
def Coqascii_eqb (a1 a2 : Coqascii) : Coqbool :=
  match a1, a2 with
  | .Ascii b1 b2 b3 b4 b5 b6 b7 b8, .Ascii c1 c2 c3 c4 c5 c6 c7 c8 =>
    match Coqbool_beq b1 c1 with
    | .false => .false
    | .true =>
      match Coqbool_beq b2 c2 with
      | .false => .false
      | .true =>
        match Coqbool_beq b3 c3 with
        | .false => .false
        | .true =>
          match Coqbool_beq b4 c4 with
          | .false => .false
          | .true =>
            match Coqbool_beq b5 c5 with
            | .false => .false
            | .true =>
              match Coqbool_beq b6 c6 with
              | .false => .false
              | .true =>
                match Coqbool_beq b7 c7 with
                | .false => .false
                | .true => Coqbool_beq b8 c8

-- String equality
def Coqstring_eqb : Coqstring → Coqstring → Coqbool
  | .EmptyString, .EmptyString => .true
  | .EmptyString, .String _ _ => .false
  | .String _ _, .EmptyString => .false
  | .String c1 s1, .String c2 s2 =>
    match Coqascii_eqb c1 c2 with
    | .false => .false
    | .true => Coqstring_eqb s1 s2

-- ============================================================
-- Arithmetic operations
-- ============================================================

-- eqb function (equality test for nat)
def Original_LF__DOT__Basics_LF_Basics_eqb : nat → nat → Original_LF__DOT__Basics_LF_Basics_bool
  | nat.O, nat.O => Original_LF__DOT__Basics_LF_Basics_bool.true
  | nat.O, nat.S _ => Original_LF__DOT__Basics_LF_Basics_bool.false
  | nat.S _, nat.O => Original_LF__DOT__Basics_LF_Basics_bool.false
  | nat.S n', nat.S m' => Original_LF__DOT__Basics_LF_Basics_eqb n' m'

-- ltb function (less than)
def Original_LF__DOT__Basics_LF_Basics_ltb : nat → nat → Original_LF__DOT__Basics_LF_Basics_bool
  | nat.O, nat.O => Original_LF__DOT__Basics_LF_Basics_bool.false
  | nat.O, nat.S _ => Original_LF__DOT__Basics_LF_Basics_bool.true
  | nat.S _, nat.O => Original_LF__DOT__Basics_LF_Basics_bool.false
  | nat.S n', nat.S m' => Original_LF__DOT__Basics_LF_Basics_ltb n' m'

-- plus function (addition)
def Original_LF__DOT__Basics_LF_Basics_plus : nat → nat → nat
  | nat.O, m => m
  | nat.S n', m => nat.S (Original_LF__DOT__Basics_LF_Basics_plus n' m)

-- mult function (multiplication)
def Original_LF__DOT__Basics_LF_Basics_mult : nat → nat → nat
  | nat.O, _ => nat.O
  | nat.S n', m => Original_LF__DOT__Basics_LF_Basics_plus m (Original_LF__DOT__Basics_LF_Basics_mult n' m)

-- test_ltb2: ltb 2 4 = true (Admitted in Original.v)
axiom Original_LF__DOT__Basics_LF_Basics_test__ltb2 :
  Corelib_Init_Logic_eq (Original_LF__DOT__Basics_LF_Basics_ltb (S (S _0)) (S (S (S (S _0))))) Original_LF__DOT__Basics_LF_Basics_true

-- test_mult1: Admitted in Original.v
axiom Original_LF__DOT__Basics_LF_Basics_test__mult1 :
  Corelib_Init_Logic_eq (Original_LF__DOT__Basics_LF_Basics_mult (S (S (S _0))) (S (S (S _0)))) (S (S (S (S (S (S (S (S (S _0)))))))))

-- ============================================================
-- Polymorphic list type
-- ============================================================

inductive Original_LF__DOT__Poly_LF_Poly_list (X : Type) : Type where
  | nil : Original_LF__DOT__Poly_LF_Poly_list X
  | cons : X → Original_LF__DOT__Poly_LF_Poly_list X → Original_LF__DOT__Poly_LF_Poly_list X

-- Alias for Coq list
def «list» := Original_LF__DOT__Poly_LF_Poly_list

def Original_LF__DOT__Poly_LF_Poly_nil (X : Type) : Original_LF__DOT__Poly_LF_Poly_list X :=
  Original_LF__DOT__Poly_LF_Poly_list.nil

def Original_LF__DOT__Poly_LF_Poly_cons {X : Type} : X → Original_LF__DOT__Poly_LF_Poly_list X → Original_LF__DOT__Poly_LF_Poly_list X :=
  Original_LF__DOT__Poly_LF_Poly_list.cons

-- length function
def Original_LF__DOT__Poly_LF_Poly_length {X : Type} : Original_LF__DOT__Poly_LF_Poly_list X → nat
  | Original_LF__DOT__Poly_LF_Poly_list.nil => nat.O
  | Original_LF__DOT__Poly_LF_Poly_list.cons _ t => nat.S (Original_LF__DOT__Poly_LF_Poly_length t)

-- length_is_1 predicate
def Original_LF__DOT__Poly_LF_Poly_length__is__1 {X : Type} (l : Original_LF__DOT__Poly_LF_Poly_list X) : Original_LF__DOT__Basics_LF_Basics_bool :=
  Original_LF__DOT__Basics_LF_Basics_eqb (Original_LF__DOT__Poly_LF_Poly_length l) (nat.S nat.O)

-- filter function
def Original_LF__DOT__Poly_LF_Poly_filter {X : Type} (test : X → Original_LF__DOT__Basics_LF_Basics_bool) : Original_LF__DOT__Poly_LF_Poly_list X → Original_LF__DOT__Poly_LF_Poly_list X
  | Original_LF__DOT__Poly_LF_Poly_list.nil => Original_LF__DOT__Poly_LF_Poly_list.nil
  | Original_LF__DOT__Poly_LF_Poly_list.cons h t =>
    match test h with
    | Original_LF__DOT__Basics_LF_Basics_bool.true => Original_LF__DOT__Poly_LF_Poly_list.cons h (Original_LF__DOT__Poly_LF_Poly_filter test t)
    | Original_LF__DOT__Basics_LF_Basics_bool.false => Original_LF__DOT__Poly_LF_Poly_filter test t

-- test_filter2: Admitted in Original.v
axiom Original_LF__DOT__Poly_LF_Poly_test__filter2 :
  Corelib_Init_Logic_eq
    (Original_LF__DOT__Poly_LF_Poly_filter (fun x : Original_LF__DOT__Poly_LF_Poly_list nat => Original_LF__DOT__Poly_LF_Poly_length__is__1 x)
       (Original_LF__DOT__Poly_LF_Poly_cons
          (Original_LF__DOT__Poly_LF_Poly_cons (S _0)
             (Original_LF__DOT__Poly_LF_Poly_cons (S (S _0)) (Original_LF__DOT__Poly_LF_Poly_nil nat)))
          (Original_LF__DOT__Poly_LF_Poly_cons
             (Original_LF__DOT__Poly_LF_Poly_cons (S (S (S _0))) (Original_LF__DOT__Poly_LF_Poly_nil nat))
             (Original_LF__DOT__Poly_LF_Poly_cons
                (Original_LF__DOT__Poly_LF_Poly_cons (S (S (S (S _0)))) (Original_LF__DOT__Poly_LF_Poly_nil nat))
                (Original_LF__DOT__Poly_LF_Poly_cons
                   (Original_LF__DOT__Poly_LF_Poly_cons (S (S (S (S (S _0)))))
                      (Original_LF__DOT__Poly_LF_Poly_cons (S (S (S (S (S (S _0))))))
                         (Original_LF__DOT__Poly_LF_Poly_cons (S (S (S (S (S (S (S _0)))))))
                            (Original_LF__DOT__Poly_LF_Poly_nil nat))))
                   (Original_LF__DOT__Poly_LF_Poly_cons (Original_LF__DOT__Poly_LF_Poly_nil nat)
                      (Original_LF__DOT__Poly_LF_Poly_cons
                         (Original_LF__DOT__Poly_LF_Poly_cons (S (S (S (S (S (S (S (S _0))))))))
                            (Original_LF__DOT__Poly_LF_Poly_nil nat))
                         (Original_LF__DOT__Poly_LF_Poly_nil (Original_LF__DOT__Poly_LF_Poly_list nat)))))))))
    (Original_LF__DOT__Poly_LF_Poly_cons
       (Original_LF__DOT__Poly_LF_Poly_cons (S (S (S _0))) (Original_LF__DOT__Poly_LF_Poly_nil nat))
       (Original_LF__DOT__Poly_LF_Poly_cons
          (Original_LF__DOT__Poly_LF_Poly_cons (S (S (S (S _0)))) (Original_LF__DOT__Poly_LF_Poly_nil nat))
          (Original_LF__DOT__Poly_LF_Poly_cons
             (Original_LF__DOT__Poly_LF_Poly_cons (S (S (S (S (S (S (S (S _0))))))))
                (Original_LF__DOT__Poly_LF_Poly_nil nat))
             (Original_LF__DOT__Poly_LF_Poly_nil (Original_LF__DOT__Poly_LF_Poly_list nat)))))

-- ============================================================
-- Perm3 inductive type
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

-- Perm3_symm is Admitted in Original.v
axiom Original_LF__DOT__IndProp_LF_IndProp_Perm3__symm : ∀ (X : Type) (l1 l2 : Original_LF__DOT__Poly_LF_Poly_list X),
  @Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3 X l1 l2 →
  @Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3 X l2 l1

-- ============================================================
-- Logic definitions
-- ============================================================

-- plus_claim is 2 + 2 = 4 using Lean's Nat
def Original_LF__DOT__Logic_LF_Logic_plus__claim : Prop :=
  Corelib_Init_Logic_eq
    (Original_LF__DOT__Basics_LF_Basics_plus (S (S _0)) (S (S _0)))
    (S (S (S (S _0))))

-- plus_claim_is_true: a proof of plus_claim (Admitted in Original.v but computable)
axiom Original_LF__DOT__Logic_LF_Logic_plus__claim__is__true : Original_LF__DOT__Logic_LF_Logic_plus__claim

-- ============================================================
-- Maps definitions
-- ============================================================

-- total_map is a function from string to A
def Original_LF__DOT__Maps_LF_Maps_total__map (A : Type) : Type := Coqstring → A

-- t_empty creates a map that always returns v
def Original_LF__DOT__Maps_LF_Maps_t__empty {A : Type} (v : A) : Original_LF__DOT__Maps_LF_Maps_total__map A :=
  fun _ => v

-- example_empty = t_empty false
def Original_LF__DOT__Maps_LF_Maps_example__empty : Coqstring → Coqbool :=
  Original_LF__DOT__Maps_LF_Maps_t__empty Coqbool.false

-- ============================================================
-- Church numerals (cnat) and related
-- ============================================================

-- cnat type: forall X : Type, (X -> X) -> X -> X
-- NOTE: In Lean 4, this has type Type 1 due to universe rules
def Original_LF__DOT__Poly_LF_Poly_Exercises_cnat : Type 1 :=
  (X : Type) → (X → X) → X → X

-- doit3times: applies f three times
def Original_LF__DOT__Poly_LF_Poly_doit3times (X : Type) (f : X → X) (n : X) : X :=
  f (f (f n))

-- zero: cnat (applies f zero times)
def Original_LF__DOT__Poly_LF_Poly_Exercises_zero : Original_LF__DOT__Poly_LF_Poly_Exercises_cnat :=
  fun _ _ x => x

-- one: cnat (applies f once)
def Original_LF__DOT__Poly_LF_Poly_Exercises_one : Original_LF__DOT__Poly_LF_Poly_Exercises_cnat :=
  fun _ f x => f x

-- three: cnat := @doit3times
def Original_LF__DOT__Poly_LF_Poly_Exercises_three : Original_LF__DOT__Poly_LF_Poly_Exercises_cnat :=
  Original_LF__DOT__Poly_LF_Poly_doit3times

-- exp is Admitted in Original.v
axiom Original_LF__DOT__Poly_LF_Poly_Exercises_exp :
  Original_LF__DOT__Poly_LF_Poly_Exercises_cnat →
  Original_LF__DOT__Poly_LF_Poly_Exercises_cnat →
  Original_LF__DOT__Poly_LF_Poly_Exercises_cnat

-- exp_2 is Admitted in Original.v: exp three zero = one
axiom Original_LF__DOT__Poly_LF_Poly_Exercises_exp__2 :
  Corelib_Init_Logic_eq
    (Original_LF__DOT__Poly_LF_Poly_Exercises_exp Original_LF__DOT__Poly_LF_Poly_Exercises_three Original_LF__DOT__Poly_LF_Poly_Exercises_zero)
    Original_LF__DOT__Poly_LF_Poly_Exercises_one

-- ============================================================
-- Additional definitions
-- ============================================================

-- repeat'': repeat a value count times
def Original_LF__DOT__Poly_LF_Poly_repeat'' (X : Type) (x : X) : nat → Original_LF__DOT__Poly_LF_Poly_list X
  | nat.O => Original_LF__DOT__Poly_LF_Poly_list.nil
  | nat.S count' => Original_LF__DOT__Poly_LF_Poly_list.cons x (Original_LF__DOT__Poly_LF_Poly_repeat'' X x count')

-- fold: right fold over list
def Original_LF__DOT__Poly_LF_Poly_fold {X Y : Type} (f : X → Y → Y) : Original_LF__DOT__Poly_LF_Poly_list X → Y → Y
  | Original_LF__DOT__Poly_LF_Poly_list.nil, b => b
  | Original_LF__DOT__Poly_LF_Poly_list.cons h t, b => f h (Original_LF__DOT__Poly_LF_Poly_fold f t b)

-- scc: successor for church numerals (Admitted in Original.v)
axiom Original_LF__DOT__Poly_LF_Poly_Exercises_scc :
  Original_LF__DOT__Poly_LF_Poly_Exercises_cnat → Original_LF__DOT__Poly_LF_Poly_Exercises_cnat

-- scc_1: scc zero = one (Admitted in Original.v)
axiom Original_LF__DOT__Poly_LF_Poly_Exercises_scc__1 :
  Corelib_Init_Logic_eq
    (Original_LF__DOT__Poly_LF_Poly_Exercises_scc Original_LF__DOT__Poly_LF_Poly_Exercises_zero)
    Original_LF__DOT__Poly_LF_Poly_Exercises_one

-- fold_length: length computed via fold
def Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length {X : Type} (l : Original_LF__DOT__Poly_LF_Poly_list X) : nat :=
  Original_LF__DOT__Poly_LF_Poly_fold (fun _ n => nat.S n) l nat.O

-- test_fold_length1: fold_length [4;7;0] = 3 (Admitted in Original.v)
axiom Original_LF__DOT__Poly_LF_Poly_Exercises_test__fold__length1 :
  Corelib_Init_Logic_eq
    (Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length
      (Original_LF__DOT__Poly_LF_Poly_cons (S (S (S (S _0))))
        (Original_LF__DOT__Poly_LF_Poly_cons (S (S (S (S (S (S (S _0)))))))
          (Original_LF__DOT__Poly_LF_Poly_cons _0 (Original_LF__DOT__Poly_LF_Poly_nil nat)))))
    (S (S (S _0)))

-- fold_length_correct: fold_length l = length l (Admitted in Original.v)
axiom Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length__correct :
  ∀ (X : Type) (l : Original_LF__DOT__Poly_LF_Poly_list X),
    Corelib_Init_Logic_eq (Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length l) (Original_LF__DOT__Poly_LF_Poly_length l)

-- one_church_peano: one nat S O = 1 (Admitted in Original.v)
axiom Original_LF__DOT__Poly_LF_Poly_Exercises_one__church__peano :
  Corelib_Init_Logic_eq (Original_LF__DOT__Poly_LF_Poly_Exercises_one nat S _0) (S _0)

-- ============================================================
-- EvPlayground: ev inductive prop
-- ============================================================

-- ev: even natural numbers
inductive Original_LF__DOT__IndProp_LF_IndProp_ev__playground_ev : nat → Prop where
  | ev_0 : Original_LF__DOT__IndProp_LF_IndProp_ev__playground_ev nat.O
  | ev_SS : ∀ (n : nat), Original_LF__DOT__IndProp_LF_IndProp_ev__playground_ev n →
      Original_LF__DOT__IndProp_LF_IndProp_ev__playground_ev (nat.S (nat.S n))

-- evSS_ev': ev (S (S n)) -> ev n (Admitted in Original.v)
axiom Original_LF__DOT__IndProp_LF_IndProp_evSS__ev' :
  ∀ n, Original_LF__DOT__IndProp_LF_IndProp_ev__playground_ev (nat.S (nat.S n)) →
    Original_LF__DOT__IndProp_LF_IndProp_ev__playground_ev n

-- ============================================================
-- Tactics definitions
-- ============================================================

-- trans_eq is Admitted in Original.v
axiom Original_LF__DOT__Tactics_LF_Tactics_trans__eq :
  ∀ (X : Type) (n m o : X), Corelib_Init_Logic_eq n m → Corelib_Init_Logic_eq m o → Corelib_Init_Logic_eq n o

-- injection_ex1: [n;m] = [o;o] -> n = m (Admitted in Original.v)
axiom Original_LF__DOT__Tactics_LF_Tactics_injection__ex1 :
  ∀ (n m o : nat),
    Corelib_Init_Logic_eq
      (Original_LF__DOT__Poly_LF_Poly_cons n (Original_LF__DOT__Poly_LF_Poly_cons m (Original_LF__DOT__Poly_LF_Poly_nil nat)))
      (Original_LF__DOT__Poly_LF_Poly_cons o (Original_LF__DOT__Poly_LF_Poly_cons o (Original_LF__DOT__Poly_LF_Poly_nil nat))) →
    Corelib_Init_Logic_eq n m

-- injection_ex3 (Admitted in Original.v)
axiom Original_LF__DOT__Tactics_LF_Tactics_injection__ex3 :
  ∀ (X : Type) (x y z : X) (l j : Original_LF__DOT__Poly_LF_Poly_list X),
    Corelib_Init_Logic_eq
      (Original_LF__DOT__Poly_LF_Poly_cons x (Original_LF__DOT__Poly_LF_Poly_cons y l))
      (Original_LF__DOT__Poly_LF_Poly_cons z j) →
    Corelib_Init_Logic_eq j (Original_LF__DOT__Poly_LF_Poly_cons z l) →
    Corelib_Init_Logic_eq x y

-- ============================================================
-- Imp.AExp definitions
-- ============================================================

-- silly1: forall P : Prop, P -> P (identity function)
def Original_LF__DOT__Imp_LF_Imp_AExp_silly1 (P : Prop) (p : P) : P := p
