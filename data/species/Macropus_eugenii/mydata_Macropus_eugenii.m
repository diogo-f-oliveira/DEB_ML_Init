function [data, auxData, metaData, txtData, weights] = mydata_Macropus_eugenii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Diprotodontia'; 
metaData.family     = 'Macropodidae';
metaData.species    = 'Macropus_eugenii'; 
metaData.species_en = 'Tammar wallaby'; 

metaData.ecoCode.climate = {'BSh', 'Csa', 'Csb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTa', '0iTs', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lx'; 'Lp'; 'Li'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'pXi'; 'pAi'; 'pL'}; 
metaData.data_1     = {'t-L'; 'Ww-JO'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Jessica Ridenour'};    
metaData.date_subm = [2011 07 07];              
metaData.email    = {'jessroberts09@gmail.com'};            
metaData.address  = {'Melbourne University'};   

metaData.author_mod_1   = {'Jessica Ridenour'};    
metaData.date_mod_1     = [2013 07 07];              
metaData.email_mod_1    = {'jessroberts09@gmail.com'};            
metaData.address_mod_1  = {'Melbourne University'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 11 14];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 14]; 

%% set data
% zero-variate data

data.tg = 28;   units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'HindPool1990';   
  temp.tg = C2K(36.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 255;  units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'MurpSmit1970';   
  temp.tx = C2K(36.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'permanent pouch exit is 245-270 days';
data.tp = 11*30.5;      units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'HindPool1990';
  temp.tp = C2K(36.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'generation time: 1 yr for females, 1.5 yr for males';
data.am = 15.1*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(36.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.6; units.Lb  = 'cm';  label.Lb  = 'head length at birth';       bibkey.Lb  = 'MurpSmit1970';
  comment.Lb = 'on the basis of tL data';
data.Lx  = 8;   units.Lx  = 'cm';  label.Lx  = 'head length at weaning';     bibkey.Lx  = 'MurpSmit1970';
  comment.Lx = 'on the basis of tL data';
data.Lp  = 8.8; units.Lp  = 'cm';  label.Lp  = 'head length st puberty';     bibkey.Lp  = 'MurpSmit1970';
  comment.Lp = 'on the basis of tL data';
data.Li  = 9.1; units.Li  = 'cm';  label.Li  = 'ultimate head length';       bibkey.Li  = 'MurpSmit1970';
  comment.Li = 'on the basis of tL data';

data.Wwb = 0.370;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = {'TyndRenf1987','HindPool1990'};
  comment.Wwb = 'on the basis of tL data';
data.Wwx = 1580;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'MurpSmit1970';
  comment.Wwx = 'on the basis of tL data';
data.Wwp = 2700;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'MurpSmit1970';
  comment.Wwp = 'on the basis of tL data';
data.Wwi = 5000;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'MurpSmit1970';
  comment.Wwi = '5 kg is typical for 3 yr old. Pers comm Geoff Shaw';
  
data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'HindPool1990';   
  temp.Ri = C2K(36.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
data.pL  = .1*2.08e7/365*data.Wwi/1000; units.pL  = 'J/d'; label.pL  = 'average yearly milk production'; bibkey.pL  = 'CorkDove1989';   
  temp.pL = C2K(36.5);  units.temp.pL = 'K'; label.temp.pL = 'temperature';
data.pX  = 1.915e6; units.pX  = 'J/d'; label.pX  = 'food intake'; bibkey.pX  = 'Frap2008';   
  temp.pX = C2K(36.5);  units.temp.pX = 'K'; label.temp.pX = 'temperature';
  comment.pX = 'for a 4.3 kg animal (not reproducing)';
data.pP  = 1.73e5 * 4.3^.75; units.pP  = 'J/d'; label.pP  = 'faeces production'; bibkey.pP  = 'Frap2008';   
  temp.pP = C2K(36.5);  units.temp.pP = 'K'; label.temp.pP = 'temperature';
  comment.pP = 'for a 4.3 kg animal (not reproducing)';
data.pA  = 1.133e6; units.pA  = 'J/d'; label.pA  = 'assimilation'; bibkey.pA  = 'Frap2008';   
  temp.pA = C2K(36.5);  units.temp.pA = 'K'; label.temp.pA = 'temperature';
  comment.pA = 'for a 4.3 kg animal (not reproducing)';

% uni-variate data
% t-W data
% WL = [ ... % wet weight^(1/3), g^(1/3), head length (mm)
% 0.6962	8.08
% 1.2101	12.22
% 1.5345	16.627
% 1.9942	21.302
% 2.1835	23.171
% 2.3998	24.64
% 2.3997	26.511
% 2.6972	28.246
% 2.8595	29.447
% 3.0218	30.248
% 2.9676	31.318
% 3.1839	33.588
% 3.3192	34.79
% 3.5356	35.457
% 3.806	37.86
% 3.7248	37.993
% 4.1035	40.798
% 3.9412	39.998
% 4.1034	42.268
% 4.4009	43.87
% 4.6444	44.537
% 4.7255	46.273
% 4.3737	45.474
% 4.6442	47.476
% 4.5361	46.274
% 4.8336	48.143
% 5.2122	50.814
% 5.4015	52.683
% 5.6992	52.681
% 5.8614	54.551
% 6.0237	56.287
% 6.1048	57.356
% 6.1859	58.692
% 6.3753	59.091
% 6.4834	60.293
% 6.7269	59.624
% 6.6458	60.426
% 6.6726	61.896
% 7.1598	62.561
% 7.6197	64.696
% 8.1066	66.698
% 8.8643	67.227
% 8.8641	69.633
% 9.8382	71.764
% 11.1639	75.097
% 11.6505	80.707
% 12.733	81.234
% 12.5976	82.839
% 12.9222	84.841
% 12.6515	85.377
% 13.5988	83.501
% 13.5986	86.04
% 13.5714	88.578
% 14.1126	87.774
% 14.0314	88.576];
% WL(:,1) = WL(:,1).^3; % convert g^1/3 to g
% LW = WL(:,[2 1]); %LW_knot = knot([0:10:90]', LW);
% L = linspace(5,90,100)'; %EW_knot = spline(L, LW_knot);
% EW_knot = (L < 58) .* (.1 * L).^3 + (L >= 58) .* (.1 * 58 +  .27 * (L - 58)).^3;
%
data.tL = [... % time since birth (d), head length (mm) --> from Murphy and Smith 1970
    2.7542      8.327
    3.9531      9.209
    7.1634      10.984
    10.8399     10.167
    13.2434     11.684
    15.2463     12.948
    17.8929     12.736
    18.8742     14.234
    22.1246     14.277
    21.2806     15.627
    24.3392     15.173
    24.4995     17.031
    26.5394     16.686
    27.5238     18.061
    29.1746     16.968
    30.7769     17.981
    31.3578     19.226
    32.9915     18.876
    33.9815     20.003
    35.4207     19.28
    37.0001     21.28
    40.0387     21.693
    39.0544     20.318
    44.6653     23.734
    43.0659     22.599
    44.5164     21.381
    46.4765     24.501
    48.113      24.027
    50.9313     25.179
    51.9327     25.811
    57.1974     26.623
    59.02       26.895
    65.2888     28.216
    64.6194     30.806
    70.7052     31.258
    72.7793     29.43
    73.2946     33.519
    76.7452     33.689
    76.994      31.713
    79.1772     33.969
    85.6663     34.551
    88.0955     34.954
    88.2673     36.318
    86.9912     38.775
    91.3115     36.482
    92.0242     40.822
    94.2902     39.491
    93.9581     36.27
    99.9439     41.052
    101.0139	38.715
    105.0368	40.501
    108.0582	41.655
    108.3931	44.753
    114.3214	43.223
    113.6291	46.802
    118.9594	44.769
    120.4788	49.367
    122.2097	44.813
    118.7363	45.633
    129.0709	46.884
    112.6934	43.325
    125.4343	45.97
    133.7318	47.441
    135.9405	48.585
    135.0281	52.903
    141.0881	54.469
    146.653     51.078
    147.6543	51.71
    148.9879	55.564
    150.3096	51.127
    151.6602	54.238
    154.7245	53.537
    154.5584	51.926
    157.3796	52.953
    160.4296	52.871
    164.0576	54.156
    168.3322	53.841
    166.6699	55.429
    162.1665	56.853
    169.7944	56.522
    175.2105	55.171
    178.2006	57.686
    180.6126	58.832
    178.9617	59.923
    177.72      60.896
    176.8359	63.978
    165.7288	60.984
    184.8586	59.754
    185.4338	61.247
    184.3152	65.686
    191.7141	62.073
    189.2678	62.412
    195.8197	60.272
    189.9747	66.999
    197.8487	69.207
    197.5567	64.254
    199.8113	63.418
    203.0987	61.854
    205.6653	65.105
    204.4093	66.697
    205.1048	71.779
    210.2719	68.012
    212.3951	72.866
    213.1359	67.184
    216.5293	69.828
    219.9885	69.627
    225.4391	71.184
    227.7194	69.235
    234.8126	78.857
    247.7048	74.946
    249.9681	73.738
    251.4504	79.945
    262.7579	83.065
    270.2742	83.166
    265.1096	78.024
    266.357     76.803
    276.0765	78.294
    278.2882	79.313
    275.9194	85.097
    283.8363	85.45
    285.7902	80.032
    283.5814	78.889
    291.0405	81.463
    289.0462	79.828
    289.9134	86.273
    297.2037	87.361
    296.3366	80.915
    303.8875	88.316
    303.2206	81.996
    298.1334	82.3
    305.4523	82.15
    310.1275	82.089
    312.1332	83.229
    316.8054	83.291
    319.8498	83.456
    320.5224	89.527
    325.5924	89.966
    333.6636	83.639
    332.0645	91.29
    338.5104	84.942
    335.4519	85.396
    339.9899	91.272
    344.7079	89.355
    346.2873	91.356
    340.7307	85.59
    345.8208	85.163
    347.6148	86.672
    353.7462	85.145
    360.5103	91.421
    359.008     86.08
    355.7577	86.038
    361.8405	86.614
    368.0295	91.398
    374.7418	91.117
    375.4397	87.29
    373.434     86.15
    383.3623	87.396
    381.1477	86.5
    388.8558	87.098
    406.063     89.926
    409.5507	88.488
    410.2662	92.704
    416.9756	92.546
    422.2688	92.122
    423.1785	87.927
    429.6905	87.519
    434.9779	87.342
    429.768     92.964
    435.6677	92.671
    442.7833	92.519];
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
% convert head length (cm) to wet weight (g)
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'head length'};
temp.tL = C2K(36.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MurpSmit1970';

% O2 consumption (all resting, but this is a mix of fasted and fed animals)
% from Frappell 2008
data.WJO = [... % Mass (in g), rate of oxygen consumption (mL per min)
    0.289267738	0.005988251
    0.36032965	0.004898916
    0.390391183	0.007256046
    0.395548735	0.006534314
    0.400866718	0.005885725
    0.403552461	0.009266164
    0.434210179	0.008344494
    0.445964203	0.006478881
    0.457930953	0.00682653
    0.467196951	0.00910542
    0.476650442	0.00805935
    0.486295219	0.007321499
    0.509448162	0.006709652
    0.516297474	0.010471285
    0.586003217	0.010023052
    0.622157012	0.011426152
    0.626325365	0.01372461
    0.63474604	0.010563309
    0.638998737	0.009596216
    0.68738492	0.011132687
    0.74954895	0.010942083
    0.785416463	0.015509579
    0.790678628	0.012042038
    0.822810831	0.012470963
    0.873775775	0.015922087
    0.909284944	0.012802654
    0.933899193	0.014216739
    0.959179747	0.018471408
    1.024943676	0.010565742
    1.059741642	0.020155798
    1.066841742	0.017836104
    1.14788928	0.015653087
    1.14788929	0.015653087
    1.163322157	0.021802184
    1.302566786	0.012691121
    1.392194777	0.015653087
    1.955689932	0.0365006
    2.04880205	0.030654907
    2.04880206	0.040179081
    2.104262908	0.02834001
    2.189777555	0.037471407
    2.355591616	0.034946203
    2.355591617	0.02834001
    2.692154624	0.040179081
    3.199631767	0.045404615
    3.243396173	0.052215567
    3.265878322	0.062172739
    3.421369661	0.053604346
    3.60827808	0.045803641
    3.730783093	0.054563221
    3.934594676	0.079396252
    4.068178498	0.066099778
    4.835039206	0.057477782
    5.065239676	0.048272523
    5.067572842	0.091306144
    5.308844442	0.058505945
    5.561603196	0.067857835
    5.600154388	0.078704579
    5.945659033	0.061645304
    7.069683964	0.098764302
    7.309707519	0.137625845
    7.865023055	0.134060242
    8.984625926	0.117625098
    11.64662253	0.129479198
    12.20393821	0.15153048
    13.13106648	0.152862163
    13.39676687	0.202115677
    14.31858164	0.145044077
    15.10080154	0.193463927
    16.03245391	0.182011991
    17.25043297	0.240657832
    17.36600813	0.191866874
    18.43741368	0.121842836
    19.71060705	0.286615716
    21.35010425	0.304649171
    21.35010426	0.267300641
    22.81917821	0.251420103
    27.12688961	0.193508479
    30.7893131	0.214931466
    36.36637393	0.242884612
    41.5527719	0.369232567
    46.21681361	0.299502188
    47.14113124	0.265033029
    51.74876623	0.24082413
    55.69292145	0.755440041
    57.20052304	0.492606343
    63.19751476	0.571347064
    63.2120682	0.884097169
    68.45418434	0.640029512
    88.18607228	0.973195294
    94.25404556	0.891866805
    101.3911386	0.674528028
    112.0211431	0.999170631
    119.7843278	1.344311767
    133.2293779	0.87659704
    152.1948651	1.062184599
    183.4425167	1.939992272
    187.111293	1.298374568
    190.8973941	1.672630455
    213.7469862	1.717117443
    264.6061903	4.039243177
    280.8665373	3.900317845
    290.4022654	3.333496473
    308.2478102	4.146675015
    342.9256733	5.628594993
    612.2094091	8.558546212
    826.0379496	9.341142557
    943.6262203	11.61983604
    1167.884783	11.51860804
    1290.624782	17.66851298
    1334.135683	15.36384793
    1504.180658	20.1418798
    1596.981922	18.29784734
    1596.981923	16.62264002
    1607.681447	20.31889097
    1695.508612	17.36600813
    1706.86825	14.83884164
    1898.890842	19.28412776
    1937.313925	21.97859873
    2043.148815	16.9160905
    2056.837587	23.57219364
    2070.618071	18.62087137
    2169.202019	21.22755623
    2303.032146	18.45865276
    2318.462095	20.14651818
    2365.374987	17.36600813
    2429.405442	23.36684082
    2477.992571	20.49745775
    2630.873703	17.21472146
    2684.108084	24.41181106
    2702.091181	18.30206106
    2739.050251	31.16735875
    2793.830151	23.98832919
    2793.830152	32.27750819
    3066.902715	25.5035126
    3066.902716	21.60230035
    3086.739646	19.79702812
    3149.19824	19.28412776
    3321.238013	29.58012467
    3457.004939	24.19914378
    3503.482883	19.62908248
    3670.286785	28.82039973
    3870.793472	31.71757679
    4110.550613	25.5035126
    4306.257543	28.82039973
    4758.82791	42.68742913
    4822.808304	39.46389982
    4887.648887	40.15133594
    6253.166607	52.17951042
    6335.778707	50.82764641
    7894.052311	70.82718805
    8437.232172	60.53408748];
units.WJO = {'g', 'mL O2/min'}; label.WJO = {'wet weight', 'O2 consumption'};
temp.WJO    = C2K(36.5);  units.temp.WJO = 'K'; label.temp.WJO = 'temperature';
bibkey.WJO = 'Frap2008';
comment.WJO = 'this is a mix of fasted and fed animals';

% data.WJO_chamb = [4960 22.6]; % Mass (in g), rate of oxygen consumption (mL per min)
% units.WJO_chamb = {'g', 'mL O2/min'}; label.WJO_chamb = {'wet weight', 'O2 consumption'};
% temp.WJO_chamb    = C2K(36.5);  units.temp.WJO_chamb = 'K'; label.temp.WJO_chamb = 'temperature';
% bibkey.WJO_chamb = 'DawsDenn1969';
% comment.WJO_chamb = 'converted from 1.33 cal/g hr for a 4.96kg animal ';
% 
% data.WJO_fld = [...       % Mass (g), mL O2/min, from field data, Nagy et al 1990
%     3300	25.20763242
%     3200	39.41934288
%     3430	30.35980969
%     3380	38.38199175
%     5290	48.06393562
%     5730	43.91453111
%     6350	52.90490755];
% units.WJO_fld = {'g', 'mL O2/min'}; label.WJO_fld = {'wet weight', 'O2 consumption'};
% temp.WJO_fld    = C2K(36.5);  units.temp.WJO_fld = 'K'; label.temp.WJO_fld = 'temperature';
% bibkey.WJO_fld = 'NagySans1990';
% comment.WJO_fld = 'from field data';
% 
% % Milkproduction from CorkDove1989
% data.tpL = [ ... %    time since birth(d), milk in kJ/d
% 1	0.688732624
% 2	0.708774968
% 3	0.729400235
% 4	0.750625362
% 5	0.772467776
% 6	0.794945408
% 7	0.81807671
% 8	0.841880668
% 9	0.866376819
% 10	0.891585266
% 11	0.917526692
% 12	0.944222383
% 13	0.971694238
% 14	0.999964792
% 15	1.029057232
% 16	1.058995415
% 17	1.08980389
% 18	1.121507916
% 19	1.154133482
% 20	1.18770733
% 21	1.222256975
% 22	1.257810726
% 23	1.294397714
% 24	1.332047908
% 25	1.370792145
% 26	1.410662154
% 27	1.451690578
% 28	1.493911006
% 29	1.537357993
% 30	1.582067095
% 31	1.628074892
% 32	1.67541902
% 33	1.724138202
% 34	1.774272275
% 35	1.825862228
% 36	1.878950228
% 37	1.93357966
% 38	1.989795157
% 39	2.047642638
% 40	2.107169344
% 41	2.168423876
% 42	2.231456234
% 43	2.296317854
% 44	2.363061654
% 45	2.431742071
% 46	2.502415107
% 47	2.575138373
% 48	2.649971133
% 49	2.726974355
% 50	2.806210754
% 51	2.887744844
% 52	2.97164299
% 53	3.057973457
% 54	3.146806468
% 55	3.238214255
% 56	3.332271119
% 57	3.429053486
% 58	3.528639967
% 59	3.631111421
% 60	3.736551017
% 61	3.845044299
% 62	3.956679252
% 63	4.071546372
% 64	4.189738735
% 65	4.311352068
% 66	4.436484825
% 67	4.565238266
% 68	4.697716526
% 69	4.834026705
% 70	4.974278944
% 71	5.118586514
% 72	5.267065898
% 73	5.419836885
% 74	5.577022658
% 75	5.738749889
% 76	5.905148836
% 77	6.076353442
% 78	6.252501433
% 79	6.43373443
% 80	6.620198046
% 81	6.812042005
% 82	7.009420246
% 83	7.212491047
% 84	7.421417137
% 85	7.63636582
% 86	7.857509101
% 87	8.085023809
% 88	8.319091737
% 89	8.559899766
% 90	8.807640013
% 91	9.062509965
% 92	9.324712627
% 93	9.594456673
% 94	9.871956594
% 95	10.15743286
% 96	10.45111208
% 97	10.75322715
% 98	11.06401745
% 99	11.383729
% 100	11.71261464
% 101	12.0509342
% 102	12.39895473
% 103	12.75695061
% 104	13.12520383
% 105	13.50400414
% 106	13.89364928
% 107	14.29444518
% 108	14.70670615
% 109	15.13075517
% 110	15.56692403
% 111	16.01555363
% 112	16.4769942
% 113	16.95160551
% 114	17.43975717
% 115	17.94182886
% 116	18.45821057
% 117	18.98930291
% 118	19.53551738
% 119	20.09727661
% 120	20.6750147
% 121	21.26917748
% 122	21.88022283
% 123	22.50862099
% 124	23.15485487
% 125	23.81942038
% 126	24.50282676
% 127	25.20559695
% 128	25.92826789
% 129	26.67139091
% 130	27.43553211
% 131	28.22127271
% 132	29.02920946
% 133	29.85995502
% 134	30.71413838
% 135	31.59240525
% 136	32.49541854
% 137	33.42385875
% 138	34.37842444
% 139	35.35983269
% 140	36.36881956
% 141	37.40614062
% 142	38.47257137
% 143	39.56890784
% 144	40.69596704
% 145	41.85458755
% 146	43.04563005
% 147	44.26997786
% 148	45.52853759
% 149	46.82223968
% 150	48.15203901
% 151	49.51891557
% 152	50.92387508
% 153	52.36794963
% 154	53.85219842
% 155	55.37770837
% 156	56.9455949
% 157	58.55700265
% 158	60.21310619
% 159	61.91511083
% 160	63.66425337
% 161	65.46180292
% 162	67.30906173
% 163	69.20736597
% 164	71.15808664
% 165	73.16263042
% 166	75.22244054
% 167	77.33899765
% 168	79.51382079
% 169	81.74846823
% 170	84.04453845
% 171	86.40367101
% 172	88.82754752
% 173	91.31789255
% 174	93.87647451
% 175	96.5051066
% 176	99.20564764
% 177	101.980003
% 178	104.8301252
% 179	107.7580151
% 180	110.7657221
% 181	113.8553453
% 182	117.0290335
% 183	120.2889862
% 184	123.6374536
% 185	127.076737
% 186	130.6091887
% 187	134.2372119
% 188	137.9632604
% 189	141.7898381
% 190	145.7194977
% 191	149.7548399
% 192	153.8985117
% 193	158.1532043
% 194	162.5216505
% 195	167.0066222
% 196	171.6109262
% 197	176.3374001
% 198	181.1889073
% 199	186.1683312
% 200	191.278568
% 201	196.5225191
% 202	201.9030822
% 203	207.4231406
% 204	213.0855516
% 205	218.8931337
% 206	224.8486508
% 207	230.9547963
% 208	237.2141738
% 209	243.6292763
% 210	250.202463
% 211	256.9359333
% 212	263.8316988
% 213	270.8915513
% 214	278.117029
% 215	285.5093786
% 216	293.0695145
% 217	300.7979746
% 218	308.694872
% 219	316.7598435
% 220	324.9919947
% 221	333.3898402
% 222	341.951242
% 223	350.673343
% 224	359.5524979
% 225	368.5842009
% 226	377.763012
% 227	387.0824797
% 228	396.5350641
% 229	406.1120586
% 230	415.8035132
% 231	425.5981586
% 232	435.4833342
% 233	445.4449205
% 234	455.4672783
% 235	465.5331953
% 236	475.6238434
% 237	485.7187489
% 238	495.795776
% 239	505.8311282
% 240	515.7993686
% 241	525.6734609
% 242	535.4248348
% 243	545.0234757
% 244	554.4380422
% 245	563.6360112
% 246	572.5838518
% 247	581.2472283
% 248	589.5912322
% 249	597.580641
% 250	605.1802026
% 251	612.3549427
% 252	619.0704913
% 253	625.2934231
% 254	630.9916092
% 255	636.134571
% 256	640.6938325
% 257	644.6432638
% 258	647.9594075
% 259	650.6217828
% 260	652.61316
% 261	653.9197981
% 262	654.5316417
% 263	654.4424708
% 264	653.65
% 265	652.1559259
% 266	649.9659189
% 267	647.0895617
% 268	643.5402344
% 269	639.3349495
% 270	634.4941401
% 271	629.041407
% 272	623.0032294
% 273	616.4086463
% 274	609.2889155
% 275	601.6771565
% 276	593.6079861
% 277	585.1171515
% 278	576.241169
% 279	567.0169734
% 280	557.4815842
% 281	547.6717923
% 282	537.6238708
% 283	527.3733138
% 284	516.9546041
% 285	506.4010115
% 286	495.7444219
% 287	485.0151964
% 288	474.2420614
% 289	463.4520255
% 290	452.6703245
% 291	441.920389
% 292	431.2238362
% 293	420.6004803
% 294	410.0683599
% 295	399.6437815
% 296	389.3413741
% 297	379.174155
% 298	369.1536026
% 299	359.2897363
% 300	349.5911997
% 301	340.065347
% 302	330.7183301
% 303	321.5551864
% 304	312.5799251
% 305	303.7956111
% 306	295.2044478
% 307	286.8078549
% 308	278.6065441
% 309	270.6005898
% 310	262.7894969
% 311	255.1722631
% 312	247.7474379
% 313	240.513177
% 314	233.4672926
% 315	226.6072995
% 316	219.9304578
% 317	213.4338113
% 318	207.1142228
% 319	200.9684058
% 320	194.9929531
% 321	189.1843628
% 322	183.5390613
% 323	178.0534234
% 324	172.7237912
% 325	167.5464899
% 326	162.5178418
% 327	157.634179
% 328	152.8918543
% 329	148.28725
% 330	143.8167866
% 331	139.4769292
% 332	135.2641939
% 333	131.1751517
% 334	127.2064334
% 335	123.3547327
% 336	119.6168084
% 337	115.9894869
% 338	112.4696632
% 339	109.0543027
% 340	105.7404409
% 341	102.5251847
% 342	99.40571148
% 343	96.37926953
% 344	93.44317725
% 345	90.5948226
% 346	87.83166224
% 347	85.15122058
% 348	82.55108876
% 349	80.02892343
% 350	77.58244558
% 351	75.20943923
% 352	72.90775008
% 353	70.67528422
% 354	68.51000665
% 355	66.40993998
% 356	64.37316294
% 357	62.39780905
% 358	60.48206519
% 359	58.6241702
% 360	56.82241357
% 361	55.075134
% 362	53.38071817
% 363	51.73759935
% 364	50.14425614
% 365	48.59921126
% 366	47.10103024
% 367	45.64832029
% 368	44.23972909
% 369	42.87394363
% 370	41.54968913
% 371	40.26572795
% 372	39.02085851
% 373	37.81391425
% 374	36.64376267
% 375	35.50930433
% 376	34.40947189
% 377	33.3432292
% 378	32.30957042
% 379	31.30751914
% 380	30.33612751
% 381	29.39447545
% 382	28.48166984
% 383	27.59684377
% 384	26.73915573
% 385	25.90778893
% 386	25.10195058
% 387	24.32087119
% 388	23.56380391];
% units.tpL = {'d', 'kJ/d'}; label.tpL = {'time since birth', 'milk production'};
% temp.tpL    = C2K(36.5);  units.temp.tpL = 'K'; label.temp.tpL = 'temperature';
% bibkey.tpL = 'CorkDove1989';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '7VR5D'; % Cat of Life
metaData.links.id_ITIS = '552731'; % ITIS
metaData.links.id_EoL = '116250'; % Ency of Life
metaData.links.id_Wiki = 'Macropus_eugenii'; % Wikipedia
metaData.links.id_ADW = 'Macropus_eugenii'; % ADW
metaData.links.id_Taxo = '168617'; % Taxonomicon
metaData.links.id_MSW3 = '11000251'; % MSW3
metaData.links.id_AnAge = 'Macropus_eugenii'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Macropus_eugenii}}';
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
bibkey = 'CorkDove1989'; type = 'Article'; bib = [ ... 
'author = {Cork, S. J. and Dove, H.}, ' ... 
'year = {1989}, ' ...
'title = {Lactation in the tammar wallaby (\emph{Macropus eugenii}). II. {I}ntake of milk components and maternal allocation of energy}, ' ...
'journal = {Journal of Zoology, London}, ' ...
'volume = {219}, ' ...
'pages = {399--409}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DawsDenn1969'; type = 'Article'; bib = [ ... 
'author = {Dawson, T. J. and Denny, M. J. S. and Hulbert, A. J.}, ' ... 
'year = {1969}, ' ...
'title = {Thermal balance of the macropod marsupial \emph{Macropus eugenii} {D}esmarest.}, ' ...
'journal = {Comparative Biochemistry and Physiology}, ' ...
'volume = {31}, ' ...
'pages = {645--653}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Frap2008'; type = 'Article'; bib = [ ... 
'author = {Frappell, P. B.}, ' ... 
'year = {2008}, ' ...
'title = {Ontogeny and allometry of metabolic rate and ventilation in the marsupial: matching supply and demand from ectothermy to endothermy}, ' ...
'journal = {Comparative Biochemistry and Physiology, Part A}, ' ...
'volume = {150}, ' ...
'pages = {181-188}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HindPool1990'; type = 'Article'; bib = [ ... 
'author = {Hinds, L. A. and Poole, W. E. and Tindale-Biscoe, C. H. and van Oorschot, R. A. H. and Coorper, D. W.}, ' ... 
'year = {1990}, ' ...
'title = {Reproductive biology and the potential for genetic studies in the tammar wallaby, \emph{Macropus eugenii}}, ' ...
'journal = {Australian Journal of Zoology}, ' ...
'volume = {37}, ' ...
'pages = {223--234}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MurpSmit1970'; type = 'Article'; bib = [ ... 
'author = {Murphy, C. R. and Smith, J. R.}, ' ... 
'year = {1970}, ' ...
'title = {Age determination in pouch young and juvenile {K}angaroo {I}sland wallabies.}, ' ...
'journal = {Transactions of the Royal Society of South Australia}, ' ...
'volume = {94}, ' ...
'pages = {15--20}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NagySans1990'; type = 'Article'; bib = [ ... 
'author = {Nagy, K. A. and Sanson, G. D. and Jacobsen, N. K.}, ' ... 
'year = {1990}, ' ...
'title = {Comparative field energetics of two macropod marsupials and a ruminant}, ' ...
'journal = {Australian Wildlife Research}, ' ...
'volume = {17}, ' ...
'pages = {591--599}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TyndRenf1987'; type = 'Book'; bib = [ ... 
'author = {Tyndale-Biscoe, C. H. and Renfree, M. B.}, ' ... 
'year = {1987}, ' ...
'title = {Reproductive physiology of marsupials: monographs on marsupial biology}, ' ...
'publisher = {Cambridge University Press}, ' ...
'address = {Cambridge}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Macropus_eugenii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

