ns = 10; nr = 30
Z <- matrix(NA,ns*nr, ns*nr)
Z[] <- sample(100, (ns*nr)^2, replace = T)
Zs <- matrix(0,ns*nr, ns*nr)

Zkp <- matrix(0,nr,nr)

for (i in 1:nr) {
  for (j in 1:nr) {
    rmin = ((i-1)*ns)+1; rmax = (i*ns)
    cmin = ((j-1)*ns)+1; cmax = (j*ns)
    Ze <- Z[rmin:rmax,cmin:cmax]
    Zkp[i,j] <- 1
    Zn <- kronecker(Ze, Zkp)
    Zs <- Zs + Zn
    #print(Zs)
    Zkp[i,j] <- 0
  }
}