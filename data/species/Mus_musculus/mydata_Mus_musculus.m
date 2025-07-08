function [data, auxData, metaData, txtData, weights] = mydata_Mus_musculus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Mus_musculus'; 
metaData.species_en = 'House mouse'; 

metaData.ecoCode.climate = {'A', 'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'TH', 'TP', 'TA', 'TN'};
metaData.ecoCode.habitat = {'0iTa', '0iTs', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.9); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'xi_WE'}; 
metaData.data_1     = {'t-Wwe'; 't-Ww_f'; 't-S_f'; 'Ww-JO'}; 

metaData.COMPLETE = 4.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2010 09 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2014 07 23];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2015 10 16];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};

metaData.author_mod_3   = {'Starrlight Augustine'};    
metaData.date_mod_3 = [2018 05 02];              
metaData.email_mod_3    = {'sta@akvaplan.niva.no'};            
metaData.address_mod_3  = {'Akvaplan-niva, Tromso Norway'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2018 05 02]; 

%% set data
% zero-variate data

data.tg = 20;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.9);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from AnAge';
data.tx = 22;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';

data.tp = 26;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'BrusSchi2015';
  temp.tp = C2K(36.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
comment.tp = 'In female mice, the vagina is closed at birth and opens at around PND 26.';

data.Li  = 10.2; units.Li  = 'cm';  label.Li  = 'ultimate body length';   bibkey.Li  = 'IJssSche1977';

data.Wwb = 1; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'BerrBron1992';
data.Wwp = 10;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Laur1946';
data.Wwi = 50;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'WeinWalf1986';

data.Ri  = 5*7/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
data.xi_WE =   4.8 * 4.1858; units.xi_WE  = 'kJ/g'; label.xi_WE  = 'whole-body energy density (no reprod buffer), in dry weight';  bibkey.xi_WE  = 'Stud1979';   
  temp.xi_WE = C2K(36.9);  units.temp.xi_WE = 'K'; label.temp.xi_WE = 'temperature';
  comment.xi_WE = 'mean value from neonates to adults';
% 1 calories is equal to 4.1858 joule

% uni-variate data
% t-W data
data.tW100 = [ ... % time (month), wet weight (g)
0.79915446	19.14396489;
1.03280372	21.94552210;
1.86360787	25.21400737;
3.04721358	31.51750828;
4.58873969	38.28793726;
6.73300689	42.72373524;
8.52679973	42.95719740;
10.91635019	44.35797601;
14.26097882	46.69260701;
17.23837737	53.22957196; % outlier at line 10
22.27207509	48.32684778;
25.85919341	49.02723615;
27.77213853	49.49416235];
data.tW100(:,1) = data.tW100(:,1) * 30.5; % convert month to d
units.tW100   = {'d', 'g'};  label.tW100 = {'time', 'wet weight', 'max food'};  
temp.tW100    = C2K(36.9);  units.temp.tW100 = 'K'; label.temp.tW100 = 'temperature';
bibkey.tW100 = 'WeinWalf1986';
comment.tW100 = 'max food (constant intake)';
%
data.tW75 = [ ... % time (month), wet weight (g)
0.56643656	15.87548335;
1.03745809	19.61089296;
2.58038050	25.68093171;
3.29482594	27.31517434;
4.48680951	29.41634131;
6.63433382	32.21789852;
7.82864457	33.15175092;
9.14117579	34.78598982;
11.17373768	35.25291789;
14.87907838	36.65369462;
17.26258008	41.08949447; % outlier at line 11
22.89203639	37.35408486;
26.36047073	37.58754703;
28.39535789	36.88716053;
31.02647291	37.12062270;
33.30013202	36.65369462;
35.45603418	35.25291789];
data.tW75(:,1) = data.tW75(:,1) * 30.5; % convert month to d
units.tW75   = {'d', 'g'};  label.tW75 = {'time', 'wet weight', '75% of max food'};  
temp.tW75    = C2K(36.9);  units.temp.tW75 = 'K'; label.temp.tW75 = 'temperature';
bibkey.tW75 = 'WeinWalf1986';
comment.tW75 = '75% of max food (constant intake)';
%
data.tW44 = [ ... % time (month), wet weight (g)
0.81311757	12.14007375;
0.81777193	9.80544835;
1.40841071	13.54085422;
2.72187376	14.70816879;
5.22638854	18.44357839;
7.01971595	18.91050273;
8.69528736	18.44357839;
10.36853160	19.14396489;
12.28287303	18.91050273;
13.83603506	19.84435513;
15.38780077	21.47859777;
17.54277398	20.54474536;
22.44568252	21.24513560;
27.47100047	20.54474536;
30.93710762	21.94552210;
32.97106775	21.71205993;
35.12464272	21.47859777;
38.71316119	21.47859777;
40.98914364	19.84435513;
42.66192436	20.77820753;
45.89019427	21.47859777];
data.tW44(:,1) = data.tW44(:,1) * 30.5; % convert month to d
units.tW44   = {'d', 'g'};  label.tW44 = {'time', 'wet weight', '44% of max food'};  
temp.tW44    = C2K(36.9);  units.temp.tW44 = 'K'; label.temp.tW44 = 'temperature';
bibkey.tW44 = 'WeinWalf1986';
comment.tW44 = '44% of max food (constant intake)';

% t-survival data
data.tS100 = [ ... % time (month), surviving %
2.9812175515872585   99.73307202577274;
6.455895984392862    97.69141545992184;
9.512486015128768    95.66240157777212;
13.893788344201628   93.76968277306717;
18.48160566484727    91.34231941819203;
20.285702720495824   89.70322628947888;
22.08807982567813    87.71213887750436;
22.288860969806112   85.94517543831446;
22.62647012055574    83.64633523139112;
24.149329792247592   81.48734682318302;
24.211360114338483   79.90159300217542;
24.479171461153154   77.60420292954846;
25.01589721505645    75.47536714397613;
25.02673863324448    73.18706382424402;
25.28621163100544    71.41799775040081;
25.972845346738808   69.28495669552186;
26.451450114218748   67.33389917883999;
26.711184515257234   65.21072670151226;
26.78989153545555    63.27652188062312;
26.978998990908327   60.97979221299464;
27.318846678678337   59.208623504498135;
27.449262280498136   57.26809497036592;
27.718744425959972   55.32336116692714;
28.335009470548737   53.01609461210741;
28.533863106006653   50.897473415868646;
28.85395828202343    48.774565100540286;
28.872305778778017   46.83614710570296;
28.932926705499266   44.901950189455405;
29.40209600844076    42.94872399762038;
29.86902489706001    40.645604576249;
29.879032793226312   38.53323314811186;
29.928811675992247   36.41875118067986;
30.198293821454083   34.47401737724107;
30.397408547305883   32.35532223586088;
30.668558362578455   30.76258429661176;
30.79704457842635    28.470001762431604;
31.205854670807742   26.521054785044615;
31.266475284645356   24.58257074970746;
31.454486876147957   22.11182160827931;
31.46366062452525    20.17551415273687;
31.65443574978877    18.23288298395138;
31.78375580054203    16.116298381866073;
32.19199314841194    13.991279527242842;
32.391680618775226   12.048656263098902;
32.87195305606592    10.449594610606717;
33.76603953382114    7.957771694796104;
34.66179399427077    5.818010683675016;
34.72408290368641    4.231654593527221;
35.54003479287117    1.7419422170114771;
35.5483747063431     0.018367306436127606];
data.tS100(:,1) = data.tS100(:,1) * 30.5; % convert month to d
data.tS100(:,2) = data.tS100(:,2)/100; % convert % to fraction
units.tS100   = {'d', '-'};  label.tS100 = {'time', 'surviving fraction', '100% of max food'};  
temp.tS100    = C2K(36.9);  units.temp.tS100 = 'K'; label.temp.tS100 = 'temperature';
bibkey.tS100 = 'WeinWalf1986';
comment.tS100 = '100% of max food (constant intake)';
%
data.tS75 = [ ... % time (month), surviving %
3.050907665374792    99.73096464833449;
17.886217326475162   98.05052409241625;
19.479599382441705   96.0650960363655;
19.820494720993743   94.47090954374828;
22.04189706004392    92.64284401581158;
22.244087599541537   91.22854475045138;
25.998384898312192   89.35412561397895;
28.15085410191516    87.70449796946701;
28.976241768522033   85.39090770140423;
29.45708820185877    83.96818208814767;
29.518541399067185   82.20543182290598;
29.718490272708      80.26280065412048;
30.336996983153565   78.48386600272606;
30.4690802547841     76.89533333278354;
31.157378511491796   75.11362773709581;
31.49665533205216    73.16678339436213;
31.549508776929347   71.40470143876045;
31.55785025481948    69.6440617128136;
31.610965102974173   67.88197185257037;
31.663818547851353   66.29555762656429;
31.672992296228646   64.35925017102183;
31.787560341591753   62.77071750107933;
31.795901819481887   61.0100777751325;
32.47669399762303    59.404700314038806;
32.53731492434429    57.46628231920151;
32.66913679269729    55.87775755390054;
33.07044237093035    54.10513871110763;
33.078782284402266   52.344829187660025;
33.26288516600461    50.4021319783747;
33.27039093168753    48.817886427521756;
33.38469913819132    47.05336373012598;
33.39387319945226    45.11699023408369;
33.51652131942798    43.52853150928259;
33.926165246714746   41.75558246399042;
34.12778210304995    40.16501319989446;
34.186473330915646   37.874475164509334;
34.24792840542591    36.1121211422667;
34.93873004415157    34.85880558586254;
35.34780153981049    32.909850703833996;
35.618951355083055   31.317112764584866;
35.671805112843884   29.202638701794424;
35.678476730737785   27.794457123536194;
36.15040956744018    25.843333566354485;
36.419891712902015   23.898599762915676;
36.55280913232157    22.486131065567857;
36.61400249067067    20.723718907466935;
36.67295543469753    18.433239007940106;
36.73665061064638    17.198886686623545;
37.007800738802615   15.606214787874254;
37.208583447348786   13.8395815511836;
37.40019240751769    12.07294831449294;
37.409366155894986   10.136640858950496;
38.36714812248272    8.346839117865617; 
38.56959881372329    6.932267785864479;
38.701420682076304   5.343743020563526;
39.530144001188305   3.734210521379957;
40.148076715587806   1.7789398307499145;
42.22908326139783    0.22063917915667197];
data.tS75(:,2) = data.tS75(:,2)/100; % convert % to fraction
data.tS75(:,1) = data.tS75(:,1) * 30.5; % convert month to d
units.tS75   = {'d', '-'};  label.tS75 = {'time', 'surviving fraction', '75% of max food'};  
temp.tS75    = C2K(36.9);  units.temp.tS75 = 'K'; label.temp.tS75 = 'temperature';
bibkey.tS75 = 'WeinWalf1986';
comment.tS75 = '75% of max food (constant intake)';
%
data.tS44 = [ ... % time (d), surviving %
18.096903056993      98.39619940521948;
22.410936791592984   97.03325394313052;
24.98248350971932    95.54664660172809;
25.114305378072338   93.95812183642713;
25.943602380346746   92.52485933597934;
29.980726311901602   91.52233371458397;
31.15706761658046    89.72653055811371;
31.359255027241655   88.31157088775502;
31.98052621009906    87.06095233050281;
32.741954481526776   85.98112792389955;
32.87294407939264    84.21693542900299;
34.539302436949114   82.93405370982016;
35.29656309826818    80.97456984524192;
35.571309656439766   80.08581572973058;
35.632504579207065   78.3237337741289;
37.29969520725071    77.21651978454165;
37.57110642580081    75.62377394065095;
37.774132364622005   74.38580280988485;
37.84309164039696    74.20736413599592;
38.394565019319415   72.95819571304008;
38.73550950969053    71.36334723449609;
39.00249171485447    70.47526142862476;
39.00999779342102    68.89094983727199;
39.0664479811972     67.65652357081404;
39.61541829098533    65.87903114907445;
39.67770688751732    64.29260901842683;
39.80452574643812    63.23030561725632;
39.88156509682568    61.648096660556845;
40.28563358305237    60.22536314265875;
41.533746696572635   58.95512884996201;
41.593532223970314   56.84038272053061;
41.72702176213406    55.60385381941934;
41.86051442913423    54.36798532330654;
42.06296324307296    52.95301774830632;
43.79911752726255    51.668289651828005;
44.00214065013097    50.42972415656325;
44.552208075403826   48.82861800527604;
45.17180845961407    47.22534317883567;
45.442124439981285   45.45660730749171;
45.71494255083188    44.21599731343194;
46.47804099513948    43.48869709501713;
46.67965785147469    41.89812783092114;
46.81064588492232    40.133605133525364;
47.15132897201592    38.538764559622905;
47.28508053922448    37.302359834869776;
47.5562306673807     35.709687936120474;
47.61909200842419    34.299337682709094;
47.682214752745196   32.888979524656136;
47.746744076483054   31.830691175934252;
48.22618267886838    30.05563159134724;
48.283467640200854   27.76515169182041;
48.28513562289524    27.413089787130883;
48.555451603262455   25.996415820476432;
48.68894145430984    24.759952959865007;
48.8207636355465     23.1714942350639;
49.14919841215155    20.34235947570318;
49.210391770500664   18.936214491598413;
49.22540361475011    17.17380233349749;
49.26767673183315    15.76344417544454;
49.27351451482167    14.531260529281138;
49.402000730669556   13.470861641264396;
49.46345549229618    11.70844157852192;
49.94680280458175    10.813577680550175;
50.35837611784042    9.392682635305995;
50.559731258014466   7.802055235351723;
50.69264867743401    6.389586538003908;
51.033332077411245   4.794812004601301;
51.303648057778446   3.026076133257332;
51.370106767488224   2.3198417845834207;
51.850379517662546   0.7208461725910826;
52.194659973422446   0.16987849657387777];
data.tS44(:,2) = data.tS44(:,2)/100; % convert % to fraction
data.tS44(:,1) = data.tS44(:,1) * 30.5; % convert month to d
units.tS44   = {'d', '-'};  label.tS44 = {'time', 'surviving fraction', '44% of max food'};  
temp.tS44    = C2K(36.9);  units.temp.tS44 = 'K'; label.temp.tS44 = 'temperature';
bibkey.tS44 = 'WeinWalf1986';
comment.tS44 = '44% of max food (constant intake)';

% foetal growth
data.tW_e = [ ... d(since conception), g (wet weights)
8	0.0008
9	0.00147
10	0.086
11	0.0329
12	0.0762
13	0.1298
14	0.2288
15	0.3651
16	0.5926
17	0.8467
18	1.19
];
units.tW_e   = {'d', 'g'};  label.tW_e = {'age', 'wet weight'};  
temp.tW_e    = C2K(36.9);  units.temp.tW_e = 'K'; label.temp.tW_e = 'temperature';
comment.tW_e = 'mixed - vegetables, cereals, milk';
bibkey.tW_e = 'MacDAlle1927';

data.tW1 = [ ... Age [weeks]	wet weight [g]
3	12.9
4	14.3
5	15.2
6	16.6
7	16.2
8	16.6
9	16.8
10	17.3
];
data.tW1(:,1) = data.tW1(:,1) * 7; % convert to days
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight (male)'};  
temp.tW1    = C2K(36.9);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
comment.tW1 = 'page 129, Table 1';
bibkey.tW1 = 'IshiHata2005';


data.tW2 = [ ... Age [months]	wet weight [g]
1.075	14.92
1.698	19.59
2.208	23.28
3.283	25.08
4.415	27.5
5.491	28.63
6.906	29.08
8.208	29.98
10.13	29.68
12.4	32.39
15.34	33.45
18.4	32.84
21.45	33.22
24.28	31.04
];
data.tW2(:,1) = data.tW2(:,1) * 30.5; % convert to days
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight (male)'};  
temp.tW2    = C2K(36.9);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
comment.tW2 = 'page 1046, Figure 1, standard rodent diet (8640 Harlan Teklad 22/5 [W]';
bibkey.tW2 = 'HallFerg2002';

% t-Ww 
data.tWm = [ ... day since birth, wet weight g
1	1.38
3	1.79
5	2.46
7	3.19
9	3.89
11	4.50
13	5.06
15	5.49
17	5.80
19	6.20
21	6.78
    ];
units.tWm   = {'d', 'g'};  label.tWm = {'time since birth', 'wet weight', 'male'};  
temp.tWm    = C2K(36.9);  units.temp.tWm = 'K'; label.temp.tWm = 'temperature';
comment.tWm = 'page 190, Table 4, Figure 4 - male';
bibkey.tWm = 'Gate1925';

data.tWf = [ ...
1	1.38
3	1.88
5	2.52
7	3.27
9	4.00
11	4.60
13	5.17
15	5.64
17	6.00
19	6.43
21	7.01
];
units.tWf   = {'d', 'g'};  label.tWf = {'time since birth', 'wet weight', 'female'};  
temp.tWf    = C2K(36.9);  units.temp.tWf = 'K'; label.temp.tWf = 'temperature';
comment.tWf = 'page 190, Table 4, Figure 4, females';
bibkey.tWf = 'Gate1925';


data.tW3 = [ ...    Age [days] postnatal day	wet weight [g]
0	1.457
0.7895	1.692
1.842	1.927
3.026	2.397
5.132	3.618
5.789	4.511
6.842	5.639
9.868	6.673
11.97	8.083
13.95	9.445
14.74	10.06
16.84	10.29
18.55	10.39
20	10.34
21.05	11
21.97	11.37
24.08	11.42
25.92	12.03
27.11	12.41
28.82	13.06
30.79	13.25
32.89	14.38
33.82	14.85
34.87	15.04
36.05	14.99
36.97	15.32
37.76	16.02
40.66	16.64
42.11	16.82
42.76	17.25
44.61	17.72
46.97	19.08
48.03	19.17
49.74	19.03
51.05	19.03
53.03	19.27
56.05	19.31
58.95	19.69
62.11	20.3
];
units.tW3   = {'d', 'g'};  label.tW3 = {'time since birth', 'wet weight'};  
temp.tW3    = C2K(36.9);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
comment.tW3 = 'page 76, Figure 3, wild type';
bibkey.tW3 = 'BakeLiu1993';

% respiration as function of weight
WJO = [ ... log_e (body mass in gram), log e (resting metabolic rate in ml O2/min)
3.271	-0.811
3.39	-0.803
3.34	-0.603
3.351	-0.553
3.353	-0.509
3.33	-0.486
3.341	-0.33
3.372	-0.294
3.371	-0.536
3.421	-0.42
3.432	-0.322
3.429	-0.249
3.456	-0.236
3.449	-0.234
3.448	-0.461
3.466	-0.468
3.459	-0.684
3.476	-0.624
3.505	-0.518
3.524	-0.397
3.497	-0.37
3.491	-0.322
3.487	-0.251
3.487	-0.2
3.483	-0.157
3.5		-0.145
3.509	-0.117
3.552	-0.095
3.541	-0.215
3.576	-0.245
3.58	-0.286
3.568	-0.353
3.576	-0.482
3.621	-0.47
3.597	-0.26
3.637	-0.276
3.667	-0.31
3.673	0.034
3.757	-0.096];
% remove log e scale:
data.WJO = [exp(WJO(:,1)), exp(WJO(:,2))]; % g dry weight, ml/mon O2
units.WJO   = {'d', 'ml/min'};  label.WJO = {'wet weight', 'O_2 consumption'};  
temp.WJO    = C2K(36.9);  units.temp.WJO = 'K'; label.temp.WJO = 'temperature';
comment.WJO = 'Food: mixed - vegetables, cereals, milk. High food intake and low food intake strains combined';
bibkey.WJO = 'SelmLums2001';


%% set weights for all real data
weights = setweights(data, []);
weights.Wwb  = weights.Wwb * 10;

weights.Wwp  = weights.Wwp * 3;
weights.tp  = weights.tp * 3; 
weights.tW100(10) = 0; % outlier
weights.tW75(11)  = 0; % outlier
weights.tW100 = weights.tW100 * 20; % outlier
weights.tW75  = weights.tW75 * 5; % outlier

weights.tW1 = 0 * weights.tW1; % this curve is strange- the animals are quite heavy at start and then don't grow.


%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
% data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
% weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW100','tW75','tW44'}; subtitle1 = {'Data at 100, 75, 44 % of max intake'};
set2 = {'tS100','tS75','tS44'}; subtitle2 = {'Data at 100, 75, 44 % of max intake'};
set3 = {'tWm', 'tWf'}; subtitle3 = {'males, females'};
metaData.grp.sets = {set1,set2, set3};
metaData.grp.subtitle = {subtitle1,subtitle2, subtitle3};

%% Discussion points
D1 = 'version 20151106: V0 morphic feeding (ie contant feeding irrespective of size) is assumed for growth and survival data from WeinWalf1986';
D2 = 'version 20180502: isomorphic feeding used for WeinWalf1986';     
D3 = 'version 20180502: t_0 is fixed and not estimated';     
D4 = 'version 20180502: addition of datasets: Ww-JO SelmLums2001, t-Ww by BakeLiu1991, Gate1925, IshiHata2005, HallFerg2002';     
D5 = 'version 20180502: the growth curve by IshiHata2005 weight zero, because of the strange morphology with respect to the other curves';     
D6 = 'version 20180502: the fit could be improved in some of the growth cuves by assuming higher f during the milking stage.';     
D7 = 'version 20180502: MacDAlle1927 state that males and females differ, but we did not find data to support this. Hence this entry assumes same parameters for males and females.';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3, 'D4', D4, 'D5', D5, 'D6', D6, 'D7', D7);

