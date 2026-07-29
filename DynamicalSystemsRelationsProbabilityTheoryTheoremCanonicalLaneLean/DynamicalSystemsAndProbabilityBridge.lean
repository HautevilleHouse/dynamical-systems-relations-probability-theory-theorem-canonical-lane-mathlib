import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean

structure DynamicalSystemsProbabilityBridgePackage where
  flow : Type u
  invariantMeasure : Prop
  ergodicTheorem : Prop
  mixingProperty : Prop

def DynamicalSystemsProbabilityBridgeClosed (D : DynamicalSystemsProbabilityBridgePackage) : Prop :=
  D.invariantMeasure ∧ D.ergodicTheorem ∧ D.mixingProperty

structure DynamicalSystemsProbabilityBridgeEvidence (D : DynamicalSystemsProbabilityBridgePackage) where
  invariantMeasureClosed : D.invariantMeasure
  ergodicTheoremClosed : D.ergodicTheorem
  mixingPropertyClosed : D.mixingProperty

theorem dynamical_systems_probability_bridge_closed_from_evidence (D : DynamicalSystemsProbabilityBridgePackage) (E : DynamicalSystemsProbabilityBridgeEvidence D) : DynamicalSystemsProbabilityBridgeClosed D :=
  And.intro E.invariantMeasureClosed (And.intro E.ergodicTheoremClosed E.mixingPropertyClosed)

end DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean
end HautevilleHouse