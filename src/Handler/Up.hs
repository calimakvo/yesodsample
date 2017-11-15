{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Up where

import Import
import Database.Persist.Sql (toSqlKey)

getUpR :: Handler Html
getUpR = do
  let uid = toSqlKey 1 :: Key User
  _ <- runDB $ do
    update uid [UserPassword =. Just "abcdef12345"]
  defaultLayout $ do
    setTitle "Update data"
    $(widgetFile "up")
