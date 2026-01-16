From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__ltb__iso.
From IsomorphismChecker Require Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__ltb__iso.
From IsomorphismChecker Require Checker.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso Checker.nat__iso.

Module Type Args <: Interface.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__ltb__iso.Args := Checker.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso.Checker <+ Checker.nat__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__ltb__iso.imported_Original_LF__DOT__Basics_LF_Basics_ltb Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__ltb__iso.Original_LF__DOT__Basics_LF_Basics_ltb_iso ].

Module Checker (Import args : Args) <: Interface.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__ltb__iso.Interface args
  with Definition imported_Original_LF__DOT__Basics_LF_Basics_ltb := Imported.Original_LF__DOT__Basics_LF_Basics_ltb.

Definition imported_Original_LF__DOT__Basics_LF_Basics_ltb := Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__ltb__iso.imported_Original_LF__DOT__Basics_LF_Basics_ltb.
Definition Original_LF__DOT__Basics_LF_Basics_ltb_iso := Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__ltb__iso.Original_LF__DOT__Basics_LF_Basics_ltb_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Original_LF__DOT__Basics_LF_Basics_ltb_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.