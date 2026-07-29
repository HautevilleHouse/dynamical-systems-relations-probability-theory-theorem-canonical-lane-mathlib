import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean

structure LyapunovExponent (X : Type u) [NormedAddCommGroup X] [NormedSpace ℝ X] where
  dynamicalSystem : X → X
  oseledetsTheorem : Prop
  multiplicity : Prop
  invariantMeasure : Set X → ℝ

structure LyapunovExponentEvidence (L : LyapunovExponent X) where
  oseledetsTheoremClosed : L.oseledetsTheorem
  multiplicityClosed : L.multiplicity

def LyapunovExponentClosed (L : LyapunovExponent X) : Prop :=
  L.oseledetsTheorem ∧ L.multiplicity

theorem lyapunov_exponent_closed_from_evidence
    (L : LyapunovExponent X) (E : LyapunovExponentEvidence L) :
    LyapunovExponentClosed L := by
  exact And.intro E.oseledetsTheoremClosed E.multiplicityClosed

end DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean
end HautevilleHouse