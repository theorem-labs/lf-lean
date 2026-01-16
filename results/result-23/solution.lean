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

inductive Corelib_Init_Logic_eq {A : Type} : A → A → Prop where
  | refl (a : A) : Corelib_Init_Logic_eq a a

inductive Corelib_Init_Logic_eq_Prop {A : Prop} : A → A → Prop where
  | refl (a : A) : Corelib_Init_Logic_eq_Prop a a

-- ============================================================
-- Existential and Iff
-- ============================================================

inductive ex {A : Type} (P : A → Prop) : Prop where
  | intro : ∀ x : A, P x → ex P

def ex_intro {A : Type} {P : A → Prop} (x : A) (h : P x) : ex P := ex.intro x h

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
-- Variable names for IMP
-- ============================================================

def char_X : Ascii_ascii := Ascii_ascii.Ascii mybool.myfalse mybool.myfalse mybool.myfalse 
  mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse

def char_Y : Ascii_ascii := Ascii_ascii.Ascii mybool.mytrue mybool.myfalse mybool.myfalse 
  mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse

def char_Z : Ascii_ascii := Ascii_ascii.Ascii mybool.myfalse mybool.mytrue mybool.myfalse 
  mybool.mytrue mybool.mytrue mybool.mytrue mybool.mytrue mybool.myfalse

def Original_LF__DOT__Imp_LF_Imp_X : String_string := String_string.String char_X String_string.EmptyString
def Original_LF__DOT__Imp_LF_Imp_Y : String_string := String_string.String char_Y String_string.EmptyString
def Original_LF__DOT__Imp_LF_Imp_Z : String_string := String_string.String char_Z String_string.EmptyString

-- ============================================================
-- Maps
-- ============================================================

def Original_LF__DOT__Maps_LF_Maps_total__map (A : Type) : Type := String_string → A

def Original_LF__DOT__Maps_LF_Maps_t__empty {A : Type} (v : A) : Original_LF__DOT__Maps_LF_Maps_total__map A :=
  fun _ => v

def Original_LF__DOT__Maps_LF_Maps_t__update {A : Type} 
    (m : Original_LF__DOT__Maps_LF_Maps_total__map A) (x : String_string) (v : A) 
    : Original_LF__DOT__Maps_LF_Maps_total__map A :=
  fun x' => match String_eqb x x' with
    | mybool.mytrue => v
    | mybool.myfalse => m x'

-- ============================================================
-- IMP: State
-- ============================================================

def Original_LF__DOT__Imp_LF_Imp_state : Type := Original_LF__DOT__Maps_LF_Maps_total__map nat

def Original_LF__DOT__Imp_LF_Imp_empty__st : Original_LF__DOT__Imp_LF_Imp_state := 
  Original_LF__DOT__Maps_LF_Maps_t__empty nat.O

-- ============================================================
-- IMP: Expressions
-- ============================================================

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

-- ============================================================
-- IMP: Commands
-- ============================================================

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
-- IMP: Evaluation functions
-- ============================================================

def Original_LF__DOT__Imp_LF_Imp_aeval (st : Original_LF__DOT__Imp_LF_Imp_state) : Original_LF__DOT__Imp_LF_Imp_aexp → nat
  | Original_LF__DOT__Imp_LF_Imp_aexp.ANum n => n
  | Original_LF__DOT__Imp_LF_Imp_aexp.AId x => st x
  | Original_LF__DOT__Imp_LF_Imp_aexp.APlus a1 a2 => nat_add (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2)
  | Original_LF__DOT__Imp_LF_Imp_aexp.AMinus a1 a2 => nat_sub (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2)
  | Original_LF__DOT__Imp_LF_Imp_aexp.AMult a1 a2 => nat_mul (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2)

