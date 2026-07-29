import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean

structure RandomProcessPackage where
  stateSpace : Type u
  timeDomain : Type v
  samplePathContinuity : Prop
  markovProperty : Prop
  stationarity : Prop

def RandomProcessClosed (R : RandomProcessPackage) : Prop :=
  R.samplePathContinuity ∧ R.markovProperty ∧ R.stationarity

structure RandomProcessEvidence (R : RandomProcessPackage) where
  samplePathContinuityClosed : R.samplePathContinuity
  markovPropertyClosed : R.markovProperty
  stationarityClosed : R.stationarity

theorem random_process_closed_from_evidence (R : RandomProcessPackage) (E : RandomProcessEvidence R) : RandomProcessClosed R :=
  And.intro E.samplePathContinuityClosed (And.intro E.markovPropertyClosed E.stationarityClosed)

end DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean
end HautevilleHouse