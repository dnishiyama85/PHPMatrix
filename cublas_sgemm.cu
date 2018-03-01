#include <cublas_v2.h>
#include <stdio.h>
#include <sys/time.h>

extern "C" {

void _cublas_mul(float* a, float* b, float* c, int r1, int c1, int r2, int c2) {

    //デバイス(GPU)側用 　
    float *devA,*devB,*devC;

    // 行列演算 C=αAB+βC のパラメータ
    float alpha = 1.0f;
    float beta = 0.0f;

    size_t memSzA = r1 * c1 * sizeof(float);
    size_t memSzB = r2 * c2 * sizeof(float);
    size_t memSzC = r1 * c2 * sizeof(float);

    //デバイス側メモリ確保
    cudaMalloc((void **)&devA, memSzA);
    cudaMalloc((void **)&devB, memSzB);
    cudaMalloc((void **)&devC, memSzC);

    //ホスト → デバイス memcpy
    cublasSetVector(r1 * c1, sizeof(float), a, 1, devA, 1);
    cublasSetVector(r2 * c2, sizeof(float), b, 1, devB, 1);

    // デバイス側ハンドル作成
    cublasHandle_t handle;
    cublasCreate(&handle);

    // 行列の積 演算
    // CuBLAS は列志向であることに注意する！！
    // https://stackoverflow.com/questions/13782012/how-to-transpose-a-matrix-in-cuda-cublas
    cublasSgemm(
            handle,
            CUBLAS_OP_N,
            CUBLAS_OP_N,
            c2,
            r1,
            c1,
            &alpha,
            devB,
            c2,
            devA,
            c1,
            &beta,
            devC,
            c2
    );

    // デバイス側ハンドル破棄
    cublasDestroy(handle);

    // ホスト ← デバイス memcpy (計算結果取得)
    cublasGetVector(r1 * c2, sizeof(float), devC, 1, c, 1);

    // デバイス側メモリ解放
    cudaFree(devA);
    cudaFree(devB);
    cudaFree(devC);

}

}
