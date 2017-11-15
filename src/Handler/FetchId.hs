{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.FetchId where

import Import
import Database.Persist.Sql (toSqlKey)

getFetchIdR :: Handler Html
getFetchIdR = do
  let uid = toSqlKey 1 :: Key User
  userVal <- runDB $ do
    get uid >>= \user -> case user of
      Just u -> return u
      _ -> error "not found"
  defaultLayout $ do
    setTitle "Fetching data"
    $(widgetFile "fetchid")
