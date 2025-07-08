  function [data, auxData, metaData, txtData, weights] = mydata_Anguilla_japonica

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Anguilliformes'; 
metaData.family     = 'Anguillidae';
metaData.species    = 'Anguilla_japonica'; 
metaData.species_en = 'Japanese eel'; 

metaData.ecoCode.climate = {'MB', 'Cfb'};
metaData.ecoCode.ecozone = {'MPW', 'THp'};
metaData.ecoCode.habitat = {'0jMpe', 'jpFl', 'jpFp', 'jpFr', 'piMd'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};        
metaData.date_subm  = [2019 02 27];                           
metaData.email      = {'bas.kooijman@vu.nl'};                 
metaData.address    = {'VU University Amsterdam'}; 

metaData.curator    = {'Starrlight Augustine'};
metaData.email_cur  = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc   = [2019 02 27]; 


%% set data
% zero-variate data
data.ts = 120; units.ts = 'd';    label.ts = 'time since birth at end leptocephalus stage';  bibkey.ts = 'TanaKaga2001';   
  temp.ts = C2K(17); units.temp.ts = 'K'; label.temp.ts = 'temperature';
data.am = 12*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'TanaKaga2001';   
  temp.am = C2K(17); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Ls = 6;     units.Ls = 'cm';   label.Ls = 'total length at end leptocephalus stage'; bibkey.Ls = 'TanaKaga2001';
data.Lp = 30;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'Wiki';
  comment.Lp = 'value for Anguila anguilla';
data.Li = 150;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.3e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'CastEdwa2017';
  comment.Wwb = 'based on egg diameter of 1 mm for Anguila anguilla: pi/6*0.1^3';
data.Wwi = 1.9e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  
data.Ri = 1.4e6/(6*365);  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'guess';   
  temp.Ri = C2K(17); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Anguila anguilla';

% uni-variate data
data.tLj = [ ... % age (d), length (cm)
0.089	0.366
0.094	0.340
7.098	0.645
7.412	0.679
7.570	0.697
10.292	0.727
10.299	0.693
10.628	0.653
15.415	0.797
15.421	0.767
15.426	0.740
15.434	0.701
15.722	0.871
15.726	0.849
20.514	0.993
20.518	0.971
20.535	0.884
20.541	0.854
20.683	0.949
20.691	0.910
25.159	1.045
25.166	1.010
25.169	0.993
25.176	0.958
25.187	0.902
25.315	1.067
30.458	1.037
30.588	1.193
30.597	1.145
30.606	1.098
30.648	0.880
30.741	1.233
35.218	1.324
35.438	1.015
35.560	1.215
35.565	1.189
35.591	1.054
35.746	1.080
40.346	1.368
40.362	1.280
40.367	1.259
40.484	1.485
40.652	1.446
40.709	1.150
49.122	1.638
50.095	1.585
50.232	1.707
50.234	1.699
50.239	1.672
50.266	1.533
50.404	1.646
51.204	1.659
51.535	1.611
52.009	1.646
70.258	1.908
70.434	1.825
99.702	2.378
100.379	2.195];
units.tLj = {'d', 'cm'};   label.tLj = {'time since birth', 'length leptocephalus'};  
temp.tLj = C2K(17); units.temp.tLj = 'K'; label.temp.tLj = 'temperature';
bibkey.tLj = {'TanaKaga2001'};
comment.tLj = 'Data for leptocephali';

tLW = [ ... % age (yr), length (cm), weight (g)
    1 17.3   5.9
    2 23.5  16.0
    3 29.0  31.8
    4 33.3  50.0
    5 37.4  73.1
    6 42.0 106.8
    7 46.5 148.9];
tLW(:,1) = 365 * (tLW(:,1) + 0.75);
data.tL = tLW(:,1:2);
units.tL = {'d', 'cm'};   label.tL = {'time since birth', 'length'};  
temp.tL = C2K(17); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'GuanWang1994'};
%
data.tW = tLW(:,[1 3]);
units.tW = {'d', 'g'};   label.tW = {'time since birth', 'wet weight'};  
temp.tW = C2K(17); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = {'GuanWang1994'};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tLj = 8 * weights.tLj;
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures were guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Tranformation of leptocephali to glass eels occurs at 100 to 140 d after birth at TL 6 cm; juveniles reach E Asian estuaries in winter/spring at TL 55 to 60 mm';
metaData.bibkey.F1 = 'TanaKaga2001'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '66R7C'; % Cat of Life
metaData.links.id_ITIS = '161134'; % ITIS
metaData.links.id_EoL = '46561258'; % Ency of Life
metaData.links.id_Wiki = 'Anguilla_japonica'; % Wikipedia
metaData.links.id_ADW = 'Anguilla_japonica'; % ADW
metaData.links.id_Taxo = '42527'; % Taxonomicon
metaData.links.id_WoRMS = '271705'; % WoRMS
metaData.links.id_fishbase = 'Anguilla-japonica'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anguilla_japonica}}';  
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
bibkey = 'GuanWang1994'; type = 'Article'; bib = [ ...  
'author = {Guan, R. and Wang, X. and Ke, G.}, ' ...
'year = {1994}, ' ...
'title = {Glass eels (\emph{Anguilla anguilla}) growth in a recirculating system}, ' ... 
'journal = {Journal of Fish Biology}, ' ...
'volume = {45}, '...
'pages = {653-660}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TanaKaga2001'; type = 'Article'; bib = [ ...  
'author = {H. Tanaka), H. Kagawa, H. Ohta}, ' ...
'year = {2001}, ' ...
'title = {Production of leptocephali of Japanese eel \emph{Anguilla japonica} in captivity}, ' ... 
'journal = {Aquaculture}, ' ...
'volume = {201}, '...
'pages = {51-60}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CastEdwa2017'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Claudia Castellani and Martin Edwards}, ' ...
'year = {2017}, ' ...
'title  = {Marine Plankton: A practical guide to ecology, methodology, and taxonomy}, ' ...
'publisher = {Oxford Univ. Press}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
 bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Anguilla-japonica.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