%% Facts
F1 = 'This entry is discussed in LeeuKelp2002';
metaData.bibkey.F1 = 'LeeuKelp2002'; 
F2 = 'Time from conception to start of development (T_0) is taken to be 7.2 d';
metaData.bibkey.F2 = 'MacDAlle1927'; 
F3 = 'Male and female mice differ in development over the course of their lives.';
metaData.bibkey.F3 = 'MacDAlle1927';
F4 = 'Female mice can resorbe their fetuses, maybe even a third of them';
metaData.bibkey.F4 = 'Laur1946';
F5 = 'Equal weight at birth for males and females, some light differences in growth between males and females become apparent after birth.';
metaData.bibkey.F5 = 'Gate1925';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4,'F5',F5);

%% Links
metaData.links.id_CoL = '7VW9H'; % Cat of Life
metaData.links.id_ITIS = '617395'; % ITIS
metaData.links.id_EoL = '328450'; % Ency of Life
metaData.links.id_Wiki = 'Mus_musculus'; % Wikipedia
metaData.links.id_ADW = 'Mus_musculus'; % ADW
metaData.links.id_Taxo = '63058'; % Taxonomicon
metaData.links.id_WoRMS = '993616'; % WoRMS
metaData.links.id_MSW3 = '13001562'; % Mammal Spec World
metaData.links.id_AnAge = 'Mus_musculus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mus_musculus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BerrBron1992'; type = 'Article'; bib = [ ... 
'author = {Berry, R. J. and Bronson, F. H.}, ' ... 
'year = {1992}, ' ...
'title = {Life History AND BIOECONOMY OF THE House Mouse}, ' ...
'journal = {Biological Reviews}, ' ...
'volume = {67}, ' ...
'number = {4}, ' ...
'pages = {519--550}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'BrusSchi2015'; type = 'Article'; bib = [ ... 
'author = {V. Brust and P. M. Schindler and L. Lewejohann}, ' ... 
'year = {2015}, ' ...
'title = {Lifetime development of behavioural phenotype in the house mouse (\emph{Mus musculus})}, ' ...
'journal = {Frontiers in Zoology}, ' ...
'volume = {12}, ' ...
'number = {Suppl 1}, '...
'pages = {S17}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Laur1946'; type = 'Article'; bib = [ ... 
'author = {Laurie, E. M. O.}, ' ... 
'year = {1946}, ' ...
'title = {The Reproduction of the House-Mouse (\emph{Mus musculus}) Living in Different Environments}, ' ...
'journal = {Proceedings of the Royal Society of London B: Biological Science}, ' ...
'volume = {133}, ' ...
'pages = {248--281}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'IJssSche1977'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Ijselling, M. A. and Scheygrond, A.}, ' ...
'year = {1977}, ' ...
'title  = {Wat is dat voor een dier?}, ' ...
'publisher = {W.J. Thieme}, ' ...
'address = {Zutphen}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MacDAlle1927'; type = 'Article'; bib = [ ... 
'author = {MacDowell, E. C. and Allen, E. and Macdowell, C. G.}, ' ... 
'year = {1927}, ' ...
'title = {The prenatal growth of the mouse}, ' ...
'journal = {J. Gen. Physiol.}, ' ...
'volume = {11}, ' ...
'pages = {57--70}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WeinWalf1986'; type = 'Article'; bib = [ ... 
'author = {Weindruch, R. and Walford, R. L. and Fligiel, S. and Guthrie, D.}, ' ... 
'year = {1986}, ' ...
'title = {The retardation of aging in mice by dietary restriction: {L}ongevity, cancer, immunity and lifetime energy intake}, ' ...
'journal = {J. Nutr.}, ' ...
'volume = {116}, ' ...
'pages = {641--654}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LeeuKelp2002'; type = 'Article'; bib = [ ... 
'author = {Leeuwen, I. M. M. van and Kelpin, F. D. L. and Kooijman, S. A. L. M.}, ' ... 
'year = {2002}, ' ...
'title = {A mathematical model that accounts for the effects of caloric restriction on body weight and longevity}, ' ...
'journal = {Biogerontology}, ' ...
'volume = {3}, ' ...
'pages = {373--381}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Mus_musculus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Stud1979'; type = 'Article'; bib = [ ... 
'author = {E. H. Studier}, ' ... 
'year = {1979}, ' ...
'title = {Bioenergetics of growth, pregnancy and lactation in the laboratory mouse, \emph{Mus musculus}}, ' ...
'journal = {Comparative Biochemistry and Physiology Part A: Physiology}, ' ...
'number = {4}, ' ...
'volume = {64}, ' ...
'doi = {10.1016/0300-9629(79)90574-7}, ' ...
'url = {http://www.sciencedirect.com/science/article/pii/0300962979905747}, ' ...
'pages = {473 - 481}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SelmLums2001'; type = 'Article'; bib = [ ... 
'author = {E. H. Studier}, ' ... 
'year = {2001}, ' ...
'title = {Resting metabolic rate and morphology in mice (\emph{Mus musculus}) selected for high and low food intake}, ' ...
'journal = {Journal of Experimental Biology}, ' ...
'number = {4}, ' ...
'volume = {204}, ' ...
'pages = {777--784}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gate1925'; type = 'Article'; bib = [ ... 
'author = {Gates, W. H.}, ' ... 
'year = {1925}, ' ...
'title = {Litter size, birth weight, and early growth rate of mice (\emph{Mus musculus})}, ' ...
'journal = {The Anatomical Record}, ' ...
'number = {3}, ' ...
'volume = {29}, ' ...
'doi = {10.1002/ar.1090290302}, ' ...
'pages = {183--193}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'IshiHata2005'; type = 'Article'; bib = [ ... 
'author = {A. Ishikawa and S. Hatada and Y. Nagamine and T. Namikawa}, ' ... 
'year = {2005}, ' ...
'title = {Further mapping of quantitative trait loci for postnatal growth in an intersubspecific backcross of wild \emph{Mus musculus castaneus} and C57BL/6J mice}, ' ...
'journal = {Genet. Res., Camb.}, ' ...
'volume = {85}, ' ...
'pages = {127-137}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BakeLiu1993'; type = 'Article'; bib = [ ... 
'author = {J. Baker and J.-P. Liu and E. J. Robertson and A. Efstratiadis}, ' ... 
'year = {1993}, ' ...
'title = {Role of Insulin-like Growth Factors in Embryonic and Postnatal Growth}, ' ...
'journal = {Cell}, ' ...
'volume = {75}, ' ...
'pages = {73--82}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HallFerg2002'; type = 'Article'; bib = [ ... 
'author = {B. P. Halloran and V. L. Ferguson and S. J. Simske and A. Burghardt and L. L. Venton and S. Majumdar}, ' ... 
'year = {2002}, ' ...
'title = {Changes in Bone Structure and Mass With Advancing Age in the Male C57BL/6J Mouse}, ' ...
'journal = {Journal of Bone and Mineral Research}, ' ...
'volume = {17}, ' ...
'number = {6}, ' ...
'pages = {1044--1050}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