def Original_LF__DOT__Imp_LF_Imp_beval (st : Original_LF__DOT__Imp_LF_Imp_state) : Original_LF__DOT__Imp_LF_Imp_bexp → mybool
  | Original_LF__DOT__Imp_LF_Imp_bexp.BTrue => mybool.mytrue
  | Original_LF__DOT__Imp_LF_Imp_bexp.BFalse => mybool.myfalse
  | Original_LF__DOT__Imp_LF_Imp_bexp.BEq a1 a2 => nat_eqb (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2)
  | Original_LF__DOT__Imp_LF_Imp_bexp.BNeq a1 a2 => bool_negb (nat_eqb (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2))
  | Original_LF__DOT__Imp_LF_Imp_bexp.BLe a1 a2 => nat_leb (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2)
  | Original_LF__DOT__Imp_LF_Imp_bexp.BGt a1 a2 => bool_negb (nat_leb (Original_LF__DOT__Imp_LF_Imp_aeval st a1) (Original_LF__DOT__Imp_LF_Imp_aeval st a2))
  | Original_LF__DOT__Imp_LF_Imp_bexp.BNot b1 => bool_negb (Original_LF__DOT__Imp_LF_Imp_beval st b1)
  | Original_LF__DOT__Imp_LF_Imp_bexp.BAnd b1 b2 => bool_andb (Original_LF__DOT__Imp_LF_Imp_beval st b1) (Original_LF__DOT__Imp_LF_Imp_beval st b2)

-- ============================================================
-- IMP: ceval (big-step semantics)
-- ============================================================

