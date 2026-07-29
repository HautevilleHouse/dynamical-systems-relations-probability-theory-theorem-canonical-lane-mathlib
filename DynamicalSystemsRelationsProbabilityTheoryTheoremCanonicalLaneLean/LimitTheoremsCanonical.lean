import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean

structure LawLargeNumbersPackage (X : ℕ → ℝ) where
  iidCondition : Prop
  finiteMean : Prop
  sampleMeanConvergence : Prop
  almostSureConvergence : Prop
  rateOfConvergence : ℝ

structure CentralLimitTheoremPackage (X : ℕ → ℝ) where
  iidCondition : Prop
  finiteVariance : Prop
  variance : ℝ
  normalApproximation : Prop
  convergenceInDistribution : Prop

structure LimitTheoremEvidence {X : ℕ → ℝ} (L : LawLargeNumbersPackage X) (C : CentralLimitTheoremPackage X) where
  iidConditionClosed : L.iidCondition ∧ C.iidCondition
  finiteMeanClosed : L.finiteMean
  finiteVarianceClosed : C.finiteVariance
  sampleMeanConvergenceClosed : L.sampleMeanConvergence
  almostSureConvergenceClosed : L.almostSureConvergence
  normalApproximationClosed : C.normalApproximation
  convergenceInDistributionClosed : C.convergenceInDistribution

def LimitTheoremsClosed {X : ℕ → ℝ} (L : LawLargeNumbersPackage X) (C : CentralLimitTheoremPackage X) : Prop :=
  (L.iidCondition ∧ C.iidCondition) ∧ L.finiteMean ∧ C.finiteVariance ∧ L.sampleMeanConvergence ∧ L.almostSureConvergence ∧ C.normalApproximation ∧ C.convergenceInDistribution

theorem limit_theorems_closed_from_evidence {X : ℕ → ℝ} (L : LawLargeNumbersPackage X) (C : CentralLimitTheoremPackage X) (Ev : LimitTheoremEvidence L C) : LimitTheoremsClosed L C := by
  exact And.intro Ev.iidConditionClosed (And.intro Ev.finiteMeanClosed (And.intro Ev.finiteVarianceClosed (And.intro Ev.sampleMeanConvergenceClosed (And.intro Ev.almostSureConvergenceClosed (And.intro Ev.normalApproximationClosed Ev.convergenceInDistributionClosed)))))

end DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean
end HautevilleHouse