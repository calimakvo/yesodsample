{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Ins where

import Import

getInsR :: Handler Html
getInsR = do
    uid <- runDB $ insert $ User "hanachan" Nothing Nothing
    defaultLayout $ do
      setTitle "Insert data"
      $(widgetFile "templ")
