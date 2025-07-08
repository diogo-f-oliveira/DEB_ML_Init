function [data, auxData, metaData, txtData, weights] = mydata_Rhincodon_typus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Orectolobiformes'; 
metaData.family     = 'Rhincodontidae';
metaData.species    = 'Rhincodon_typus'; 
metaData.species_en = 'Whale shark'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li';'Ww_L'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2012 07 22];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};  

metaData.author_mod_1   = {'Bas Kooijman'};                             
metaData.date_mod_1 = [2020 10 21];                          
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_1  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};  

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 21]; 

%% set data
% zero-variate data;
data.ab = 0.9*365;  units.ab = 'd';   label.ab = 'age at birth';           bibkey.ab = 'guess';
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'include to check litter interval';
data.tp = 19*365;  units.tp = 'd';   label.tp = 'time since birth at puberty'; bibkey.tp = 'HsuJoun2014';
  temp.tp = C2K(27);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 80*365; units.am = 'd';   label.am = 'life span';                bibkey.am = {'fishbase','HsuJoun2014'};   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 60;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'Wiki';
  comment.Lb = 'Wiki: 40-60 cm; fishbase: 58 to 64 cm';
data.Lp = 915;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'HsuJoun2014';
  comment.Lp = '870 - 960 cm';
data.Lpm = 810;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'HsuJoun2014';
data.Li  = 2000;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase'; 
data.Lim  = 1700;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'fishbase'; 

data.Ww1150 = 7e6; units.Ww1150 = 'g'; label.Ww1150 = 'wet weight at 1150 cm'; bibkey.Ww1150 = 'Wiki';
data.Wwi = 34e6; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 

data.Ri  = 300/730;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time - length
data.tL = [ ... % band pairs (#), total length (cm)
0.000	65.611
6.361	208.242
8.750	361.133
9.734	283.520
9.741	164.235
10.277	323.238
10.546	380.871
10.927	388.793
11.366	315.200
11.523	436.459
11.524	424.531
11.526	388.746
11.639	315.178
11.905	434.441
12.071	380.750
12.129	315.139
12.388	559.651
12.502	470.179
12.506	390.656
12.612	438.361
12.722	418.471
12.730	271.353
12.889	354.840
13.156	462.175
13.164	305.116
13.215	380.659
13.373	478.062
13.642	537.683
13.705	376.644
13.812	404.468
14.025	505.843
14.193	422.331
14.245	472.028
14.295	537.631
14.357	404.425
14.464	434.237
14.520	416.340
14.736	444.156
14.785	553.496
14.790	450.116
14.792	422.283
14.951	495.829
15.228	416.284
15.336	432.180
15.444	456.028
15.493	541.511
15.551	487.829
15.601	573.312
15.604	513.670
15.661	463.963
15.718	424.197
16.041	489.778
16.530	503.656
16.696	467.857
16.846	702.438
17.126	575.179
17.387	781.918
17.516	404.174
17.562	559.240
17.662	726.230
18.325	553.215
18.332	425.978
18.482	668.510
18.597	561.145
18.714	414.019
19.467	582.945
20.393	586.848
20.450	549.070
20.719	604.714
21.646	574.819
25.129	640.149
25.458	598.373
25.509	648.071
26.494	572.446
35.412	836.150
41.722	988.730];
data.tL(:,1) = data.tL(:,1)*365/2; % convert band pair to d
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HsuJoun2014';
comment.tL = 'Time estimate based on 2 vertebral band pairs per yr';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;
weights.tp = 0 * weights.tp;
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_1: males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: tL data added, data reviewed and adapted';
D3 = 'This entry confirms the conclusion of HsuJoun2014 that 2 vertebral band pairs are formed per yr; 1 pair per yr would result in [p_M] becoming too low';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'largest non-mammalian vertebrate';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'dives till 1286 m';
metaData.bibkey.F2 = 'Wiki';
F3 = 'feeds on macro-algae, plankton, krill, Christmas Island red crab larvae and small nektonic life such as small squid or vertebrates'; 
metaData.bibkey.F3 = 'Wiki'; 
F4 = 'ovoviviparous';
metaData.bibkey.F4 = 'Wiki';  
F5 = 'long migrations';
metaData.bibkey.F5 = 'iucn';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4,'F5',F5);

%% Links
metaData.links.id_CoL = '4S7H3'; % Cat of Life
metaData.links.id_ITIS = '159857'; % ITIS
metaData.links.id_EoL = '46559686'; % Ency of Life
metaData.links.id_Wiki = 'Rhincodon_typus'; % Wikipedia
metaData.links.id_ADW = 'Rhincodon_typus'; % ADW
metaData.links.id_Taxo = '41872'; % Taxonomicon
metaData.links.id_WoRMS = '105847'; % WoRMS
metaData.links.id_fishbase = 'Rhincodon-typus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhincodon_typus}}'; 
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
bibkey = 'NormStev2007'; type = 'Article'; bib = [ ...  
'author = {Norman, B. M. and Stevens, J. D.}, ' ...
'year = {2007}, ' ...
'title  = {Size and maturity status of the whale shark (\emph{Rhincodon typus}) at {N}ingaloo {R}eef in {W}estern {A}ustralia}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {84}, ' ...
'pages = {81-86}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HsuJoun2014'; type = 'article'; bib = [ ...
'doi = {10.1071/MF13330}, ' ...
'author = {Hua Hsun Hsu and Shoou Jeng Joung and Robert E. Hueter and Kwang Ming Liu}, ' ...
'year = {2014}, ' ...
'title  = {Age and growth of the whale shark (\emph{Rhincodon typus}) in the north-western {P}acific}, ' ...
'journal = {Marine and Freshwater Research, , , }, ' ...
'volume = {65}, ' ...
'pages = {1145-1154}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'iucn'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.iucnredlist.org/details/19488/0}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'arkive'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.arkive.org/whale-shark/rhincodon-typus/}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Rhincodon_typus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Rhincodon-typus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 