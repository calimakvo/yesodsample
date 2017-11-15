{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Del where

import Import
import Database.Persist.Sql (toSqlKey)

getDelR :: Handler Html
getDelR = do
  let uid = toSqlKey 2 :: Key User
  _ <- runDB $ do
    delete uid
  defaultLayout $ do
    setTitle "Fetching data"
    $(widgetFile "delid")
