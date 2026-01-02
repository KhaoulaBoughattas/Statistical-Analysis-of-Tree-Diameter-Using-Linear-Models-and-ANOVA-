#compte rendu = interpretation des resultat et comparaison entre metjode normale avec lm (1) et avec anova(2)

# -----------------------------------------------------------
# 1. Chargement des données
# -----------------------------------------------------------

arbres <- read.csv("arbres.csv",
                   header = TRUE,
                   sep = ",",
                   stringsAsFactors = FALSE)

# Vérifier les premières lignes
head(arbres)

# Renommer les colonnes si nécessaire
colnames(arbres) <- c("Diametre", "Statut")

# Conversion en numérique
arbres$Diametre <- as.numeric(as.character(arbres$Diametre))

# Vérifier structure
str(arbres)

# -----------------------------------------------------------
# 2. Statistiques descriptives
# -----------------------------------------------------------

# Moyenne du diamètre par statut
by(arbres$Diametre, arbres$Statut, mean)

# Effectif par groupe
table(arbres$Statut)

# Boxplot
par(mfrow = c(1,1))
boxplot(Diametre ~ Statut, data = arbres,
        main = "Diamètre des arbres selon le statut",
        xlab = "Statut",
        ylab = "Diamètre")

# -----------------------------------------------------------
# 3. Méthode 1 : Modèle linéaire simple (lm)
# -----------------------------------------------------------

modelarbres <- lm(Diametre ~ Statut, data = arbres)

# Diagnostics
par(mfrow = c(2,2))
plot(modelarbres)

# Résumé du modèle
summary(modelarbres)



# -----------------------------------------------------------
# 4. Méthode 2 : ANOVA + tests post-hoc
# -----------------------------------------------------------

# ANOVA
ins.aov <- aov(Diametre ~ Statut, data = arbres)
summary(ins.aov)

# Tests post-hoc sans correction
comp.statut <- pairwise.t.test(arbres$Diametre, arbres$Statut,
                               p.adjust.method = "none")
comp.statut

# Avec correction Bonferroni
pairwise.t.test(arbres$Diametre, arbres$Statut,
                p.adjust.method = "bonferroni")

# Test de Holm (à faire)
pairwise.t.test(arbres$Diametre, arbres$Statut,
                p.adjust.method = "holm")

# -----------------------------------------------------------
# 5. Tests plus avancés (car, multcomp, DescTools)
# -----------------------------------------------------------

# install.packages("car")
# install.packages("multcomp")
# install.packages("DescTools")

# Test de Tukey (plus robuste)
TukeyHSD(ins.aov)


#-------------------------------------------------------------
#travail a faire : alpha1+alpha2=0 
#-------------------------------------------------------------
# Forcer sum-to-zero pour Statut
arbres$Statut <- factor(arbres$Statut)  # s'assurer que c'est un facteur
contrasts(arbres$Statut) <- contr.sum(length(levels(arbres$Statut)))

# Vérifier les contrastes
contrasts(arbres$Statut)

# Modèle linéaire avec contrainte alpha1 + alpha2 + ... + alphaK = 0
modelarbres_sum <- lm(Diametre ~ Statut, data = arbres)

summary(modelarbres_sum)
