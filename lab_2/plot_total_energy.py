# ----------- IMPORT LIBRARIES -----------
import matplotlib.pyplot as plt
import numpy as np

# ----------- SETTINGS FOR MATPLOTLIB -----------
plt.rc('font', size=20)
plt.rc('font', family='Arial')
plt.rc('mathtext', fontset='custom')
plt.rc('mathtext', rm='Arial')
plt.rc('mathtext', sf='Arial')
plt.rc('mathtext', it='Arial:italic')
plt.rc('mathtext', bf='Arial:bold')
plt.rc('lines', linewidth=1)
plt.rc('axes', linewidth=2)

# ----------- READ FILES -----------
total_energy = np.loadtxt("total_energy.out")

# ----------- PLOT -----------
plt.plot(total_energy, label="Si")

plt.xlabel(r"Step, #")
plt.ylabel(r"Energy per atom, Ryd")
plt.minorticks_on()
plt.grid()
plt.legend(ncol=2,loc="best",fontsize=14)
#plt.axis([0, 100, -1, 2])

plt.tight_layout()
plt.savefig('total_energy.png',figsize=(5, 4),dpi=600);
