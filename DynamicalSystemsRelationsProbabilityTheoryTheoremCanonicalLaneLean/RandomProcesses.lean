import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean

structure RandomProcessesPackage (A : AdmissibleClass) where
  stochasticProcess : Prop
  markovProperty : Prop
  stationaryDistribution : Prop
  ergodicTheorem : Prop

structure RandomProcessesEvidence {A : AdmissibleClass} (P : RandomProcessesPackage A) where
  stochasticProcessClosed : P.stochasticProcess
  markovPropertyClosed : P.markovProperty
  stationaryDistributionClosed : P.stationaryDistribution
  ergodicTheoremClosed : P.ergodicTheorem

def RandomProcessesClosed {A : AdmissibleClass} (P : RandomProcessesPackage A) : Prop :=
  P.stochasticProcess ∧ P.markovProperty ∧
  P.stationaryDistribution ∧ P.ergodicTheorem

theorem random_processes_closed_from_evidence {A : AdmissibleClass} (P : RandomProcessesPackage A) (E : RandomProcessesEvidence P) : RandomProcessesClosed P := by
  exact And.intro E.stochasticProcessClosed
    (And.intro E.markovPropertyClosed
      (And.intro E.stationaryDistributionClosed E.ergodicTheoremClosed))

end DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean
end HautevilleHouse