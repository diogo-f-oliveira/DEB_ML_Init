function [data, auxData, metaData, txtData, weights] = mydata_Ichthyophis_kohtaoensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Gymnophiona'; 
metaData.family     = 'Ichthyophiidae';
metaData.species    = 'Ichthyophis_kohtaoensis'; 
metaData.species_en = 'Koa Tao Island caecilian'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0bTf', 'bjFc', 'jiTf'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {'TW'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Le'; 't-L'; 'L-N'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2011 10 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2015 09 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 10 27];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2019 06 21];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.author_mod_4   = {'Bas Kooijman'};    
metaData.date_mod_4     = [2023 04 07];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.ab = 75;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'KupfKram2004';   
  temp.ab = C2K(23);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 11*30.5; units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'KupfKram2004';   
  temp.tj = C2K(23);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 2*365;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'KupfKram2004';
  temp.tp = C2K(23);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 10*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 7;      units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'KupfKram2004';  
data.Lj  = 15;     units.Lj  = 'cm';  label.Lj  = 'total length at metam';    bibkey.Lj  = 'KupfKram2004';  
data.Lp  = 20;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'KupfKram2004'; 
data.Li_f = 40;    units.Li_f = 'cm'; label.Li_f = 'ultimate female total length'; bibkey.Li_f  = 'KupfKram2004';
  comment.Li_f = 'MantGros1997: 28 cm';
data.Li_m = 36.8;  units.Li_m = 'cm'; label.Li_m = 'ultimate male total length';   bibkey.Li_m  = 'KupfKram2004';

data.Wwb = 1.9;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'estimate';
  comment.Wwb = 'computed from W_m*(L_b/L_m)^3';
data.Wwj = 19;     units.Wwj = 'g';   label.Wwj = 'wet weight at metam';      bibkey.Wwj = 'estimate';
  comment.Wwj = 'computed from W_m*(L_j/L_m)^3';
data.Wwp = 44;     units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'estimate';
  comment.Wwp = 'computed from W_m*(L_p/L_m)^3';
data.Wwi = 356;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'estimate';
  comment.Wwi = 'estimated from volume in a photograph';

data.Ri  = 47/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'KupfNabh2004';   
  temp.Ri = C2K(23);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'mean value 27 eggs per brood';

% uni-variate data

