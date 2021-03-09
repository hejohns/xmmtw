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

module Record.Max (module Record.Min) where

import Record.Min
import GHC.OverloadedLabels (IsLabel(..))
import GHC.TypeLits (Symbol)

instance {-# OVERLAPPABLE #-} HasField l a b => IsLabel l (a -> b) where
    fromLabel = getField (Label :: Label l)

instance {-# OVERLAPPABLE #-} HasField l a b => IsLabel l (a -> b -> a) where
    fromLabel = setField (Label :: Label l)
