sec = 1000
min = 60 * sec

Config = {}
Config.esx_routers = {
    ['getSharedObject'] = 'esx:getSharedObject',
}
Config.LoadedTime = 15 * sec -- 10 * sec
Config.randomTime = 30 * min
Config.endTime = 10 * min
Config.questionTime = 10 * sec

Config.Rewards = {
    [5] = {
        { item = 'money', amount = 2000 },

        -- { item = 'ramen', amount = 1 },
    }
}

Config.MaxQuiz = 5
Config.Quiz = {
    {
        question = '36 + 48 = ?',
        answer = {
            {
                label = '82'
            },
            {
                label = '84',
                correct = true
            },
            {
                label = '86'
            },
            {
                label = '74'
            }
        }
    },
    {
        question = '95 - 37 = ?',
        answer = {
            {
                label = '58'
                correct = true
            },
            {
                label = '62',
            },
            {
                label = '68'
            },
            {
                label = '55'
            }
        }
    },
    {
        question = '7 × 8 = ?',
        answer = {
            {
                label = '54'
            },
            {
                label = '56'
                correct = true
            },
            {
                label = '48'
            },
            {
                label = '63',
            }
        }
    },
    {
        question = '72 ÷ 9 = ?',
        answer = {
            {
                label = '7'
            },
            {
                label = '9'
            },
            {
                label = '8',
                correct = true
            },
            {
                label = '6'
            },
        }
    },
    {
        question = '125 + 256 = ?',
        answer = {
            {
                label = '371'
            },
            {
                label = '381'
                correct = true
            },
            {
                label = '391',
            },
            {
                label = '361'
            },
        }
    },
    {
        question = '84 ÷ 6 = ?',
        answer = {
            {
                label = '12'
            },
            {
                label = '16'
            },
            {
                label = '18'
            },
            {
                label = '14',
                correct = true
            },
        }
    },
    {
        question = '15 × 4 = ?',
        answer = {
            {
                label = '45'
            },
            {
                label = '55'
            },
            {
                label = '60'
                correct = true
            },
            {
                label = '65',
            },
        }
    },
    {
        question = '200 - 63 = ?',
        answer = {
            {
                label = '147'
          
            },
            {
                label = '137'
                correct = true
            },
            {
                label = '143'
            },
            {
                label = '163',
            },
        }
    },
    {
        question = '144 ÷ 12 = ?',
        answer = {
            {
                label = '11'
            },
            {
                label = '13'
            },
            {
                label = '14',
            },
            {
                label = '12'
                correct = true
            },
        }
    },
    {
        question = '25 × 6 = ?',
        answer = {
            {
                label = '120'
            },
            {
                label = '130'
            },
            {
                label = '150',
                correct = true
            },
            {
                label = '145'
            },
        }
    },
    {
        question = '180 - 45 = ?',
        answer = {
            {
                label = '125'
            },
            {
                label = '145'
            },
            {
                label = '135',
                correct = true
            },
            {
                label = '155'
            },
        }
    },
    {
        question = '12 × 7 = ?',
        answer = {
            {
                label = '74'
            },
            {
                label = '76'
            },
            {
                label = '82'
            },
            {
                label = '84',
                correct = true
            },
        }
    },
    {
        question = '90 ÷ 6 = ?',
        answer = {
            {
                label = '12'
            },
            {
                label = '18'
            },
            {
                label = '15',
                correct = true
            },
            {
                label = '16'
            },
        }
    },
    {
        question = '250 + 375 = ?',
        answer = {
            {
                label = '605'
            },
            {
                label = '615'
            },
            {
                label = '595'
            },
            {
                label = '625',
                correct = true
            },
        }
    },
    {
        question = '300 - 128 = ?',
        answer = {
            {
                label = '162'
            },
            {
                label = '172',
                correct = true
            },
            {
                label = '182'
            },
            {
                label = '152'
            },
        }
    },
    {
        question = '8 × 9 = ?',
        answer = {
            {
                label = '63'
            },
            {
                label = '64'
            },
            {
                label = '72',
                correct = true
            },
            {
                label = '81'
            },
        }
    },
    {
        question = '108 ÷ 9 = ?',
        answer = {
            {
                label = '11'
            },
            {
                label = '13'
            },
            {
                label = '12',
                correct = true
            },
            {
                label = '14'
            },
        }
    },
    {
        question = '16 × 5 = ?',
        answer = {
            {
                label = '70'
            },
            {
                label = '85'
            },
            {
                label = '80',
                correct = true
            },
            {
                label = '75'
            },
        }
    },
    {
        question = '132 + 149 = ?',
        answer = {
            {
                label = '271'
            },
            {
                label = '281',
                correct = true
            },
            {
                label = '291',
            },
            {
                label = '261'
            },
        }
    },
    {
        question = '56 ÷ 7 = ?',
        answer = {
            {
                label = '6'
            },
            {
                label = '8',
                correct = true
            },
            {
                label = '9',
            },
            {
                label = '7'
            },
        }
    },
    {
        question = '9 × 6 = ?',
        answer = {
            {
                label = '48'
            },
            {
                label = '54',
                correct = true
            },
            {
                label = '56',
            },
            {
                label = '52'
            },
        }
    },
    {
        question = '63 - 28 = ?',
        answer = {
            {
                label = '25'
            },
            {
                label = '35',
                correct = true
            },
            {
                label = '38',
            },
            {
                label = '45'
            },
        }
    },
    {
        question = '45 + 37 = ?',
        answer = {
            {
                label = '72'
            },
            {
                label = '82',
                correct = true
            },
            {
                label = '74',
            },
            {
                label = '84'
            },
        }
    },
}