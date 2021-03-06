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

module Main (main) where

import qualified GI.Gtk as Gtk
import Data.GI.Base
import Record.Min

activate :: Gtk.Application -> IO ()
activate app = do
    box <- new Gtk.Box [#orientation := Gtk.OrientationVertical]
    win <- new Gtk.ApplicationWindow [#application := app, #title := "title", #child := box]
    button <- new Gtk.Button [#label := "name"]
    id #append box button
    doxx <- new Gtk.DrawingArea [#contentWidth := 100, #contentHeight := 100] 
    Gtk.drawingAreaSetDrawFunc doxx (Just draw_func)
    on doxx #resize $ \x -> \y -> putStrLn "test2"
    id #append box doxx
    b <- new Gtk.ColorButton [#title := "rip"]
    id #append box b
    drag <- new Gtk.GestureDrag []
    status <- new Gtk.ProgressBar []
    on button #clicked $ #pulse status
    id #append box status
    id #show win
    where
    draw_func _ _ _ _ = putStrLn "test"

main :: IO ()
main = do
    app <- new Gtk.Application [#applicationId := "edu.umich.hejohns.xournal"]
    on app #activate (activate app)
    id #run app Nothing
    return ()
