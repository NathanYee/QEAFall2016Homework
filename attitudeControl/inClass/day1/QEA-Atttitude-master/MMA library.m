(* ::Package:: *)

(* ::Chapter:: *)
(*General Mathematica helpers*)


exportNotebookPDF[]:=
Module[{name},
name=("FileName"/.NotebookInformation[])[[2]];
name=StringReplace[name,".nb"->".pdf"];
Export[FileNameJoin[{NotebookDirectory[],name}],EvaluationNotebook[]]
]


(* ::Subsection:: *)
(*Template cell*)


makeTemplate[]:=makeTemplate["Template"]


makeTemplate[name_] :=
Module[{namespace},
namespace = ToLowerCase@StringReplace[name,Whitespace->""];
makeTemplate[name, namespace]
]


makeTemplate[name_, namespace_]:=
Module[{cell, replacerules},
replacerules = <| "Template"->name, 
	"\"\<xxx\>\""->StringReplace["\"\<xxx`\>\"","xxx"->namespace] |>;


cell=
Cell[CellGroupData[{Cell["Template", "Section"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"context", "=", "\"\<xxx\>\""}], "}"}], ",", 
    RowBox[{"If", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"Context", "[", "]"}], " ", "\[NotEqual]", " ", 
       "context"}], ",", 
      RowBox[{"Begin", "[", "context", "]"}]}], "]"}]}], "]"}], ";", 
  RowBox[{"Dynamic", "[", 
   RowBox[{"Refresh", "[", 
    RowBox[{
     RowBox[{"Context", "[", "]"}], ",", 
     RowBox[{"UpdateInterval", "\[Rule]", "1"}]}], "]"}], 
   "]"}]}]], "Input"],

Cell[BoxData[
 DynamicBox[ToBoxes[
   Refresh[
    Context[], UpdateInterval -> 1], StandardForm],
  ImageSizeCache->{57., {0., 12.}}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"With", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"context", "=", "\"\<xxx\>\""}], "}"}], ",", 
   RowBox[{"If", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"Context", "[", "]"}], "\[Equal]", "context"}], ",", 
     RowBox[{"End", "[", "]"}], ",", "\"\<Not in context\>\""}], 
    "]"}]}], "]"}]], "Input"]
}, Open  ],GeneratedCell->False,CellAutoOverwrite->False]
}, Open  ]];

CellPrint[cell/.replacerules]
]
