{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveAnyClass     #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeOperators      #-}

module ClientAPI where

import           Data.Proxy
import           Servant.API
import           Servant.Client
import           API


restFileAPI :: Proxy FileAPI
restFileAPI = Proxy

restDirectoryAPI :: Proxy DirectoryAPI
restDirectoryAPI = Proxy

-- | The function type of the interface here.
-- Each function matches one of the endpoints in type API from UseHaskellAPI.hs

postFile :: Message -> ClientM Bool
getFile :: Maybe String -> ClientM [Message]


postDirectory :: Message -> ClientM [Message]
getDirectory :: Maybe String -> ClientM [Message]
-- | The following provides the implementations of these types
-- Note that the order of the functions must match the endpoints in the type API from UseHaskell.hs

(postFile :<|> getFile) = client restFileAPI
(postDirectory :<|> getDirectory) = client restDirectoryAPI
