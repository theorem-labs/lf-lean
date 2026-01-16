From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_proofU_objects__U2_lf__U_proofU_objects__ev__iso.

(* ev_plus2'' is in SProp as required by the Interface *)
Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__plus2'' : SProp := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__plus2''.

(* Original.ev_plus2'' = forall n, ev n -> ev (n + 2) : Prop *)
(* Imported.ev_plus2'' = forall n, ev n -> ev (nat_add n 2) : SProp *)

(* For Iso between Prop and SProp:
   - to: Prop -> SProp (possible)
   - from: SProp -> Prop (not directly possible - SProp can't eliminate to Prop)
   - roundtrips: both in SProp, so trivially satisfied
   
   Since SProp cannot be eliminated to Prop, we must use Admitted for the full iso,
   unless we can find a workaround.
   
   Actually, for an Iso A B where B is SProp, we need:
   - to: A -> B
   - from: B -> A  (B is SProp, A is Prop - problematic)
   - to_from: forall b, eq (to (from b)) b  (eq in SProp, trivial)
   - from_to: forall a, eq (from (to a)) a  (eq in SProp, trivial)
   
   The key issue is that "from: SProp -> Prop" can't use its argument.
   So "from" must be a constant function that produces a proof of ev_plus2''.
   
   But we CAN provide such a proof directly since ev_plus2'' is provable! *)

(* Prove Original.ev_plus2'' *)
Lemma ev_plus2_proof : Original.LF_DOT_ProofObjects.LF.ProofObjects.ev_plus2''.
Proof.
  unfold Original.LF_DOT_ProofObjects.LF.ProofObjects.ev_plus2''.
  intros n Hev.
  (* Need to show ev (n + 2) *)
  (* n + 2 = n + S (S 0) which reduces based on how + is defined *)
  (* In Coq, n + m = match n with O => m | S n' => S (n' + m) end *)
  (* So n + 2 does NOT reduce to S (S n), but rather requires induction on n *)
  (* However, we can use a simpler approach: ev (n + 2) when ev n *)
  induction Hev as [|n' Hev' IH].
  - (* n = 0: need ev (0 + 2) = ev 2 *)
    simpl. apply Original.LF_DOT_ProofObjects.LF.ProofObjects.ev_SS.
    apply Original.LF_DOT_ProofObjects.LF.ProofObjects.ev_0.
  - (* n = S (S n'): need ev (S (S n') + 2) = ev (S (S (n' + 2))) *)
    simpl. apply Original.LF_DOT_ProofObjects.LF.ProofObjects.ev_SS.
    exact IH.
Qed.

Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__plus2''_iso : Iso Original.LF_DOT_ProofObjects.LF.ProofObjects.ev_plus2'' imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__plus2''.
Proof.
  unfold Original.LF_DOT_ProofObjects.LF.ProofObjects.ev_plus2''.
  unfold imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__plus2''.
  unfold Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__plus2''.
  unshelve eapply Build_Iso.
  - (* to: (forall n, ev n -> ev (n+2)) -> SProp version *)
    intro H_prop.
    (* Need to produce: forall n, Imported.ev n -> Imported.ev (nat_add n 2) *)
    intro n_lean.
    intro H_ev_sprop.
    (* We have H_ev_sprop : Imported.ev n_lean (SProp)
       We need: Imported.ev (nat_add n_lean 2) (SProp)
       where nat_add n_lean 2 = nat_add n_lean (nat_S (nat_S nat_O))
       
       We need ev_SS applied to get ev (S (S n)) from ev n.
       nat_add n 2 is NOT S (S n), it's the result of Lean's add function.
       
       Let's use ev_SS directly: ev_SS n H gives ev (S (S n)).
       So we need to show that nat_add n_lean 2 equals nat_S (nat_S n_lean).
       
       Actually for Lean's Nat.add, n + 2 computes to... let's check.
       In Lean, (n + 2) is (n + succ (succ zero)), and + is defined as
       match on second arg: a + 0 = a, a + succ b = succ (a + b)
       So n + 2 = n + succ (succ 0) = succ (n + succ 0) = succ (succ (n + 0)) = succ (succ n)
       
       So nat_add n_lean (nat_S (nat_S nat_O)) should reduce to nat_S (nat_S n_lean)!
       Let's try using ev_SS directly. *)
    exact (Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_ev_ev_SS n_lean H_ev_sprop).
  - (* from: SProp version -> Prop version *)
    intro H_sprop.
    (* H_sprop is SProp, we can't use it. But we can return a constant proof. *)
    exact ev_plus2_proof.
  - (* to_from: eq in SProp - trivial since all SProp inhabitants are equal *)
    intro H. apply IsomorphismDefinitions.eq_refl.
  - (* from_to: eq in SProp *)
    (* The goal is: eq (from (to H)) H where from returns ev_plus2_proof
       and H is some proof of ev_plus2''.
       Since eq lives in SProp, and from (to H) and H have the same type,
       we need to show they're equal. But from (to H) = ev_plus2_proof ≠ H definitionally.
       
       However, the "eq" here is IsomorphismDefinitions.eq which lives in SProp.
       For SProp, the key is that we just need to produce SOME inhabitant of eq.
       
       Wait, but eq x y in SProp still requires x = y definitionally...
       Unless we use proof irrelevance for Prop values embedded in SProp equality.
       
       Actually, let me check: the "from_to" field has type:
       forall a : A, eq (from (to a)) a
       where A is Original.ev_plus2'' (a Prop).
       
       Since all proofs of a Prop are equal (proof irrelevance), 
       and eq is in SProp, we should be able to use this.
       
       Let me use the Stdlib proof irrelevance. *)
    intro H.
    pose proof (Stdlib.Logic.ProofIrrelevance.proof_irrelevance _ ev_plus2_proof H) as Heq.
    destruct Heq.
    apply IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.ev_plus2'' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__plus2'' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.ev_plus2'' Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__plus2''_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.ev_plus2'' Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__plus2'' Original_LF__DOT__ProofObjects_LF_ProofObjects_ev__plus2''_iso := {}.
