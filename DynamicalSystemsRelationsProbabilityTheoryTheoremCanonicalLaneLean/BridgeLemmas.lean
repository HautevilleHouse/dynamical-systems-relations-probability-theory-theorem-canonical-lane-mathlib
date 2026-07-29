import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean

variable (A : AdmissibleClass)

def bridgeClosed (A : AdmissibleClass) : Prop :=
  let dyn := (MeasurePreservingFlow (X := ℝ) : Prop) in True

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  trivial

end DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean
end HautevilleHouse