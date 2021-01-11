#include <iostream>

static __global__ void kernel(const float *A, const float *b) {
}

int main(int argc, char** argv) {
    float *d_a, *d_b;
    if(cudaMalloc(&d_a, sizeof(float)) != cudaSuccess) {
        std::cout << "cudaMalloc d_a failed" << std::endl;
	return 1;
    }
    if(cudaMalloc(&d_b, sizeof(float)) != cudaSuccess) {
        std::cout << "cudaMalloc d_b failed" << std::endl;
	cudaFree(d_a);
	return 1;
    }
    kernel<<<1, 1>>>(d_a, d_b);
    cudaFree(d_a);
    cudaFree(d_b);
    std::cout << "done." << std::endl;
}

