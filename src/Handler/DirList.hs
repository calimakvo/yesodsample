{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.DirList where

import Import

getDirListR :: DirId -> Handler Html
getDirListR (DirId n) = defaultLayout $ do
    setTitle "Routing test"
    $(widgetFile "did")
