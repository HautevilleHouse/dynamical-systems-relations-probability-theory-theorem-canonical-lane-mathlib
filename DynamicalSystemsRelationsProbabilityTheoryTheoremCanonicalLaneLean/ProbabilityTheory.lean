import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean

structure ProbabilitySpace (Ω : Type u) where
  events : Set (Set Ω)
  measure : Set Ω → ℝ
  probability : Prop
  sigmaAlgebra : Prop

structure RandomProcess (Ω : Type u) (T : Type v) where
  stateSpace : Ω
  timeIndex : T
  samplePath : T → Ω
  filtration : T → Set (Set Ω)
  adapted : Prop

structure ConvergenceTheorem where
  almostSureConvergence : Prop
  convergenceInProbability : Prop
  distributionConvergence : Prop

structure Martingale (Ω : Type u) (T : Type v) where
  process : RandomProcess Ω T
  integrable : Prop
  conditionalExpectationProperty : Prop

structure MartingaleConvergenceTheorem where
  boundedMartingale : Prop
  almostSureLimit : Prop
  integrableLimit : Prop

structure StochasticCalculus where
  itoIntegral : Prop
  quadraticVariation : Prop
  itoFormula : Prop

theorem dynamical_systems_evidence_implies_closed (A : AdmissibleClass) :
    bridgeClosed A ∧ gateClosed A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean
end HautevilleHouse