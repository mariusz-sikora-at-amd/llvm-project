// RUN: not llvm-mc -arch=amdgcn -mcpu=gfx908 -mattr=+wavefrontsize32,-wavefrontsize64 %s 2>&1 | FileCheck --implicit-check-not=error: %s
// RUN: not llvm-mc -arch=amdgcn -mcpu=gfx908 -mattr=-wavefrontsize32,+wavefrontsize64 %s 2>&1 | FileCheck --implicit-check-not=error: %s

global_atomic_add_f64 v[0:1], v[0:1], v[2:3], off glc
// CHECK: :[[@LINE-1]]:{{[0-9]+}}: error: instruction not supported on this GPU

global_atomic_min_f64 v[0:1], v[0:1], v[2:3], off glc
// CHECK: :[[@LINE-1]]:{{[0-9]+}}: error: instruction not supported on this GPU

global_atomic_max_f64 v[0:1], v[0:1], v[2:3], off glc
// CHECK: :[[@LINE-1]]:{{[0-9]+}}: error: instruction not supported on this GPU
