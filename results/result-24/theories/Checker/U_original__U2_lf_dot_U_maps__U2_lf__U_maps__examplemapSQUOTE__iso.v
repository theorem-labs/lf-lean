From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__examplemapSQUOTE__iso.
From IsomorphismChecker Require Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__examplemapSQUOTE__iso.
From IsomorphismChecker Require Checker.U_string__string__iso Checker.bool__iso.

Module Type Args <: Interface.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__examplemapSQUOTE__iso.Args := Checker.U_string__string__iso.Checker <+ Checker.bool__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__examplemapSQUOTE__iso.imported_Original_LF__DOT__Maps_LF_Maps_examplemap' Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__examplemapSQUOTE__iso.Original_LF__DOT__Maps_LF_Maps_examplemap'_iso ].

Module Checker (Import args : Args) <: Interface.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__examplemapSQUOTE__iso.Interface args
  with Definition imported_Original_LF__DOT__Maps_LF_Maps_examplemap' := Imported.Original_LF__DOT__Maps_LF_Maps_examplemap'.

Definition imported_Original_LF__DOT__Maps_LF_Maps_examplemap' := Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__examplemapSQUOTE__iso.imported_Original_LF__DOT__Maps_LF_Maps_examplemap'.
Definition Original_LF__DOT__Maps_LF_Maps_examplemap'_iso := Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__examplemapSQUOTE__iso.Original_LF__DOT__Maps_LF_Maps_examplemap'_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Original_LF__DOT__Maps_LF_Maps_examplemap'_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.