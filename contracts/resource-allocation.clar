;; Resource Allocation Contract

(define-map resource-allocations
  { planet-id: uint }
  {
    water: uint,
    atmosphere-generators: uint,
    plants: uint
  }
)

(define-constant CONTRACT_OWNER tx-sender)

(define-public (allocate-resources (planet-id uint) (water uint) (atmosphere-generators uint) (plants uint))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) (err u403))
    (ok (map-set resource-allocations
      { planet-id: planet-id }
      {
        water: water,
        atmosphere-generators: atmosphere-generators,
        plants: plants
      }
    ))
  )
)

(define-read-only (get-planet-resources (planet-id uint))
  (map-get? resource-allocations { planet-id: planet-id })
)

