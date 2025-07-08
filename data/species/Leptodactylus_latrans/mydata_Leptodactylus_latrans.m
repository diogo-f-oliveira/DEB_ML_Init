function [data, auxData, metaData, txtData, weights] = mydata_Leptodactylus_latrans
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Leptodactylidae';
metaData.species    = 'Leptodactylus_latrans'; 
metaData.species_en = 'Lesser foam frog'; 

metaData.ecoCode.climate = {'Am', 'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf'};
metaData.ecoCode.embryo  = {'Tntm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO','0iCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 14];

%% set data
% zero-variate data

data.aj = 45; units.aj = 'd';    label.aj = 'age at metam';                bibkey.aj = 'Wiki';   
  temp.aj = C2K(27);  units.temp.aj = 'K'; label.temp.aj = 'temperature'; 
data.ap = 365; units.ap = 'd';    label.ap = 'age at puberty';                bibkey.ap = 'LopeAnto2017';   
  temp.ap = C2K(27);  units.temp.ap = 'K'; label.temp.ap = 'temperature'; 
data.am = 5*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'LopeAnto2017';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.98;  units.Lj  = 'cm';  label.Lj  = 'SVL at metam'; bibkey.Lj  = 'guess';
data.Lp  = 6.2;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';   bibkey.Lp  = 'LopeAnto2017';
data.Li  = 10.6;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'LopeAnto2017';
data.Lim = 12;  units.Lim = 'cm';  label.Lim = 'ultimate SVL for males';  bibkey.Lim  = 'LopeAnto2017';

data.Wwb = 1.41e-2; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 3 mm: pi/6*0.3^3';
data.Wwp  = 33;  units.Wwp  = 'g';  label.Wwp  = 'weight at puberty';   bibkey.Wwp  = 'LopeAnto2017';
data.Wwi = 147.15;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'LopeAnto2017';
data.Wwim = 202.55;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'LopeAnto2017';

data.Ri  = 25e2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri  = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Leptodactylus_fallax';

% uni-variate data
% time-length
data.tL = [ ... % LAG (#), SVL (cm)
0	2.076
0	2.232
0	2.310
0	2.466
0	2.544
0	2.583
0	2.700
0	2.778
0	2.895
0	3.012
0	3.285
0	3.382
1	7.176
1	7.332
1	4.564
1	6.552
1	6.630
1	7.585
1	7.761
1	8.384
1	8.560
1	8.677
1   8.755
1   8.930
1	9.008
1	9.301
1	9.418
1	9.573
1	9.788
1	10.996
1	5.421
1	8.092
1	10.002
2	9.702
2	9.780
2	9.858
2	7.304
2	8.065
2	8.260
2	8.474
2	8.630
2	8.669
2	8.825
2	9.117
2	9.215
2	9.488
2	10.072
2	10.248
2	10.521
2	10.618
2	10.755
2	6.700
2	10.989
2	11.963
2	4.634
2	7.480
2	11.417
2	11.164
3	9.538
3	10.026
3	10.221
3	10.338
3	10.416
3	10.571
4	9.004
4	9.570
4	9.920
4	10.993
5	11.238
5	9.152];
data.tL(:,1) = (data.tL(:,1) + 0.2) * 365; % convert LAG to d
units.tL   = {'d', 'cm'};  label.tL = {'time', 'SVL'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'LopeAnto2017'; treat.tL = {1, {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Males dig a burrow and make foam nest in ; tadpoles are fed with unfertilized eggs'; 
metaData.bibkey.F1 = 'Wiki';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3TN5N'; % Cat of Life
metaData.links.id_ITIS = '1098901'; % ITIS
metaData.links.id_EoL = '46395320'; % Ency of Life
metaData.links.id_Wiki = 'Leptodactylus_latrans'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '1396619'; % Taxonomicon
metaData.links.id_WoRMS = '1389975'; % WoRMS
metaData.links.id_amphweb = 'Leptodactylus+latrans'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Leptodactylus_latrans}}';
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
bibkey = 'LopeAnto2017'; type = 'Article'; bib = [ ...  
'author = {Javier A. L\''{o}pez and Carolina E. Antoniazzi and Roxana E. Llanes and Romina Ghirardi}, ' ...
'year = {2017}, ' ...
'title  = {Age structure, growth pattern, sexual maturity, and longevity of \emph{Leptodactylus latrans} ({A}nura: {L}eptodactylidae) in temperate wetlands}, ' ...
'journal = {Amphibia-Reptilia}, ' ...
'volme = {38}, ' ...
'pages = {371-379}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Leptodactylus+latrans}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/46395320}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