% time-length for embryo for I. glutinosus
data.aL_e = [ ... % fig 48 age (d, length (cm)
 0 0.7 
19 1.5
22 1.9
40 3.0
50 4.0
75 6.5]; % hatching July- Sept NE Thailand
%aL_e(1,3) = 0; % no weight for first data-point
units.aL_e   = {'d', 'cm'};  label.aL_e = {'age', 'embryo total length'};  
temp.aL_e    = C2K(27);  units.temp.aL_e = 'K'; label.temp.aL_e = 'temperature';
bibkey.aL_e = 'SaraSara1890';
comment.aL_e = 'hatching July-Sept NE Thailand; egg diameter 0.6 cm';

% time-length
data.tL_A = [ ... % Fig 49 time (month) since hatching, length (cm)
0.031294	7.020015
0.969139	7.061036
2.026262	7.487745
2.927028	8.060374
3.981610	8.245790
4.990171	9.058953
5.896013	10.114171
6.922862	12.664652
7.930914	13.429555
8.984481	13.518453
9.987962	13.849026
10.943894	14.662569
20.056285	20.339845
26.088339	23.384981
38.131619	27.496637];
data.tL_A(:,1) = 30.5 * data.tL_A(:,1); % convert month to day
units.tL_A   = {'d', 'cm'};  label.tL_A = {'time since hatch', 'total length'};  
temp.tL_A    = C2K(27);  units.temp.tL_A = 'K'; label.temp.tL_A = 'temperature';
bibkey.tL_A = 'Hims1997';
comment.tL_A = 'temp is mean in S-Thailand,; lengths are means of 5 individuals';
%
data.tL_B = [ ... % Fig 49 time (month) since hatching, length (cm)
0.022859	7.164412
0.974219	7.543625
2.094639	8.983389
2.999972	9.990350
4.020217	11.913465
4.923015	12.679130
5.989281	13.974499
7.041324	13.918620
8.051917	14.924819
9.001753	15.159256
9.904551	15.924920
12.969648	17.109294];
data.tL_B(:,1) = 30.5 * data.tL_B(:,1); % convert month to day
units.tL_B   = {'d', 'cm'};  label.tL_B = {'time since hatch', 'total length'};  
temp.tL_B    = C2K(27);  units.temp.tL_B = 'K'; label.temp.tL_B = 'temperature';
bibkey.tL_B = 'Hims1997';
comment.tL_B = 'temp is mean in S-Thailand; lengths are means of 5 individuals';
%
data.tL_C = [ ... % Fig 49 time (month) since hatching, length (cm)
0.027230	7.406085
0.923117	7.688781
1.980240	8.115492
2.937187	9.025554
3.949304	10.176528
5.022682	12.147522
5.875899	13.203119
6.936069	13.919382
7.899112	15.408551
8.908689	16.318230
9.919790	17.372686
13.985318	18.598081
38.008381	20.789035];
data.tL_C(:,1) = 30.5 * data.tL_C(:,1); % convert month to day
units.tL_C   = {'d', 'cm'};  label.tL_C = {'time since hatch', 'total length'};  
temp.tL_C    = C2K(27);  units.temp.tL_C = 'K'; label.temp.tL_C = 'temperature';
bibkey.tL_C = 'Hims1997';
comment.tL_C = 'temp is mean in S-Thailand; lengths are means of 5 individuals';
% 
tL_mf = [ ... % time since metamorphosis (a), total length (d)
1 16.84 17.27
2 19.34 20.55
3 23.16 24.11
4 25.83 28.30
5 28.68 31.32
6 30.72 33.16];
tL_mf(:,1) = tL_mf(:,1) * 365 + 365/2; % convert a to d since metamorphosis
%
data.tL_f = tL_mf(:,[1 3]);
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since metam', 'total length', 'female'};  
temp.tL_f = C2K(23);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KupfKram2004';
comment.tL_f = 'data for females';
%
data.tL_m = tL_mf(:,[1 2]);
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since metam', 'total length', 'male'};  
temp.tL_m = C2K(23);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KupfKram2004';
comment.tL_m = 'data for males';

% length-fecundity
data.LN_1999 = [ ...
28.07265	21.94749
29.57528	37.01071
31.21051	36.95187
31.49779	45.00974
31.68814	25.00114
32.15137	23.08809
32.17274	25.13535
32.29726	31.01326
32.47781	29.03292
32.48417	40.06125
32.70392	36.03392
32.98489	33.12949
33.00096	25.99749
33.19370	45.14928
33.26924	36.10244
33.44747	30.09379
33.57035	33.13207
33.87200	31.08623
34.72974	48.12774
34.99101	46.08172
35.48936	35.05561
35.48989	35.98014
35.48989	35.98014
36.08980	26.01109
37.99452	38.17042
38.68893	52.04140];
units.LN_1999  = {'cm', '#'};  label.LN_1999 = {'total length', 'clutch size'};  
temp.LN_1999   = C2K(27);  units.temp.LN_1999 = 'K'; label.temp.LN_1999 = 'temperature';
bibkey.LN_1999 = 'KupfNabh2004';
%
data.LN_2000 = [ ...
30.61563	37.02571
31.95534	41.12362
31.97129	26.89506
32.29027	29.98642
32.32217	41.12156
33.29506	37.01064
33.58214	39.98970
34.47528	32.95480
35.16108	44.14250
35.19298	43.01754
35.28868	35.03106
35.67145	31.99201
36.27751	45.03605
36.56459	39.01686
36.77193	49.02624
36.89952	50.15030
37.15470	45.03112];
units.LN_2000  = {'cm', '#'};  label.LN_2000 = {'total length', 'clutch size'};  
temp.LN_2000   = C2K(27);  units.temp.LN_2000 = 'K'; label.temp.LN_2000 = 'temperature';
bibkey.LN_2000 = 'KupfNabh2004';
%
data.LN_2001 = [ ...
29.06897	35.02825
32.18033	29.09605
33.51415	31.99623
33.51945	38.12618
33.52458	44.05838
36.99903	38.12618
37.64474	50.05650
38.60078	35.95104
47.09194	58.09793];    
units.LN_2001  = {'cm', '#'};  label.LN_2001 = {'total length', 'clutch size'};  
temp.LN_2001   = C2K(27);  units.temp.LN_2001 = 'K'; label.temp.LN_2001 = 'temperature';
bibkey.LN_2001 = 'KupfNabh2004';

%% set weights for all real data
weights = setweights(data, []);
weights.aL_e(1) = 0;
weights.Li_f = 10*weights.Li_f;
weights.Li_m = 10*weights.Li_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LN_2001','LN_2000','LN_1999'}; subtitle1 = {'KupfNabh2004 data for 2001, 2000, 1999'};
set2 = {'tL_f','tL_m'}; subtitle2 = {'KupfKram2004 data females, males'};
set3 = {'tL_A','tL_B','tL_C'}; subtitle3 = {'Hims1997 data for experiment A, B, C'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Some data relates to I. glutinosus, which is treated as energetically identical';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_3: change from abj to std model, in view of other caecilians and amphibians';
D4 = 'mod_4: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '6N64B'; % Cat of Life
metaData.links.id_ITIS = '668547'; % ITIS
metaData.links.id_EoL = '330408'; % Ency of Life
metaData.links.id_Wiki = 'Ichthyophis_kohtaoensis'; % Wikipedia
metaData.links.id_ADW = 'Ichthyophis_kohtaoensis'; % ADW
metaData.links.id_Taxo = '48031'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Ichthyophis+kohtaoensis'; % AmphibiaWeb
metaData.links.id_AnAge = 'Ichthyophis_kohtaoensis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ichthyophis_kohtaoensis}}';
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
bibkey = 'Hims1997'; type = 'Book'; bib = [ ... 
'author = {Himstedt, W.}, ' ... 
'year = {1997}, ' ...
'title = {De Blindwuehlen}, ' ...
'publisher = {Westarp Wissenschaften}, ' ...
'volume = {630}, ' ...
'addres = {Magdeburg}, '...
'series = {die Neue Brehm Buecherei}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MantGros1997'; type = 'Book'; bib = [ ... 
'author = {Manthey, U. and Grossmannm, W.}, ' ... 
'year = {1997}, ' ...
'title = {Amphibien and Reptilien Suedostasiens}, ' ...
'publisher = {Natur & Tier Verlag}, ' ...
'address = {Munster}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KupfKram2004'; type = 'Article'; bib = [ ... 
'author = {Kupfer, A. and Kramer, A. and Himstedt, W.}, ' ... 
'year = {2004}, ' ...
'title = {Sex-related growth patterns in a caecilian amphibian (genus \emph{Ichthyophis}): evidence from laboratory data}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {262}, ' ...
'pages = {173--178}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KupfNabh2004'; type = 'Article'; bib = [ ... 
'author = {Kupfer, A. and Nabhitabhata, J. and Himstedt, W.}, ' ... 
'year = {2004}, ' ...
'title = {Reproductive ecology of female caecilian amphibians (genus \emph{Ichthyophis}): a baseline study}, ' ...
'journal = {Biol. J. Linnean Soc.}, ' ...
'volume = {83}, ' ...
'pages = {207--217}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SaraSara1890'; type = 'Book'; bib = [ ... 
'author = {Sarasin, P. and Sarasin, F.}, ' ... 
'year = {1890}, ' ...
'title = {Ergebnisse naturwissenschaftlicher {F}orschungen auf {C}eylon in den {J}aren 1884-1886. {B}and II: {Z}ur {E}ntwicklungsgeschite und {A}natomie der {C}eylonesischen {B}lindwuehle \emph{Ichthyophis glutinosus}}, ' ...
'publisher = {C. W. Kreidel}, ' ...
'address = {Wiesbaden}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

