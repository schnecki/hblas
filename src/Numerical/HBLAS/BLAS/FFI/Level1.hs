{-# LANGUAGE ForeignFunctionInterface, GeneralizedNewtypeDeriving #-}

module Numerical.HBLAS.BLAS.FFI.Level1  where

import Foreign.Ptr
import Foreign()
import Foreign.C.Types
import Data.Complex

type AsumFunFFI el res = CInt -> Ptr el -> CInt -> IO res
foreign import ccall unsafe "cblas_sasum" cblas_sasum_unsafe::
  AsumFunFFI Float Float
foreign import ccall unsafe "cblas_dasum" cblas_dasum_unsafe::
  AsumFunFFI Double Double
foreign import ccall unsafe "cblas_scasum" cblas_scasum_unsafe::
  AsumFunFFI (Complex Float) Float
foreign import ccall unsafe "cblas_dzasum" cblas_dzasum_unsafe::
  AsumFunFFI (Complex Double) Double

foreign import ccall "cblas_sasum" cblas_sasum_safe::
  AsumFunFFI Float Float
foreign import ccall "cblas_dasum" cblas_dasum_safe ::
  AsumFunFFI Double Double
foreign import ccall "cblas_scasum" cblas_scasum_safe ::
  AsumFunFFI (Complex Float) Float
foreign import ccall "cblas_dzasum" cblas_dzasum_safe ::
  AsumFunFFI (Complex Double) Double
--Float  cblas_sasum (  CInt n,   Float  *x,   CInt incx);
--Double cblas_dasum (  CInt n,   Double *x,   CInt incx);
--Float  cblas_scasum(  CInt n,   Float  *x,   CInt incx);
--Double cblas_dzasum(  CInt n,   Double *x,   CInt incx);

type AxpyFunFFI scale el = CInt -> scale -> Ptr el -> CInt -> Ptr el -> CInt -> IO ()
foreign import ccall unsafe "cblas_saxpy" cblas_saxpy_unsafe::
  AxpyFunFFI Float Float
foreign import ccall unsafe "cblas_daxpy" cblas_daxpy_unsafe::
  AxpyFunFFI Double Double
foreign import ccall unsafe "cblas_caxpy" cblas_caxpy_unsafe::
  AxpyFunFFI (Ptr (Complex Float )) (Complex Float )
foreign import ccall unsafe "cblas_zaxpy" cblas_zaxpy_unsafe::
  AxpyFunFFI (Ptr (Complex Double)) (Complex Double)

foreign import ccall "cblas_saxpy" cblas_saxpy_safe::
  AxpyFunFFI Float Float
foreign import ccall "cblas_daxpy" cblas_daxpy_safe::
  AxpyFunFFI Double Double
foreign import ccall "cblas_caxpy" cblas_caxpy_safe::
  AxpyFunFFI (Ptr (Complex Float )) (Complex Float )
foreign import ccall "cblas_zaxpy" cblas_zaxpy_safe::
  AxpyFunFFI (Ptr (Complex Double)) (Complex Double)
--void cblas_saxpy(  CInt n,   Float alpha,   Float *x,   CInt incx, Float *y,   CInt incy);
--void cblas_daxpy(  CInt n,   Double alpha,   Double *x,   CInt incx, Double *y,   CInt incy);
--void cblas_caxpy(  CInt n,   Float *alpha,   Float *x,   CInt incx, Float *y,   CInt incy);
--void cblas_zaxpy(  CInt n,   Double *alpha,   Double *x,   CInt incx, Double *y,   CInt incy);

type CopyFunFFI el = CInt -> Ptr el -> CInt -> Ptr el -> CInt -> IO ()
foreign import ccall unsafe "cblas_scopy" cblas_scopy_unsafe ::
    CopyFunFFI Float
foreign import ccall unsafe "cblas_dcopy" cblas_dcopy_unsafe ::
    CopyFunFFI Double
foreign import ccall unsafe "cblas_ccopy" cblas_ccopy_unsafe ::
    CopyFunFFI (Complex Float)
foreign import ccall unsafe "cblas_zcopy" cblas_zcopy_unsafe ::
    CopyFunFFI (Complex Double)

foreign import ccall "cblas_scopy" cblas_scopy_safe ::
    CopyFunFFI Float
foreign import ccall "cblas_dcopy" cblas_dcopy_safe ::
    CopyFunFFI Double
foreign import ccall "cblas_ccopy" cblas_ccopy_safe ::
    CopyFunFFI (Complex Float)
foreign import ccall "cblas_zcopy" cblas_zcopy_safe ::
    CopyFunFFI (Complex Double)
--void cblas_scopy(  CInt n,   Float *x,   CInt incx, Float *y,   CInt incy);
--void cblas_dcopy(  CInt n,   Double *x,   CInt incx, Double *y,   CInt incy);
--void cblas_ccopy(  CInt n,   Float *x,   CInt incx, Float *y,   CInt incy);
--void cblas_zcopy(  CInt n,   Double *x,   CInt incx, Double *y,   CInt incy);

--dot products
type NoScalarDotFunFFI el res = CInt -> Ptr el -> CInt -> Ptr el -> CInt -> IO res
type ScalarDotFunFFI el res = CInt -> el -> Ptr el -> CInt -> Ptr el -> CInt -> IO res
foreign import ccall "cblas_sdsdot" cblas_sdsdot_safe :: ScalarDotFunFFI Float Float
foreign import ccall "cblas_dsdot" cblas_dsdot_safe :: NoScalarDotFunFFI Float Double
foreign import ccall "cblas_sdot" cblas_sdot_safe :: NoScalarDotFunFFI Float Float
foreign import ccall "cblas_ddot" cblas_ddot_safe :: NoScalarDotFunFFI Double Double

foreign import ccall unsafe "cblas_sdsdot" cblas_sdsdot_unsafe :: ScalarDotFunFFI Float Float
foreign import ccall unsafe "cblas_dsdot" cblas_dsdot_unsafe :: NoScalarDotFunFFI Float Double
foreign import ccall unsafe "cblas_sdot" cblas_sdot_unsafe :: NoScalarDotFunFFI Float Float
foreign import ccall unsafe "cblas_ddot" cblas_ddot_unsafe :: NoScalarDotFunFFI Double Double
--Float  cblas_sdsdot(  CInt n,   Float alpha,   Float *x,   CInt incx,   Float *y,   CInt incy);
--Double cblas_dsdot (  CInt n,   Float *x,   CInt incx,   Float *y,   CInt incy);
--Float  cblas_sdot(  CInt n,   Float  *x,   CInt incx,   Float  *y,   CInt incy);
--Double cblas_ddot(  CInt n,   Double *x,   CInt incx,   Double *y,   CInt incy);

--complex dot products
type ComplexDotFunFFI el = CInt -> Ptr el -> CInt -> Ptr el -> CInt -> Ptr el -> IO ()
foreign import ccall "cblas_cdotu_sub" cblas_cdotu_safe :: ComplexDotFunFFI (Complex Float)
foreign import ccall "cblas_cdotc_sub" cblas_cdotc_safe :: ComplexDotFunFFI (Complex Float)
foreign import ccall "cblas_zdotu_sub" cblas_zdotu_safe :: ComplexDotFunFFI (Complex Double)
foreign import ccall "cblas_zdotc_sub" cblas_zdotc_safe :: ComplexDotFunFFI (Complex Double)

foreign import ccall unsafe "cblas_cdotu_sub" cblas_cdotu_unsafe :: ComplexDotFunFFI (Complex Float)
foreign import ccall unsafe "cblas_cdotc_sub" cblas_cdotc_unsafe :: ComplexDotFunFFI (Complex Float)
foreign import ccall unsafe "cblas_zdotu_sub" cblas_zdotu_unsafe :: ComplexDotFunFFI (Complex Double)
foreign import ccall unsafe "cblas_zdotc_sub" cblas_zdotc_unsafe :: ComplexDotFunFFI (Complex Double)
--void cblas_cdotu(CInt n, void *x, CInt incx, void *y, CInt incy, void *res);
--void cblas_cdotc(CInt n, void *x, CInt incx, void *y, CInt incy, void *res);
--void cblas_zdotu(CInt n, void *x, CInt incx, void *y, CInt incy, void *res);
--void cblas_zdotc(CInt n, void *x, CInt incx, void *y, CInt incy, void *res);

--Computes the Euclidean norm of a vector.
type Nrm2FunFFI el res = CInt -> Ptr el -> CInt -> IO res
foreign import ccall "cblas_snrm2" cblas_snrm2_safe :: Nrm2FunFFI Float Float
foreign import ccall "cblas_dnrm2" cblas_dnrm2_safe :: Nrm2FunFFI Double Double
foreign import ccall "cblas_scnrm2" cblas_scnrm2_safe :: Nrm2FunFFI (Complex Float) Float
foreign import ccall "cblas_dznrm2" cblas_dznrm2_safe :: Nrm2FunFFI (Complex Double) Double

foreign import ccall unsafe "cblas_snrm2" cblas_snrm2_unsafe :: Nrm2FunFFI Float Float
foreign import ccall unsafe "cblas_dnrm2" cblas_dnrm2_unsafe :: Nrm2FunFFI Double Double
foreign import ccall unsafe "cblas_scnrm2" cblas_scnrm2_unsafe :: Nrm2FunFFI (Complex Float) Float
foreign import ccall unsafe "cblas_dznrm2" cblas_dznrm2_unsafe :: Nrm2FunFFI (Complex Double) Double
--Float  cblas_snrm2 (  CInt N,   Float  *X,   CInt incX);
--Double cblas_dnrm2 (  CInt N,   Double *X,   CInt incX);
--Float  cblas_scnrm2(  CInt N,   void  *X,   CInt incX);
--Double cblas_dznrm2(  CInt N,   void  *X,   CInt incX);


--Performs rotation of points in the plane.
type RotFunFFI el = CInt -> Ptr el -> CInt -> Ptr el -> CInt -> el -> el -> IO ()
foreign import ccall "cblas_srot" cblas_srot_safe :: RotFunFFI Float
foreign import ccall "cblas_drot" cblas_drot_safe :: RotFunFFI Double

foreign import ccall unsafe "cblas_srot" cblas_srot_unsafe :: RotFunFFI Float
foreign import ccall unsafe "cblas_drot" cblas_drot_unsafe :: RotFunFFI Double
--void cblas_srot(  CInt N, Float *X,   CInt incX, Float *Y,   CInt incY,   Float c,   Float s);
--void cblas_drot(  CInt N, Double *X,   CInt incX, Double *Y,   CInt incY,   Double c,   Double  s);

type RotgFunFFI el = Ptr el -> Ptr el -> Ptr el -> Ptr el -> IO ()
foreign import ccall "cblas_srotg" cblas_srotg_safe :: RotgFunFFI Float
foreign import ccall "cblas_drotg" cblas_drotg_safe :: RotgFunFFI Double

foreign import ccall unsafe "cblas_srotg" cblas_srotg_unsafe :: RotgFunFFI Float
foreign import ccall unsafe "cblas_drotg" cblas_drotg_unsafe :: RotgFunFFI Double
--void cblas_srotg(Float *a, Float *b, Float *c, Float *s);
--void cblas_drotg(Double *a, Double *b, Double *c, Double *s);

--void cblas_srotm(  CInt N, Float *X,   CInt incX, Float *Y,   CInt incY,   Float *P);
--void cblas_drotm(  CInt N, Double *X,   CInt incX, Double *Y,   CInt incY,   Double *P);

--void cblas_srotmg(Float *d1, Float *d2, Float *b1,   Float b2, Float *P);
--void cblas_drotmg(Double *d1, Double *d2, Double *b1,   Double b2, Double *P);
