From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__U_a__iso.
From IsomorphismChecker Require Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__U_a__iso.
From IsomorphismChecker Require Checker.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__letter__iso.

Module Type Args <: Interface.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__U_a__iso.Args := Checker.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__letter__iso.Args <+ Checker.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__letter__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__U_a__iso.imported_Original_LF__DOT__Basics_LF_Basics_A Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__U_a__iso.Original_LF__DOT__Basics_LF_Basics_A_iso ].

Module Checker (Import args : Args) <: Interface.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__U_a__iso.Interface args
  with Definition imported_Original_LF__DOT__Basics_LF_Basics_A := Imported.Original_LF__DOT__Basics_LF_Basics_A.

Definition imported_Original_LF__DOT__Basics_LF_Basics_A := Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__U_a__iso.imported_Original_LF__DOT__Basics_LF_Basics_A.
Definition Original_LF__DOT__Basics_LF_Basics_A_iso := Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__U_a__iso.Original_LF__DOT__Basics_LF_Basics_A_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Original_LF__DOT__Basics_LF_Basics_A_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.