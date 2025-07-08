function [data, auxData, metaData, txtData, weights] = mydata_Gymnura_altavela
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Gymnuridae';
metaData.species    = 'Gymnura_altavela'; 
metaData.species_en = 'Spiny butterfly ray'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW','MAE'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 26];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 6*30.5;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'fishbase';    
  temp.ab = C2K(23.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 18*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'ParsMais2008';   
  temp.am = C2K(23.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 32;   units.Lb  = 'cm';  label.Lb  = 'disc width at birth';   bibkey.Lb  = 'AlkuAli2014';
  comment.Lb = '28.1 - 36.7 cm';
data.Lp = 96.1;   units.Lp  = 'cm';  label.Lp  = 'disc width at puberty'; bibkey.Lp  = 'AlkuAli2014'; 
data.Lpm = 77.1;   units.Lpm  = 'cm';  label.Lpm  = 'disc width at puberty for males'; bibkey.Lpm  = 'AlkuAli2014'; 
data.Li  = 400;  units.Li  = 'cm';  label.Li  = 'ultimate disc width';   bibkey.Li  = 'fishbase'; 

data.Ri  = 5.5/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(23.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4-7 pups per litter, 1 litter per yr';
  
% univariate data
% time - length
data.tL_f = [ ... % time since birth (yr), disc width (cm)
0.025	52.636
0.038	59.686
0.994	68.786
6.992	139.557
7.013	109.706
7.036	167.748
8.027	157.777
8.029	163.167
9.067	187.607
9.069	190.923
10.061	184.269
10.063	189.244
10.991	186.323
11.018	172.226
12.048	177.595
13.054	203.693
18.133	214.782];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f  = {'d','cm'}; label.tL_f  = {'time since birth','disc width','female'}; 
temp.tL_f = C2K(23.6); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'ParsMais2008';  
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), disc width (cm)
0.000	54.296
1.025	63.395
1.053	52.201
1.986	61.302
1.987	63.790
1.989	69.180
2.017	56.741
2.953	75.793
2.988	80.353
3.956	95.673
4.991	111.406
4.992	115.966
5.031	130.062
5.032	132.964
5.055	107.259
6.012	93.557
6.053	113.457
6.055	119.261
6.956	132.509
6.987	126.290
7.010	100.999
7.011	105.560
7.021	129.606
7.023	134.996
7.050	119.655
8.075	110.513
10.970	135.328];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m  = {'d','cm'}; label.tL_m  = {'time since birth','disc width','male'}; 
temp.tL_m = C2K(23.6); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'ParsMais2008';  
comment.tL_m = 'Data for males';

% length - weight
data.LWw_f = [ ... % disc width (cm), wet weight (g)
43.295	1401.046
54.928	1576.179
57.141	2276.706
58.802	2451.839
59.364	875.653
61.571	2626.965
61.576	1751.313
63.237	1926.439
64.340	2802.099
66.556	2802.099
67.114	2101.572
69.327	2626.965
70.430	3502.625
73.755	3327.492
110.275	11558.669
139.566	24518.384
144.556	23817.865
156.681	35201.401
163.302	40105.080
170.480	44483.361
173.769	50788.089
176.448	67250.437
176.998	67950.963
184.201	67950.963
184.279	53765.321
187.513	70052.539
188.080	67775.833
188.646	65499.124
190.903	58143.606
202.988	76882.662
214.601	80735.552];
units.LWw_f  = {'cm','g'}; label.LWw_f  = {'disc width','wet weight','female'}; 
bibkey.LWw_f  = 'ParsMais2008';  
comment.LWw_f = 'Data for females';
%
data.LWw_m = [ ... % disc width (cm), wet weight (g)
51.096	1576.179
53.317	2101.572
53.320	1050.786
54.705	2451.839
56.650	2101.572
56.930	1225.920
58.874	1576.179
60.540	1576.179
62.204	2626.965
62.762	1751.313
64.983	2101.572
66.649	2451.839
69.704	2802.099
77.755	4378.278
80.531	4903.678
97.171	14711.035
102.455	12259.196
106.072	10332.750
107.450	14185.635
108.013	11383.536
111.062	13660.242
111.623	11908.929
112.716	18213.660
114.120	12784.589
116.340	13835.375
117.171	14535.902
119.935	19614.706
119.949	14535.902
122.439	18038.527
124.393	14535.902
125.769	19264.446
126.057	15586.688
126.885	17513.134
127.973	25744.304
128.547	19264.446
129.653	21190.893
131.322	20140.107
131.595	22066.545
133.545	19964.973
134.649	22416.812
136.599	20490.366];
units.LWw_m  = {'cm','g'}; label.LWw_m  = {'disc width','wet weight','male'}; 
bibkey.LWw_m  = 'ParsMais2008';  
comment.LWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LWw_f','LWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'The cost for milk secretion is added to the investment from the reproduction buffer.';
D2 = 'Males are supposed to differ from females by {p_Am} and E_Hp only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'At first, they are enclosed in an egg case while the developing embryos feed on the yolk. After the egg hatches, the pup remains in the oviduct and receives nourishment from a milky secretion';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3HVPT'; % Cat of Life
metaData.links.id_ITIS = '160961'; % ITIS
metaData.links.id_EoL = '46560966'; % Ency of Life
metaData.links.id_Wiki = 'Gymnura_altavela'; % Wikipedia
metaData.links.id_ADW = 'Gymnura_altavela'; % ADW
metaData.links.id_Taxo = '42152'; % Taxonomicon
metaData.links.id_WoRMS = '105856'; % WoRMS
metaData.links.id_fishbase = 'Gymnura-altavela'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gymnura_altavela}}';   
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Gymnura-altavela}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ParsMais2008'; type = 'article'; bib = [ ...  
'doi = {10.1007/s10641-017-0687-x}, ' ...
'author = {K. T. Parsons and J. Maisano and J. Gregg and C. F. Cotton and R. J. Latour}, ' ...
'title = {Age and growth assessment of western {N}orth {A}tlantic spiny butterfly ray \emph{Gymnura altavela} ({L}. 1758) using computed tomography of vertebral centra}, ' ...
'year = {2008}, ' ...
'journal = {Environ Biol Fish}, '...
'volume = {74}, ' ...
'pages = {736-742}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AlkuAli2014'; type = 'article'; bib = [ ...  
'doi = {10.3750/AIP2014.44.3.07}, ' ...
'author = {Hasan Alkusairy and Malek Ali and  Adib Saad and Christian Reynaud and Christian Capap\''{e}}, ' ...
'title = {MATURITY, REPRODUCTIVE CYCLE, AND FECUNDITY OF SPINY BUTTERFLY RAY, \emph{Gymnura altavela} ({E}LASMOBRANCHII: {R}AJIFORMES: {G}YMNURIDAE), FROM THE COAST OF {S}YRIA ({E}ASTERN {M}EDITERRANEAN)}, ' ...
'year = {2014}, ' ...
'journal = {Acta Ichthyologica et Piscatoria}, '...
'volume = {44(3)}, ' ...
'pages = {229-240}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

