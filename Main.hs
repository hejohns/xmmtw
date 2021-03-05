{-# LANGUAGE GADTs #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE OverloadedLabels #-}

module Main (main) where

import qualified GI.Gtk as Gtk
import Data.GI.Base
import GI.Gtk.Objects.DrawingArea as GI

activate :: Gtk.Application -> IO ()
activate app = do
    box <- new Gtk.Box [#orientation := Gtk.OrientationVertical]
    win <- new Gtk.ApplicationWindow [#application := app, #title := "title", #child := box]
    button <- new Gtk.Button [#label := "name"]
    on button #clicked $ putStrLn "fool"
    #append box button
    doxx <- new Gtk.DrawingArea [#contentWidth := 100, #contentHeight := 100] 
    GI.drawingAreaSetDrawFunc doxx (Just draw_func)
    on doxx #resize $ \x -> \y -> putStrLn "test2"
    #append box doxx
    #show win
    where
    draw_func _ _ _ _ = putStrLn "test"

main :: IO ()
main = do
    app <- new Gtk.Application [#applicationId := "edu.umich.hejohns.xournal"]
    on app #activate (activate app)
    #run app Nothing
    return ()
