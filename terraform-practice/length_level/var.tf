            variable "assignvar_values" {
            type = object({
                varcidr = string
                varname = string
                subnets = object({
                subvaraz   = list(string)
                subvarcidr = list(string)
                subname    = list(string)
                })
            })
             }
        
