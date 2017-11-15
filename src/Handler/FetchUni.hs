{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.FetchUni where

import Import

getFetchUniR :: Handler Html
getFetchUniR = do
  userVal <- runDB $ do
    user <- getBy $ UniqueUser "hanachan"
    case user of
      Just (Entity i u) -> return (i, u)
      _ -> error "not found"
  defaultLayout $ do
    setTitle "Fetching data"
    $(widgetFile "fetchuni")
