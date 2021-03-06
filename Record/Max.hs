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

module Records.Max (Records.Min) where

import Records.Min

instance HasField' l a b => IsLabel l (a -> b) where
    fromLabel = getField (Label :: Label l)

instance HasField' l a b => IsLabel l (a -> b -> a) where
    fromLabel = setField (Label :: Label l)
