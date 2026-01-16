From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__plus____is____U_o__iso.
From IsomorphismChecker Require Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__plus____is____U_o__iso.
From IsomorphismChecker Require Checker.U_true__iso Checker.U_corelib__U_init__U_logic__eq__iso Checker.and__iso Checker.nat__iso Checker.U_nat__add__iso Checker.__0__iso.

Module Type Args <: Interface.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__plus____is____U_o__iso.Args := Checker.U_true__iso.Checker <+ Checker.U_corelib__U_init__U_logic__eq__iso.Checker <+ Checker.and__iso.Checker <+ Checker.nat__iso.Checker <+ Checker.U_nat__add__iso.Checker <+ Checker.__0__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__plus____is____U_o__iso.imported_Original_LF__DOT__Logic_LF_Logic_plus__is__O Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__plus____is____U_o__iso.Original_LF__DOT__Logic_LF_Logic_plus__is__O_iso ].

Module Checker (Import args : Args) <: Interface.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__plus____is____U_o__iso.Interface args
  with Definition imported_Original_LF__DOT__Logic_LF_Logic_plus__is__O := Imported.Original_LF__DOT__Logic_LF_Logic_plus__is__O.

Definition imported_Original_LF__DOT__Logic_LF_Logic_plus__is__O := Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__plus____is____U_o__iso.imported_Original_LF__DOT__Logic_LF_Logic_plus__is__O.
Definition Original_LF__DOT__Logic_LF_Logic_plus__is__O_iso := Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__plus____is____U_o__iso.Original_LF__DOT__Logic_LF_Logic_plus__is__O_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Original_LF__DOT__Logic_LF_Logic_plus__is__O_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.