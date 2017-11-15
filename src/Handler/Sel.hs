{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Sel where

import Import

getSelR :: Handler Html
getSelR = do
    u <- runDB $ selectList [UserIdent ==. "hanachan"] [Desc UserIdent, LimitTo 1]
    defaultLayout $ do
      setTitle "Select data"
      $(widgetFile "sel")
