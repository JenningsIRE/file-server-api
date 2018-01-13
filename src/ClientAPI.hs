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


fileAPI :: Proxy FileAPI
fileAPI = Proxy

directoryAPI :: Proxy DirectoryAPI
directoryAPI = Proxy

lockAPI :: Proxy LockAPI
lockAPI = Proxy

postFile :: Message -> ClientM Bool
getFile :: Maybe String -> ClientM [Message]


postDirectory :: Message -> ClientM [Message]
getDirectory :: Message -> ClientM [DirectoryResponse]

lockFile :: Message -> ClientM Bool
unlockFile :: Message -> ClientM Bool

(postFile :<|> getFile) = client fileAPI
(postDirectory :<|> getDirectory) = client directoryAPI
(lockFile :<|> unlockFile) = client lockAPI