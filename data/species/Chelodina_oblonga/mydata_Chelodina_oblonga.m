function [data, auxData, metaData, txtData, weights] = mydata_Chelodina_oblonga
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Chelidae';
metaData.species    = 'Chelodina_oblonga'; 
metaData.species_en = 'Northern snake-necked turtle'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0bTd', 'biFm', 'biMm'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf', 'biCva'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'L-dL'; 't-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 09];

%% set data
% zero-variate data

data.ab = 200;     units.ab = 'd';    label.ab = 'age at birth';                         bibkey.ab = 'ErnsBarb1989';
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'all temps are guessed; ab ranges from 183 to 222 d';
data.tp = 6.5*365;     units.tp = 'd';    label.tp = 'time since birth at puberty for females';  bibkey.tp = 'Kenn1996';
  temp.tp = C2K(27);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 3.9*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'Kenn1996';
  temp.tpm = C2K(27);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 14.1*365;     units.am = 'd';    label.am = 'life span';                       bibkey.am = 'AnAge';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'life span not yet established';

data.Lb = 3.1; units.Lb = 'cm';   label.Lb = 'plastron length at birth';                 bibkey.Lb = 'ErnsBarb1989';
data.Lp = 21.0; units.Lp = 'cm';    label.Lp = 'plastron length at puberty for females'; bibkey.Lp = 'Kenn1996';
data.Lpm = 16.5; units.Lpm = 'cm';   label.Lpm = 'plastron length at puberty for males'; bibkey.Lpm = 'Kenn1996';
data.Li = 30.0; units.Li = 'cm';   label.Li = 'ultimate plastron length for females';    bibkey.Li = 'Kenn1996';
data.Lim = 25.0; units.Lim = 'cm';   label.Lim = 'ultimate plastron length for females'; bibkey.Lim = 'Kenn1996';

data.Wwb = 14.3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';                   bibkey.Wwb = 'ErnsBarb1989';
  comment.Wwb = 'based on eggs 35 mm long, 28 mm wide: pi/6*3.5*2.8^2';

data.Ri  = 14/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at 29 cm';                bibkey.Ri  = 'ErnsBarb1989';   
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% length-change in length
data.LdL_f = [ ... % carapace length (cm), change in carapace length (cm/yr)
12.757	3.368
14.085	2.605
15.470	2.671
15.625	2.476
15.779	2.087
16.442	3.556
17.861	0.798
18.758	2.145
19.202	2.178
19.471	3.362
19.585	0.823
19.696	1.805
19.947	0.166
20.191	1.602
20.575	0.434
20.655	0.564
20.682	0.791
20.704	0.101
20.864	0.604
20.993	0.369
21.057	2.154
21.070	0.085
21.202	0.353
21.226	0.069
21.227	0.158
21.231	0.775
21.280	0.321
21.331	0.037
21.436	0.199
21.513	-0.020
21.619	0.175
21.775	0.134
21.776	0.280
21.865	1.895
21.879	0.021
22.119	0.751
22.153	2.009
22.220	0.175
22.273	0.329
22.350	0.094
22.375	-0.003
22.456	0.402
22.481	0.183
22.507	0.110
22.507	0.151
22.508	0.337
22.637	0.135
22.690	0.191
22.769	0.240
22.773	0.897
22.872	0.110
22.898	0.062
22.899	0.192
22.953	0.394
22.978	0.305
23.106	-0.182
23.108	0.143
23.108	0.175
23.185	0.013
23.239	0.297
23.291	0.232
23.292	0.362
23.315	-0.125
23.421	0.103
23.446	0.013
23.499	0.054
23.524	-0.068
23.605	0.273
23.683	0.176
23.683	0.241
23.707	-0.133
23.708	0.013
23.708	0.111
23.760	0.054
23.811	-0.173
23.839	0.095
24.049	0.249
24.049	0.330
24.100	0.070
24.127	0.152
24.155	0.573
24.205	0.208
24.230	0.014
24.257	0.111
24.259	0.492
24.337	0.354
24.389	0.306
24.543	-0.124
24.545	0.144
24.547	0.566
24.623	0.200
24.652	0.533
24.727	0.063
24.858	0.111
24.885	0.217
24.936	0.014
24.964	0.371
25.067	0.160
25.096	0.501
25.172	0.217
25.197	0.038
25.276	0.103
25.433	0.185
25.876	0.055
25.982	0.242
26.425	0.023
26.427	0.315
26.765	0.080
27.785	0.242
27.888	0.040
27.915	0.121
29.952	0.016];
data.LdL_f(:,2) = data.LdL_f(:,2)/ 365; % convert yr to d
units.LdL_f   = {'cm', 'cm/d'};  label.LdL_f = {'carapace length', 'change in carapace length', 'female'};  
temp.LdL_f    = C2K(22);  units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f = 'Kenn1996';
comment.LdL_f = 'Data for females';
%
data.LdL_m = [ ... % carapace length (cm), change in carapace length (cm/yr)
14.166	3.125
15.100	2.127
15.363	2.298
15.459	1.048
15.632	3.458
15.910	2.128
16.192	1.300
16.369	0.432
16.393	0.026
16.551	0.221
16.638	1.609
16.734	0.262
16.759	0.156
17.262	1.073
17.318	1.706
17.334	0.108
17.339	0.846
17.517	0.165
17.518	0.295
17.882	0.068
17.959	-0.160
18.068	0.465
18.169	-0.030
18.380	0.214
18.509	0.035
18.823	0.133
19.005	-0.070
19.086	0.409
19.528	0.085
19.632	-0.053
19.971	-0.077
20.153	-0.248
20.259	0.012];
data.LdL_m(:,2) = data.LdL_m(:,2)/ 365; % convert yr to d
units.LdL_m   = {'cm', 'cm/d'};  label.LdL_m = {'carapace length', 'change in carapace length', 'male'};  
temp.LdL_m    = C2K(22);  units.temp.LdL_m = 'K'; label.temp.LdL_m = 'temperature';
bibkey.LdL_m = 'Kenn1996';
comment.LdL_m = 'Data for males';

