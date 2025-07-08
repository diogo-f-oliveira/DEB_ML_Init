function [data, auxData, metaData, txtData, weights] = mydata_Pomadasys_jubelini
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Haemulidae';
metaData.species    = 'Pomadasys_jubelini'; 
metaData.species_en = 'Sompat grunt'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr', 'jpMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 02];

%% set data
% zero-variate data

data.ab = 4;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(25.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'value for Lutjanus vitta';
data.am = 10*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(25.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 13.1; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 60;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of L. stellatus: 4/3*pi*0.0425^3'; 
data.Wwp = 29.5; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on length-weight of 0.01380*Lp^2.98, see F1';
data.Wwi = 2746; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on length-weight of 0.01380*Li^2.98, see F1';
  
% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    0 10.0  6.5
    1 31.5 26.5
    2 40.5 34.4
    3 47.5 38.5
    4 55.0 44.6];
data.tL_fm(:,1) = 365 * (0.5 + data.tL_fm(:,1));  % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(25.4);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Agbu2014'; treat.tL_fm = {1 {'females','males'}};

% length-fecundity
data.LN = [ ... % fork length (cm), fecundity (#)
14.167	49470.756
14.311	57827.306
14.494	59498.619
14.677	58941.510
15.898	54484.695
16.122	58941.510
17.101	76768.813
17.281	52256.273
17.305	85125.363
17.506	63955.434
18.548	97938.728
18.792	99052.932
18.831	77883.017
18.850	67298.060
18.873	94039.008
19.036	98495.837
19.137	87910.865
19.138	94039.008
19.259	84568.254
19.278	77883.017
19.382	95710.321
19.481	65069.652
19.524	89025.084
19.629	123565.472
19.915	134707.524
19.975	123565.472
19.977	140835.659
19.996	130250.709
20.095	97381.619
20.200	137493.041
20.221	140278.557
20.242	149749.311
20.337	84011.145
20.362	130250.709
20.446	146963.794
20.485	135264.626
20.547	143621.176
20.566	125793.880
20.609	154763.235
20.669	145849.591
20.687	118551.534
20.786	89025.084
20.807	102952.652
20.833	153649.031
20.851	132479.117
20.910	111309.202
20.950	107966.576
21.010	94039.008
21.054	124122.567
21.055	135264.626
21.158	146963.794
21.176	124122.567
21.192	82339.847
21.212	78440.126
21.215	111866.297
21.217	133036.226
21.274	88467.975
21.379	122451.268
21.398	102952.652
21.417	93481.899
21.417	96267.415
21.620	85125.363
21.725	115766.032
21.763	94596.102
21.807	124122.567
21.906	99052.932
22.134	135821.735
22.338	144735.380
22.360	161448.472
22.702	125236.771
22.886	134150.422
23.048	121894.159
23.069	124122.567
23.097	199888.581
23.211	126350.989
23.214	154206.133
23.301	211030.644
23.310	100167.136
23.314	134150.422
23.433	107409.482
23.457	136378.837
23.478	146406.693
23.576	106295.278
23.656	96267.415
23.704	166462.403
23.743	149192.202
23.764	157548.752
23.846	164233.989
23.947	158105.854
24.043	97381.619
24.152	175933.150
24.187	116880.235
24.296	188189.420
24.310	125236.771
24.413	138607.245
24.495	137493.041
24.500	188746.522
24.536	145292.482
24.541	198217.272
24.557	148635.100
24.679	152534.820
24.698	137493.041
24.700	156434.548
24.725	199888.581
24.735	101838.448
24.778	127465.193
24.842	147520.896
24.879	112980.515
24.919	104066.856
24.943	147520.896
24.950	209916.437
24.965	162562.676
25.021	108523.685
25.027	171476.328
25.145	129693.600
25.252	181504.183
25.292	172590.531
25.309	140835.659
25.695	135821.735
25.940	146963.794
26.327	145849.591
26.529	131364.913];
units.LN   = {'cm', '#'};  label.LN = {'fork length', 'fecundity'};  
temp.LN    = C2K(25.4);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'MarcKona2013';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Wwp = 0 * weights.Wwp;
weights.ab = 0 * weights.ab;
weights.Wwi = 3 * weights.Wwi;
weights.Li = 3 * weights.Li;
weights.Lp = 3 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01380*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4LQLF'; % Cat of Life
metaData.links.id_ITIS = '169101'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Pomadasys'; % Wikipedia
metaData.links.id_ADW = 'Pomadasys_jubelini'; % ADW
metaData.links.id_Taxo = '184493'; % Taxonomicon
metaData.links.id_WoRMS = '273507'; % WoRMS
metaData.links.id_fishbase = 'Pomadasys-jubelini'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pomadasys}}';
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
bibkey = 'Agbu2014'; type = 'phdthesis'; bib = [ ... 
'author = {MarianOnwude Agbugui}, ' ... 
'year = {2014}, ' ...
'title = {The biology of the sompat grunt, \emph{Pomadasys jubelini} ({C}uvier, 1830) in the new {C}alabar-{B}onny {R}iver, {R}iver {S}tate, {N}igeria}, ' ...
'school = {Ahmadu Bello University, Zaria}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MarcKona2013'; type = 'Article'; bib = [ ... 
'author = {Bodji Iridj\''{e} Marcelle and Kouadio Justin Konan and Alla Yao Laurent and Ouattara Nahoua Issa and Ats\''{E} Boua C\''{e}lestin}, ' ... 
'year = {2013}, ' ...
'title = {Reproductive biology of the Sompat grunt, \emph{Pomadasys jubelini} ({C}uvier, 1830) in C\^{o}te d''Ivoire lagoons complex ({W}est {A}frica)}, ' ...
'journal = {Journal of Applied Biosciences}, ' ...
'volume = {72}, ' ...
'pages = {5855–5868}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pomadasys-jubelini.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
