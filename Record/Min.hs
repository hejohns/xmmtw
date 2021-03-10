{-# LANGUAGE GADTs #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE TypeFamilies #-}

module Record.Min where

import GHC.OverloadedLabels (IsLabel(..))
import GHC.TypeLits (Symbol)

data Label (l :: Symbol) where
    Label :: Label l

class FT l a ~ b => HasField (l :: Symbol) a b where
    type FT l a
    getField :: Label l -> a -> FT l a
    setField :: Label l -> a -> FT l a -> a

data Test where
    Test :: Int -> String -> Test
    deriving Show

data Test' where
    Test' :: String -> Int -> Test'
    deriving Show

instance HasField "one" Test Int where
    type FT "one" Test = Int
    getField _ (Test x _) = x
    setField _ _ x = Test x ""

instance HasField "one" Test' String where
    type FT "one" Test' = String
    getField _ (Test' x _) = x
    setField _ _ x = Test' x 0
