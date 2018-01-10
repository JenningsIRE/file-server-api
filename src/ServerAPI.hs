{-# LANGUAGE DataKinds            #-}
{-# LANGUAGE DeriveAnyClass       #-}
{-# LANGUAGE DeriveGeneric        #-}
{-# LANGUAGE FlexibleContexts     #-}
{-# LANGUAGE FlexibleInstances    #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE StandaloneDeriving   #-}
{-# LANGUAGE TemplateHaskell      #-}
{-# LANGUAGE TypeOperators        #-}
{-# LANGUAGE TypeSynonymInstances #-}

module ServerAPI where

import           Data.Proxy
import           Servant.API
import           Servant.Client
import           API

-- Inter server communication API...
restInterServerAPI :: Proxy InterServerAPI
restInterServerAPI = Proxy

registerFS :: Message -> ClientM Bool

(registerFS) = client restInterServerAPI