inductive Original_LF__DOT__Imp_LF_Imp_ceval : Original_LF__DOT__Imp_LF_Imp_com → Original_LF__DOT__Imp_LF_Imp_state → Original_LF__DOT__Imp_LF_Imp_state → Prop where
  | E_Skip (st : Original_LF__DOT__Imp_LF_Imp_state) :
      Original_LF__DOT__Imp_LF_Imp_ceval Original_LF__DOT__Imp_LF_Imp_com.CSkip st st
  | E_Asgn (st : Original_LF__DOT__Imp_LF_Imp_state) (a : Original_LF__DOT__Imp_LF_Imp_aexp) (n : nat) (x : String_string) :
      Corelib_Init_Logic_eq (Original_LF__DOT__Imp_LF_Imp_aeval st a) n →
      Original_LF__DOT__Imp_LF_Imp_ceval (Original_LF__DOT__Imp_LF_Imp_com.CAsgn x a) st (Original_LF__DOT__Maps_LF_Maps_t__update st x n)
  | E_Seq (c1 c2 : Original_LF__DOT__Imp_LF_Imp_com) (st st' st'' : Original_LF__DOT__Imp_LF_Imp_state) :
      Original_LF__DOT__Imp_LF_Imp_ceval c1 st st' →
      Original_LF__DOT__Imp_LF_Imp_ceval c2 st' st'' →
      Original_LF__DOT__Imp_LF_Imp_ceval (Original_LF__DOT__Imp_LF_Imp_com.CSeq c1 c2) st st''
  | E_IfTrue (st st' : Original_LF__DOT__Imp_LF_Imp_state) (b : Original_LF__DOT__Imp_LF_Imp_bexp) (c1 c2 : Original_LF__DOT__Imp_LF_Imp_com) :
      Corelib_Init_Logic_eq (Original_LF__DOT__Imp_LF_Imp_beval st b) mybool.mytrue →
      Original_LF__DOT__Imp_LF_Imp_ceval c1 st st' →
      Original_LF__DOT__Imp_LF_Imp_ceval (Original_LF__DOT__Imp_LF_Imp_com.CIf b c1 c2) st st'
  | E_IfFalse (st st' : Original_LF__DOT__Imp_LF_Imp_state) (b : Original_LF__DOT__Imp_LF_Imp_bexp) (c1 c2 : Original_LF__DOT__Imp_LF_Imp_com) :
      Corelib_Init_Logic_eq (Original_LF__DOT__Imp_LF_Imp_beval st b) mybool.myfalse →
      Original_LF__DOT__Imp_LF_Imp_ceval c2 st st' →
      Original_LF__DOT__Imp_LF_Imp_ceval (Original_LF__DOT__Imp_LF_Imp_com.CIf b c1 c2) st st'
  | E_WhileFalse (b : Original_LF__DOT__Imp_LF_Imp_bexp) (st : Original_LF__DOT__Imp_LF_Imp_state) (c : Original_LF__DOT__Imp_LF_Imp_com) :
      Corelib_Init_Logic_eq (Original_LF__DOT__Imp_LF_Imp_beval st b) mybool.myfalse →
      Original_LF__DOT__Imp_LF_Imp_ceval (Original_LF__DOT__Imp_LF_Imp_com.CWhile b c) st st
  | E_WhileTrue (st st' st'' : Original_LF__DOT__Imp_LF_Imp_state) (b : Original_LF__DOT__Imp_LF_Imp_bexp) (c : Original_LF__DOT__Imp_LF_Imp_com) :
      Corelib_Init_Logic_eq (Original_LF__DOT__Imp_LF_Imp_beval st b) mybool.mytrue →
      Original_LF__DOT__Imp_LF_Imp_ceval c st st' →
      Original_LF__DOT__Imp_LF_Imp_ceval (Original_LF__DOT__Imp_LF_Imp_com.CWhile b c) st' st'' →
      Original_LF__DOT__Imp_LF_Imp_ceval (Original_LF__DOT__Imp_LF_Imp_com.CWhile b c) st st''

-- ============================================================
-- IMP: ceval_step (step-indexed evaluation)
-- ============================================================

def Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step 
    (st : Original_LF__DOT__Imp_LF_Imp_state) 
    (c : Original_LF__DOT__Imp_LF_Imp_com) 
    (i : nat) : option Original_LF__DOT__Imp_LF_Imp_state :=
  match i with
  | nat.O => option.None
  | nat.S i' =>
    match c with
    | Original_LF__DOT__Imp_LF_Imp_com.CSkip => 
        option.Some st
    | Original_LF__DOT__Imp_LF_Imp_com.CAsgn x a => 
        option.Some (Original_LF__DOT__Maps_LF_Maps_t__update st x (Original_LF__DOT__Imp_LF_Imp_aeval st a))
    | Original_LF__DOT__Imp_LF_Imp_com.CSeq c1 c2 =>
        match Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step st c1 i' with
        | option.Some st' => Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step st' c2 i'
        | option.None => option.None
    | Original_LF__DOT__Imp_LF_Imp_com.CIf b c1 c2 =>
        match Original_LF__DOT__Imp_LF_Imp_beval st b with
        | mybool.mytrue => Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step st c1 i'
        | mybool.myfalse => Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step st c2 i'
    | Original_LF__DOT__Imp_LF_Imp_com.CWhile b c1 =>
        match Original_LF__DOT__Imp_LF_Imp_beval st b with
        | mybool.mytrue =>
            match Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step st c1 i' with
            | option.Some st' => Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step st' c i'
            | option.None => option.None
        | mybool.myfalse => option.Some st

-- List.In predicate  
def List_In {A : Type} (a : A) : list A → Prop
  | list.nil => FalseType
  | list.cons x xs => or (Corelib_Init_Logic_eq x a) (List_In a xs)

-- ceval__ceval_step axiom (Admitted in Original)
axiom Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval____ceval__step :
  ∀ (c : Original_LF__DOT__Imp_LF_Imp_com) 
    (st st' : Original_LF__DOT__Imp_LF_Imp_state),
  Original_LF__DOT__Imp_LF_Imp_ceval c st st' →
  ex (fun i : nat => Corelib_Init_Logic_eq (Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step st c i) (option.Some st'))

-- ceval_and_ceval_step_coincide (Admitted in Original.v)
axiom Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__and__ceval__step__coincide :
  ∀ (c : Original_LF__DOT__Imp_LF_Imp_com) 
    (st st' : Original_LF__DOT__Imp_LF_Imp_state),
  iff (Original_LF__DOT__Imp_LF_Imp_ceval c st st')
      (ex (fun i : nat => Corelib_Init_Logic_eq (Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step st c i) (option.Some st')))

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

-- doit3times
def Original_LF__DOT__Poly_LF_Poly_doit3times (X : Type) (f : X → X) (n : X) : X :=
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
  Original_LF__DOT__Poly_LF_Poly_doit3times

-- plus axiom (Admitted in Original)
axiom Original_LF__DOT__Poly_LF_Poly_Exercises_plus : 
  Original_LF__DOT__Poly_LF_Poly_Exercises_cnat → 
  Original_LF__DOT__Poly_LF_Poly_Exercises_cnat → 
  Original_LF__DOT__Poly_LF_Poly_Exercises_cnat

-- Equality for Type 1
inductive Corelib_Init_Logic_eq_Type1 {A : Type 1} : A → A → Prop where
  | refl (a : A) : Corelib_Init_Logic_eq_Type1 a a

-- plus_3 axiom (Admitted in Original)
axiom Original_LF__DOT__Poly_LF_Poly_Exercises_plus__3 : 
  @Corelib_Init_Logic_eq_Type1 
    Original_LF__DOT__Poly_LF_Poly_Exercises_cnat
    (Original_LF__DOT__Poly_LF_Poly_Exercises_plus 
      Original_LF__DOT__Poly_LF_Poly_Exercises_one 
      Original_LF__DOT__Poly_LF_Poly_Exercises_two)
    Original_LF__DOT__Poly_LF_Poly_Exercises_three

-- ============================================================
-- LF.Logic definitions  
-- ============================================================

-- In predicate for Original.LF_DOT_Poly list
def Original_LF__DOT__Logic_LF_Logic_In {X : Type} (x : X) : Original_LF__DOT__Poly_LF_Poly_list X → Prop
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
-- LF.Rel definitions
-- ============================================================

def Original_LF_Rel_relation (X : Type) : Type := X → X → Prop

def Original_LF_Rel_partial__function {X : Type} (R : Original_LF_Rel_relation X) : Prop :=
  ∀ (x y1 y2 : X), R x y1 → R x y2 → Corelib_Init_Logic_eq y1 y2

-- le inductive (Peano style)
inductive Original_LF__DOT__IndProp_LF_IndProp_le : nat → nat → Prop where
  | le_n (n : nat) : Original_LF__DOT__IndProp_LF_IndProp_le n n
  | le_S (n m : nat) (H : Original_LF__DOT__IndProp_LF_IndProp_le n m) : Original_LF__DOT__IndProp_LF_IndProp_le n (nat.S m)

-- le_not_a_partial_function is Admitted in Original.v
axiom Original_LF_Rel_le__not__a__partial__function :
  Original_LF_Rel_partial__function Original_LF__DOT__IndProp_LF_IndProp_le → FalseType

-- ============================================================
-- LF.IndProp more definitions (pal, rev, repeats, etc.)
-- ============================================================

-- List rev
def Original_LF__DOT__Poly_LF_Poly_rev (X : Type) : Original_LF__DOT__Poly_LF_Poly_list X → Original_LF__DOT__Poly_LF_Poly_list X
  | Original_LF__DOT__Poly_LF_Poly_list.nil => Original_LF__DOT__Poly_LF_Poly_list.nil
  | Original_LF__DOT__Poly_LF_Poly_list.cons h t => 
      Original_LF__DOT__Poly_LF_Poly_app X (Original_LF__DOT__Poly_LF_Poly_rev X t) (Original_LF__DOT__Poly_LF_Poly_list.cons h Original_LF__DOT__Poly_LF_Poly_list.nil)

-- pal (palindrome predicate) - no constructors in the original
inductive Original_LF__DOT__IndProp_LF_IndProp_pal (X : Type) : Original_LF__DOT__Poly_LF_Poly_list X → Prop where

-- pal_app_rev is Admitted in Original.v
axiom Original_LF__DOT__IndProp_LF_IndProp_pal__app__rev : ∀ (X : Type) (l : Original_LF__DOT__Poly_LF_Poly_list X),
  Original_LF__DOT__IndProp_LF_IndProp_pal X (Original_LF__DOT__Poly_LF_Poly_app X l (Original_LF__DOT__Poly_LF_Poly_rev X l))

-- Length of list
def Original_LF__DOT__Poly_LF_Poly_length (X : Type) : Original_LF__DOT__Poly_LF_Poly_list X → nat
  | Original_LF__DOT__Poly_LF_Poly_list.nil => nat.O
  | Original_LF__DOT__Poly_LF_Poly_list.cons _ t => nat.S (Original_LF__DOT__Poly_LF_Poly_length X t)

-- lt (Peano less-than) based on le
def lt (n m : nat) : Prop := Original_LF__DOT__IndProp_LF_IndProp_le (nat.S n) m

-- repeats predicate (no constructors in original)
inductive Original_LF__DOT__IndProp_LF_IndProp_repeats (X : Type) : Original_LF__DOT__Poly_LF_Poly_list X → Prop where

-- excluded_middle definition
def Original_LF__DOT__Logic_LF_Logic_excluded__middle : Prop := ∀ P : Prop, or P (Logic_not P)

-- pigeonhole_principle is Admitted in Original.v
axiom Original_LF__DOT__IndProp_LF_IndProp_pigeonhole__principle :
  Original_LF__DOT__Logic_LF_Logic_excluded__middle →
  ∀ (X : Type) (l1 l2 : Original_LF__DOT__Poly_LF_Poly_list X),
    (∀ x : X, Original_LF__DOT__Logic_LF_Logic_In x l1 → Original_LF__DOT__Logic_LF_Logic_In x l2) →
    lt (Original_LF__DOT__Poly_LF_Poly_length X l2) (Original_LF__DOT__Poly_LF_Poly_length X l1) →
    Original_LF__DOT__IndProp_LF_IndProp_repeats X l1

-- ============================================================
-- LF.Tactics discriminate_ex3
-- ============================================================

-- discriminate_ex3 is Admitted in Original.v
axiom Original_LF__DOT__Tactics_LF_Tactics_discriminate__ex3 :
  ∀ (X : Type) (x y z : X) (l j : Original_LF__DOT__Poly_LF_Poly_list X),
    Corelib_Init_Logic_eq (Original_LF__DOT__Poly_LF_Poly_list.cons x (Original_LF__DOT__Poly_LF_Poly_list.cons y l)) (Original_LF__DOT__Poly_LF_Poly_list.nil) →
    Corelib_Init_Logic_eq x z

-- ============================================================
-- LF.Basics letter_comparison definitions  
-- ============================================================

-- letter_comparison function (takes 2 letters)
def Original_LF__DOT__Basics_LF_Basics_letter__comparison : Original_LF__DOT__Basics_LF_Basics_letter → Original_LF__DOT__Basics_LF_Basics_letter → Original_LF__DOT__Basics_LF_Basics_comparison
  | Original_LF__DOT__Basics_LF_Basics_letter.A, Original_LF__DOT__Basics_LF_Basics_letter.A => Original_LF__DOT__Basics_LF_Basics_comparison.Eq
  | Original_LF__DOT__Basics_LF_Basics_letter.A, _ => Original_LF__DOT__Basics_LF_Basics_comparison.Gt
  | Original_LF__DOT__Basics_LF_Basics_letter.B, Original_LF__DOT__Basics_LF_Basics_letter.A => Original_LF__DOT__Basics_LF_Basics_comparison.Lt
  | Original_LF__DOT__Basics_LF_Basics_letter.B, Original_LF__DOT__Basics_LF_Basics_letter.B => Original_LF__DOT__Basics_LF_Basics_comparison.Eq
  | Original_LF__DOT__Basics_LF_Basics_letter.B, _ => Original_LF__DOT__Basics_LF_Basics_comparison.Gt
  | Original_LF__DOT__Basics_LF_Basics_letter.C, Original_LF__DOT__Basics_LF_Basics_letter.A => Original_LF__DOT__Basics_LF_Basics_comparison.Lt
  | Original_LF__DOT__Basics_LF_Basics_letter.C, Original_LF__DOT__Basics_LF_Basics_letter.B => Original_LF__DOT__Basics_LF_Basics_comparison.Lt
  | Original_LF__DOT__Basics_LF_Basics_letter.C, Original_LF__DOT__Basics_LF_Basics_letter.C => Original_LF__DOT__Basics_LF_Basics_comparison.Eq
  | Original_LF__DOT__Basics_LF_Basics_letter.C, _ => Original_LF__DOT__Basics_LF_Basics_comparison.Gt
  | Original_LF__DOT__Basics_LF_Basics_letter.D, Original_LF__DOT__Basics_LF_Basics_letter.A => Original_LF__DOT__Basics_LF_Basics_comparison.Lt
  | Original_LF__DOT__Basics_LF_Basics_letter.D, Original_LF__DOT__Basics_LF_Basics_letter.B => Original_LF__DOT__Basics_LF_Basics_comparison.Lt
  | Original_LF__DOT__Basics_LF_Basics_letter.D, Original_LF__DOT__Basics_LF_Basics_letter.C => Original_LF__DOT__Basics_LF_Basics_comparison.Lt
  | Original_LF__DOT__Basics_LF_Basics_letter.D, Original_LF__DOT__Basics_LF_Basics_letter.D => Original_LF__DOT__Basics_LF_Basics_comparison.Eq
  | Original_LF__DOT__Basics_LF_Basics_letter.D, _ => Original_LF__DOT__Basics_LF_Basics_comparison.Gt
  | Original_LF__DOT__Basics_LF_Basics_letter.F, Original_LF__DOT__Basics_LF_Basics_letter.A => Original_LF__DOT__Basics_LF_Basics_comparison.Lt
  | Original_LF__DOT__Basics_LF_Basics_letter.F, Original_LF__DOT__Basics_LF_Basics_letter.B => Original_LF__DOT__Basics_LF_Basics_comparison.Lt
  | Original_LF__DOT__Basics_LF_Basics_letter.F, Original_LF__DOT__Basics_LF_Basics_letter.C => Original_LF__DOT__Basics_LF_Basics_comparison.Lt
  | Original_LF__DOT__Basics_LF_Basics_letter.F, Original_LF__DOT__Basics_LF_Basics_letter.D => Original_LF__DOT__Basics_LF_Basics_comparison.Lt
  | Original_LF__DOT__Basics_LF_Basics_letter.F, Original_LF__DOT__Basics_LF_Basics_letter.F => Original_LF__DOT__Basics_LF_Basics_comparison.Eq

-- letter_comparison_Eq theorem (Admitted in Original.v): forall l, letter_comparison l l = Eq
axiom Original_LF__DOT__Basics_LF_Basics_letter__comparison__Eq :
  ∀ (l : Original_LF__DOT__Basics_LF_Basics_letter),
    Corelib_Init_Logic_eq (Original_LF__DOT__Basics_LF_Basics_letter__comparison l l) Original_LF__DOT__Basics_LF_Basics_comparison.Eq

-- ============================================================
-- Relation closures (from LF.Rel)
-- ============================================================

-- clos_refl_trans: reflexive transitive closure
inductive Original_LF_Rel_clos__refl__trans {X : Type} (R : X → X → Prop) : X → X → Prop where
  | rt_step (x y : X) : R x y → Original_LF_Rel_clos__refl__trans R x y
  | rt_refl (x : X) : Original_LF_Rel_clos__refl__trans R x x
  | rt_trans (x y z : X) : Original_LF_Rel_clos__refl__trans R x y → Original_LF_Rel_clos__refl__trans R y z → Original_LF_Rel_clos__refl__trans R x z

def Original_LF_Rel_clos__refl__trans_rt_step := @Original_LF_Rel_clos__refl__trans.rt_step
def Original_LF_Rel_clos__refl__trans_rt_refl := @Original_LF_Rel_clos__refl__trans.rt_refl
def Original_LF_Rel_clos__refl__trans_rt_trans := @Original_LF_Rel_clos__refl__trans.rt_trans

-- clos_refl_trans_1n: alternative 1-n formulation
-- Note: x needs to be an index (after colon) so we can change it in recursive calls
inductive Original_LF_Rel_clos__refl__trans__1n {A : Type} (R : A → A → Prop) : A → A → Prop where
  | rt1n_refl (x : A) : Original_LF_Rel_clos__refl__trans__1n R x x
  | rt1n_trans (x y z : A) : R x y → Original_LF_Rel_clos__refl__trans__1n R y z → Original_LF_Rel_clos__refl__trans__1n R x z

def Original_LF_Rel_clos__refl__trans__1n_rt1n_refl := @Original_LF_Rel_clos__refl__trans__1n.rt1n_refl
def Original_LF_Rel_clos__refl__trans__1n_rt1n_trans := @Original_LF_Rel_clos__refl__trans__1n.rt1n_trans

-- rtc_rsc_coincide: the two are equivalent (Admitted in Original.v)
axiom Original_LF_Rel_rtc__rsc__coincide : ∀ (X : Type) (R : Original_LF_Rel_relation X) (x y : X),
  iff (Original_LF_Rel_clos__refl__trans R x y) (Original_LF_Rel_clos__refl__trans__1n R x y)

-- antisymmetric relation
def Original_LF_Rel_antisymmetric {X : Type} (R : Original_LF_Rel_relation X) : Prop :=
  ∀ a b : X, R a b → R b a → Corelib_Init_Logic_eq a b

-- empty_relation: an inductive with no constructors
inductive Original_LF_Rel_empty__relation : nat → nat → Prop where

-- empty_relation_partial_function (Admitted)
axiom Original_LF_Rel_empty__relation__partial__function : Original_LF_Rel_partial__function Original_LF_Rel_empty__relation

-- reflexive relation
def Original_LF_Rel_reflexive {X : Type} (R : Original_LF_Rel_relation X) : Prop :=
  ∀ a : X, R a a

-- symmetric relation  
def Original_LF_Rel_symmetric {X : Type} (R : Original_LF_Rel_relation X) : Prop :=
  ∀ a b : X, R a b → R b a

-- transitive relation
def Original_LF_Rel_transitive {X : Type} (R : Original_LF_Rel_relation X) : Prop :=
  ∀ a b c : X, R a b → R b c → R a c

-- equivalence relation
def Original_LF_Rel_equivalence {X : Type} (R : Original_LF_Rel_relation X) : Prop :=
  Original_LF_Rel_reflexive R ∧ Original_LF_Rel_symmetric R ∧ Original_LF_Rel_transitive R

-- order relation
def Original_LF_Rel_order {X : Type} (R : Original_LF_Rel_relation X) : Prop :=
  Original_LF_Rel_reflexive R ∧ Original_LF_Rel_antisymmetric R ∧ Original_LF_Rel_transitive R

-- preorder relation
def Original_LF_Rel_preorder {X : Type} (R : Original_LF_Rel_relation X) : Prop :=
  Original_LF_Rel_reflexive R ∧ Original_LF_Rel_transitive R

-- le (less than or equal for nat)
inductive le : nat → nat → Prop where
  | le_n (n : nat) : le n n
  | le_S (n m : nat) : le n m → le n (nat.S m)

def le_le_n := @le.le_n
def le_le_S := @le.le_S

-- ============================================================
-- subseq (from LF.IndProp) - empty definition
-- ============================================================

inductive Original_LF__DOT__IndProp_LF_IndProp_subseq : Original_LF__DOT__Poly_LF_Poly_list nat → Original_LF__DOT__Poly_LF_Poly_list nat → Prop where

-- subseq_refl (Admitted in Original.v)
axiom Original_LF__DOT__IndProp_LF_IndProp_subseq__refl : ∀ (l : Original_LF__DOT__Poly_LF_Poly_list nat), Original_LF__DOT__IndProp_LF_IndProp_subseq l l

-- subseq_app (Admitted in Original.v)
axiom Original_LF__DOT__IndProp_LF_IndProp_subseq__app : ∀ (l1 l2 l3 : Original_LF__DOT__Poly_LF_Poly_list nat),
  Original_LF__DOT__IndProp_LF_IndProp_subseq l1 l2 →
  Original_LF__DOT__IndProp_LF_IndProp_subseq l1 (Original_LF__DOT__Poly_LF_Poly_app nat l2 l3)

-- ============================================================
-- napp (from LF.IndProp.Pumping)
-- ============================================================

def Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp (T : Type) : nat → Original_LF__DOT__Poly_LF_Poly_list T → Original_LF__DOT__Poly_LF_Poly_list T
  | nat.O, _ => Original_LF__DOT__Poly_LF_Poly_list.nil
  | nat.S n, l => Original_LF__DOT__Poly_LF_Poly_app T l (Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp T n l)

-- napp_plus (Admitted in Original.v)
axiom Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp__plus : ∀ (T : Type) (n m : nat) (l : Original_LF__DOT__Poly_LF_Poly_list T),
  Corelib_Init_Logic_eq (Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp T (nat_add n m) l) 
    (Original_LF__DOT__Poly_LF_Poly_app T (Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp T n l) (Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp T m l))

-- ============================================================
-- AltAuto definitions (Admitted theorems)
-- ============================================================

-- app_length' : forall X l1 l2, length (l1 ++ l2) = length l1 + length l2
axiom Original_LF__DOT__AltAuto_LF_AltAuto_app__length' : ∀ (X : Type) (l1 l2 : Original_LF__DOT__Poly_LF_Poly_list X),
  Corelib_Init_Logic_eq (Original_LF__DOT__Poly_LF_Poly_length X (Original_LF__DOT__Poly_LF_Poly_app X l1 l2))
    (nat_add (Original_LF__DOT__Poly_LF_Poly_length X l1) (Original_LF__DOT__Poly_LF_Poly_length X l2))

-- imp1 : forall P : Prop, P -> P (Admitted)
axiom Original_LF__DOT__AltAuto_LF_AltAuto_imp1 : ∀ (P : Prop), P → P

-- hyp_name : forall P : Prop, P -> P (Admitted)
axiom Original_LF__DOT__AltAuto_LF_AltAuto_hyp__name : ∀ (P : Prop), P → P

-- ============================================================
-- Logic definitions (Admitted theorems)
-- ============================================================

-- add_comm3_take3 (Admitted in Original.v): forall x y z, x + (y + z) = (z + y) + x
axiom Original_LF__DOT__Logic_LF_Logic_add__comm3__take3 : ∀ (x y z : nat),
  Corelib_Init_Logic_eq (nat_add x (nat_add y z)) (nat_add (nat_add z y) x)

-- ============================================================
-- Tactics definitions (Admitted theorems)
-- ============================================================

-- rev_exercise1 : forall l l' : list nat, l = rev l' -> l' = rev l
axiom Original_LF__DOT__Tactics_LF_Tactics_rev__exercise1 : ∀ (l l' : Original_LF__DOT__Poly_LF_Poly_list nat),
  Corelib_Init_Logic_eq l (Original_LF__DOT__Poly_LF_Poly_rev nat l') →
  Corelib_Init_Logic_eq l' (Original_LF__DOT__Poly_LF_Poly_rev nat l)

-- ============================================================
-- IndProp definitions (Admitted theorems)
-- ============================================================

-- pal_rev : forall X l, pal l -> l = rev l
axiom Original_LF__DOT__IndProp_LF_IndProp_pal__rev : ∀ (X : Type) (l : Original_LF__DOT__Poly_LF_Poly_list X),
  Original_LF__DOT__IndProp_LF_IndProp_pal X l →
  Corelib_Init_Logic_eq l (Original_LF__DOT__Poly_LF_Poly_rev X l)

-- ============================================================
-- Poly definitions (constants)
-- ============================================================

-- list123'' : [1;2;3]
def Original_LF__DOT__Poly_LF_Poly_list123'' : Original_LF__DOT__Poly_LF_Poly_list nat :=
  Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S nat.O) 
    (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S nat.O))
      (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S nat.O)))
        Original_LF__DOT__Poly_LF_Poly_list.nil))

-- list123''' : [1;2;3]
def Original_LF__DOT__Poly_LF_Poly_list123''' : Original_LF__DOT__Poly_LF_Poly_list nat :=
  Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S nat.O) 
    (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S nat.O))
      (Original_LF__DOT__Poly_LF_Poly_list.cons (nat.S (nat.S (nat.S nat.O)))
        Original_LF__DOT__Poly_LF_Poly_list.nil))
