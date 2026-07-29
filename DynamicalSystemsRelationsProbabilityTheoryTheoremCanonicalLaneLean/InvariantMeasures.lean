import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean

structure InvariantMeasuresPackage (A : AdmissibleClass) where
  dynamicalSystem : Prop
  invariantMeasureExistence : Prop
  ergodicDecomposition : Prop
  kroneckerFactor : Prop

structure InvariantMeasuresEvidence {A : AdmissibleClass} (P : InvariantMeasuresPackage A) where
  dynamicalSystemClosed : P.dynamicalSystem
  invariantMeasureExistenceClosed : P.invariantMeasureExistence
  ergodicDecompositionClosed : P.ergodicDecomposition
  kroneckerFactorClosed : P.kroneckerFactor

def InvariantMeasuresClosed {A : AdmissibleClass} (P : InvariantMeasuresPackage A) : Prop :=
  P.dynamicalSystem ∧ P.invariantMeasureExistence ∧
  P.ergodicDecomposition ∧ P.kroneckerFactor

theorem invariant_measures_closed_from_evidence {A : AdmissibleClass} (P : InvariantMeasuresPackage A) (E : InvariantMeasuresEvidence P) : InvariantMeasuresClosed P := by
  exact And.intro E.dynamicalSystemClosed
    (And.intro E.invariantMeasureExistenceClosed
      (And.intro E.ergodicDecompositionClosed E.kroneckerFactorClosed))

end DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean
end HautevilleHouse