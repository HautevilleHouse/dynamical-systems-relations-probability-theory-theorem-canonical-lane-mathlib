import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean

structure ProbabilitySpace where
  carrier : Type u
  sigmaAlgebra : Set (Set carrier)
  probabilityMeasure : carrier → ℝ
  isSigmaAlgebra : Prop
  isProbabilityMeasure : Prop
  sigmaAlgebraClosed : isSigmaAlgebra
  probabilityMeasureClosed : isProbabilityMeasure

structure ProbabilitySpaceEvidence (P : ProbabilitySpace) where
  sigmaAlgebraClosed : P.isSigmaAlgebra
  probabilityMeasureClosed : P.isProbabilityMeasure

def ProbabilitySpaceClosed (P : ProbabilitySpace) : Prop :=
  P.isSigmaAlgebra ∧ P.isProbabilityMeasure

theorem probability_space_closed_from_evidence (P : ProbabilitySpace) (E : ProbabilitySpaceEvidence P) : ProbabilitySpaceClosed P :=
  And.intro E.sigmaAlgebraClosed E.probabilityMeasureClosed

end DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean
end HautevilleHouse