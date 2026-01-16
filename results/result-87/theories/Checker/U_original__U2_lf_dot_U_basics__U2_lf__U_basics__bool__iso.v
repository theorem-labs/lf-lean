From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso.
From IsomorphismChecker Require Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso.

Module Type Args <: Interface.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso.Args. End Args.

#[global] Strategy -1 [ Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso.imported_Original_LF__DOT__Basics_LF_Basics_bool Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso.Original_LF__DOT__Basics_LF_Basics_bool_iso ].

Module Checker (Import args : Args) <: Interface.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso.Interface args
  with Definition imported_Original_LF__DOT__Basics_LF_Basics_bool := Imported.Original_LF__DOT__Basics_LF_Basics_bool.

Definition imported_Original_LF__DOT__Basics_LF_Basics_bool := Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso.imported_Original_LF__DOT__Basics_LF_Basics_bool.
Definition Original_LF__DOT__Basics_LF_Basics_bool_iso := Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso.Original_LF__DOT__Basics_LF_Basics_bool_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Original_LF__DOT__Basics_LF_Basics_bool_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.