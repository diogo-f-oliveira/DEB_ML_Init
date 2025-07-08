function [data, auxData, metaData, txtData, weights] = mydata_Paralabrax_clathratus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Paralabrax_clathratus'; 
metaData.species_en = 'Kelp bass'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp','jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 31];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 31];

%% set data
% zero-variate data

data.ab = 10.5; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(14.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 34 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(14.8); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 35;       units.Lp  = 'cm';  label.Lp  = 'std length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 72;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.7e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 478;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00933*Lp^3.05, see F1';
data.Wwi = 4313;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00933*Li^3.05, see F1; max published weight 7 kg';
 
data.Ri = 2560000/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';    bibkey.Ri = 'fishbase';
  temp.Ri = C2K(14.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% length at t-length at t+1yr
data.LL = [ ... % total length at t (inch), total length at t + 1 yr (inch)
7.015	8.057
7.440	10.126
7.441	9.845
7.457	10.628
7.460	10.006
7.465	9.083
7.680	9.445
7.701	9.265
7.722	9.004
7.759	9.626
7.839	9.406
7.915	10.029
7.936	9.647
7.997	9.447
8.210	10.371
8.234	9.408
8.251	10.091
8.271	9.930
8.272	9.810
8.308	10.492
8.411	9.610
8.413	9.209
8.426	10.654
8.431	9.510
8.466	10.473
8.470	9.791
8.481	11.396
8.564	10.654
8.565	10.434
8.628	9.692
8.821	10.756
8.851	12.562
8.896	11.539
8.941	10.376
8.958	11.098
8.960	10.556
8.976	11.279
9.193	11.360
9.195	11.120
9.196	10.879
9.216	10.718
9.217	10.518
9.218	10.397
9.603	12.507
9.615	10.018
9.824	11.906
10.037	12.670
10.183	11.125
10.258	12.029
10.514	12.171
10.526	13.716
10.553	12.351
10.555	11.910
10.693	11.951
10.929	12.193
11.121	13.519
11.128	11.994
11.268	11.673
11.320	13.098
11.365	12.155
11.498	13.260
11.578	12.979
11.716	13.020
11.933	13.162
12.115	12.401
12.547	13.085
13.074	14.453
13.097	13.710
13.314	13.872
13.864	14.638
14.117	15.322
14.138	15.121
14.413	15.464
14.514	15.143
14.690	15.486
16.028	16.737
17.129	18.028
17.367	18.009
20.850	21.340];
data.LL = data.LL*2.54; % convert inch to cm
units.LL   = {'cm', 'cm'};  label.LL = {'total length at t', 'total length at t+1 yr'};  
temp.LL    = C2K(14.8);  units.temp.LL = 'K'; label.temp.LL = 'temperature';
bibkey.LL = 'You1963'; 
        
%% set weights for all real data
weights = setweights(data, []);
weights.LL = 10 * weights.LL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00933*(TL in cm)^3.05'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4CXQT'; % Cat of Life
metaData.links.id_ITIS = '167832'; % ITIS
metaData.links.id_EoL = '46579340'; % Ency of Life
metaData.links.id_Wiki = 'Paralabrax_clathratus'; % Wikipedia
metaData.links.id_ADW = 'Paralabrax_clathratus'; % ADW
metaData.links.id_Taxo = '182783'; % Taxonomicon
metaData.links.id_WoRMS = '282054'; % WoRMS
metaData.links.id_fishbase = 'Paralabrax-clathratus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Paralabrax_clathratus}}';
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
bibkey = 'You1963'; type = 'article'; bib = [ ... 
'author = {Young, P.}, ' ... 
'year = {1963}, ' ...
'title = {The kelp bass (\emph{Paralabrax clathrus}) and its fishery 1947-1958}, ' ...
'journal = {Calif. Fish Game Fish. Bull.}, ' ...
'volume = {122}, ' ...
'pages = {67 p.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Paralabrax-clathratus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

