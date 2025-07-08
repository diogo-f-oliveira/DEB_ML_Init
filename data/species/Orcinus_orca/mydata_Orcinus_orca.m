function [data, auxData, metaData, txtData, weights] = mydata_Orcinus_orca

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Delphinidae';
metaData.species    = 'Orcinus_orca'; 
metaData.species_en = 'Orca'; 
metaData.ecoCode.climate = {'MA', 'MB', 'MC', 'ME'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCvm', 'xiCvb', 'xiSvm', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(36); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2017 01 08];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 01 08]; 

%% set data
% zero-variate data

data.tg = 435;     units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg =  'AnAge';   
  temp.tg = C2K(36);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'Body temp from HeidNiel2014';
data.tx = 471;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 3780;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 4930;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(36);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 90*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(36);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 240;     units.Lb = 'cm';   label.Lb = 'total length at birth';        bibkey.Lb = 'ADW';
  comment.Lb = 'seaworld gives 260 cm';
data.Li = 850;    units.Li = 'cm';   label.Li = 'ultimate length of female';     bibkey.Li = 'ADW';
data.Lim = 975;    units.Lim = 'cm';   label.Lim = 'ultimate length of male';    bibkey.Lim = 'ADW';

data.Wwb = 130e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'seaworld';
  comment.Wwb = '120-160 kg';
data.Wwim = 3987500; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'AnAge';
  
data.Ri  = .2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';       bibkey.Ri  = {'AnAge'};   
  temp.Ri = C2K(36);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 calf each 2.5 yr';
  
% uni-variate data
% time-length data
data.tL = [ % time since birth (d), length (cm)
324.960	318.711
371.510	329.155
386.828	342.842
410.077	349.367
418.047	340.250
418.098	337.644
487.821	358.521
487.973	350.704
527.061	344.206
549.955	368.972
565.501	370.933
604.373	375.510
619.640	391.803
627.509	387.898
627.572	384.641
682.168	382.059
744.226	396.418
752.107	391.861
752.145	389.907
752.221	385.998
806.614	393.839
845.422	401.673
869.052	388.654
884.218	410.159
884.281	406.902
899.904	404.955
946.733	401.066
954.157	419.962
977.660	413.457
977.749	408.897
993.168	417.373
1000.745	428.451
1000.922	419.331
1016.265	431.715
1078.526	435.651
1117.500	435.016
1140.800	438.935
1148.529	442.196
1164.037	446.112
1172.133	430.480
1179.824	435.695
1218.683	440.924
1226.234	453.305
1257.543	446.152
1257.670	439.638
1280.741	455.283
1335.591	439.671
1358.840	446.196
1389.857	454.027
1397.852	443.607
1436.660	451.442
1459.796	463.830
1490.812	471.661
1545.484	465.170
1615.499	471.063
1630.982	476.282
1638.647	482.800
1677.633	481.514
1700.883	488.039
1716.517	485.439
1770.872	495.235
1778.804	488.072
1817.663	493.301
1864.428	492.670
1872.398	483.553
1926.652	498.560
1926.855	488.137
1926.981	481.622
1942.337	493.355
1989.166	489.467
1997.085	482.955
2012.467	493.386
2051.478	490.797
2051.808	473.859
2082.697	488.204
2098.142	495.377
2160.543	492.147
2168.512	483.030
2176.203	488.245
2207.016	506.499
2207.169	498.682
2215.214	485.656
2261.612	503.917
2316.233	500.032
2363.037	497.447
2370.702	503.965
2401.883	503.327
2409.549	509.845
2425.387	496.822
2456.403	504.653
2487.457	510.530
2487.635	501.410
2518.435	520.315
2549.820	509.254
2557.434	518.378
2557.511	514.469
2581.027	507.313
2627.652	513.848
2627.741	509.288
2643.173	517.112
2736.717	515.198
2736.768	512.593
2744.420	519.762
2752.136	523.674
2806.605	527.607
2822.380	517.842
2845.617	525.018
2869.082	520.468
2876.658	531.546
2900.162	525.041
2907.890	528.302
2954.884	515.945
2962.600	519.857
2985.774	530.290
2993.655	525.734
3017.120	521.183
3040.585	516.633
3048.199	525.757
3110.626	521.224
3149.434	529.059
3180.527	532.981
3180.679	525.163
3242.775	537.568
3266.240	533.018
3305.289	528.475
3336.471	527.837
3351.928	534.358
3390.864	535.678
3391.105	523.300
3414.342	530.477
3437.781	527.229
3484.420	533.113
3515.677	528.566
3523.533	525.312
3578.078	525.336
3609.322	521.441
3616.823	536.428
3616.924	531.216
3616.988	527.959
3671.330	538.406
3710.392	533.211
3710.481	528.651
3749.556	522.804
3764.835	538.446
3772.729	533.238
3772.792	529.981
3772.830	528.026
3866.044	543.051
3866.133	538.490
3874.002	534.585
3881.870	530.680
3951.695	546.345
3983.041	537.238
3983.104	533.981
4037.662	533.353
4092.334	526.862
4107.665	539.898
4123.350	534.693
4193.543	531.466
4232.212	546.467
4232.364	538.649
4263.609	534.754
4294.651	541.282
4317.938	545.853
4318.065	539.338
4318.243	530.218
4333.725	535.436
4357.025	539.355
4427.053	544.597
4434.744	549.812
4442.955	528.317
4481.764	536.152
4512.729	546.589
4574.914	554.433
4575.028	548.570
4606.222	547.281
4653.140	538.832
4707.532	546.673
4746.493	546.690
4769.908	544.746
4801.038	546.714
4847.854	543.477
4894.607	543.497
4910.255	540.247
4917.869	549.371
4980.397	539.626
4988.062	546.144
5027.099	542.252
5073.789	545.529
5105.185	533.817
5128.333	545.553
5136.062	548.814
5167.459	537.101
5182.992	539.714
5198.513	542.978
5252.995	546.259
5268.528	548.871
5292.095	539.110];
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL  = C2K(36);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'WWH';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Lb = 10 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '74SZC'; % Cat of Life
metaData.links.id_ITIS = '180469'; % ITIS
metaData.links.id_EoL = '46559273'; % Ency of Life
metaData.links.id_Wiki = 'Orcinus_orca'; % Wikipedia
metaData.links.id_ADW = 'Orcinus_orca'; % ADW
metaData.links.id_Taxo = '68777'; % Taxonomicon
metaData.links.id_WoRMS = '137102'; % WoRMS
metaData.links.id_MSW3 = '14300074'; % MSW3
metaData.links.id_AnAge = 'Orcinus_orca'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Orcinus_orca}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Orcinus_orca}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Orcinus_orca/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WWH'; type = 'Misc'; bib = ...
'howpublished = {\url{http://what-when-how.com/marine-mammals/captive-breeding-marine-mammals/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'seaworld'; type = 'Misc'; bib = ...
'howpublished = {\url{https://seaworld.org/animal-info/animal-infobooks/killer-whale/birth-and-care-of-young/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