% time-length
data.tL_f = [ ... % time since birth (yr), carapace length (cm)
0.411	10.842
0.427	7.339
0.428	7.472
0.462	9.556
0.484	7.827
0.490	9.866
1.406	11.941
1.426	9.547
1.485	10.832
1.500	6.664
1.519	12.915
2.428	12.685
2.420	16.025
2.475	15.104
3.438	15.978
3.438	17.604
4.456	20.863];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'carapace length', 'female'};  
temp.tL_f    = C2K(22);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Kenn1996';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), carapace length (cm)
0.411	10.842
0.427	7.339
0.428	7.472
0.462	9.556
0.484	7.827
0.490	9.866
1.406	11.941
1.426	9.547
1.485	10.832
1.500	6.664
1.519	12.915
2.428	12.685
1.381	12.606
2.378	14.459
2.379	14.503
2.379	14.636
2.382	15.567
3.406	16.932
3.429	15.690
4.362	14.174
4.367	15.992
4.369	16.657
4.399	17.410
4.400	17.720
5.365	17.756
5.366	18.155];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'carapace length', 'male'};  
temp.tL_m    = C2K(22);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Kenn1996';
comment.tL_m = 'Data for males';

% length-weight
data.LW_f = [ ... % carapace length (cm), wet weight (g)
15.0 420.00
15.5 465.41
16.0 510.82
16.5 556.23
17.0 601.64
17.5 647.05
18.0 692.45
18.5 737.86
19.0 783.27
19.5 828.68
20.0 874.09
20.5 919.50
21.9 964.91];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'carapace length', 'wet weight', 'female'};  
bibkey.LW_f = 'awrc';
comment.LW_f = 'Data for females';
%
data.LW_m = [ ... % carapace length (cm), wet weight (g)
15.0 446.87
15.5 474.82
16.0 502.76
16.5 530.71
17.0 558.66
17.5 586.61
18.0 614.56
18.5 642.51
19.0 670.46
19.5 698.41
20.0 726.36
20.5 754.31
21.0 782.26];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'carapace length', 'wet weight', 'male'};  
bibkey.LW_m = 'awrc';
comment.LW_m = 'Data for males';


%% set weights for all real data
weights = setweights(data, []);
weights.LdL_f = 0 * weights.LdL_f;
weights.LdL_m = 0 * weights.LdL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LdL_f','LdL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tL_f','tL_m'}; subtitle2 = {'Data for females, males'};
set3 = {'LW_f','LW_m'}; subtitle3 = {'Data for females, males'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hb only'; 
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Carnivorous';
metaData.bibkey.F1 = 'Kenn1996'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '87WDQ'; % Cat of Life
metaData.links.id_ITIS = '551884'; % ITIS
metaData.links.id_EoL = '47262449'; % Ency of Life
metaData.links.id_Wiki = 'Chelodina_rugosa'; % Wikipedia
metaData.links.id_ADW = 'Chelodina_rugosa'; % ADW
metaData.links.id_Taxo = '4204500'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Chelodina&species=rugosa'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chelodina_oblonga}}';
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
bibkey = 'Kenn1996'; type = 'Article'; bib = [ ... 
'author = {R. Kennett}, ' ... 
'year = {1996}, ' ...
'title = {Growth models for two species of freshwater turtle, \emph{Chelodina rugosa} and \emph{Elseya dentata} from the wet-dry tropics of {N}orthern {A}ustralia}, ' ...
'journal = {Herpetologica}, ' ...
'volume = {50}, ' ...
'number = {3}, ' ...
'pages = {383--395}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Chelodina_oblonga}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'awrc'; type = 'Misc'; bib = [ ...
'author = {R. Haight}, ' ...
'howpublished = {\url{http://www.awrc.org.au/uploads/5/8/6/6/5866843/ruthhaight.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ErnsBarb1989'; type = 'Book'; bib = [ ...  
'author = {C. H. Ernst and R. W. Barbour}, ' ...
'year = {1989}, ' ...
'title  = {Turtles of the world}, ' ...
'publisher = {Smithsonian Institutiun Press, Washington}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

